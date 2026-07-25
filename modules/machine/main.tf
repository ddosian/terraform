# DNS Records
resource "adguard_rewrite" "record" {
  domain = var.hostname
  answer = var.ip_address
}

resource "adguard_rewrite" "wildcard_record" {
  domain = "*.${var.hostname}"
  answer = var.hostname
}

# Dockhand Environment
resource "dockhand_environment" "dockhand_environment" {
  name            = var.name
  connection_type = "direct"
  host            = var.hostname

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = var.ca_cert
  client_cert     = var.client_cert
  client_key      = var.client_key
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "uptimekuma_monitor" {
  name           = var.name
  hostname       = var.hostname
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.proxmox-ve_monitor_group.id
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "ca_authentik_key_pair" {
  name             = "${var.name}-ca"
  certificate_data = var.ca_cert
  lifecycle {
    ignore_changes = [certificate_data, key_data]
  }
}

resource "authentik_certificate_key_pair" "client_authentik_key_pair" {
  name             = "${var.name}-client"
  certificate_data = var.client_cert
  key_data         = var.client_key
  lifecycle {
    ignore_changes = [certificate_data, key_data]
  }
}


# Authentik Service Connection and Outpost
resource "authentik_service_connection_docker" "authentik_service_connection" {
  name               = var.name
  url                = "https://${var.hostname}:2376"
  tls_verification   = authentik_certificate_key_pair.ca_authentik_key_pair.id
  tls_authentication = authentik_certificate_key_pair.client_authentik_key_pair.id
}

resource "authentik_outpost" "authentik_outpost" {
  name = var.name
  protocol_providers = [
    authentik_provider_proxy.traefik-authentik_provider.id
  ]
  config = jsonencode({
    log_level                        = "info"
    docker_labels                    = null
    authentik_host                   = "https://auth.dontddos.me/"
    docker_network                   = "frontend"
    container_image                  = null
    docker_map_ports                 = true
    refresh_interval                 = "minutes=5"
    kubernetes_replicas              = 1
    kubernetes_namespace             = "authentik"
    authentik_host_browser           = ""
    object_naming_template           = "ak-outpost-%(name)s"
    authentik_host_insecure          = false
    kubernetes_json_patches          = null
    kubernetes_service_type          = "ClusterIP"
    kubernetes_ingress_path_type     = null
    kubernetes_image_pull_secrets    = []
    kubernetes_ingress_class_name    = null
    kubernetes_disable_x509_strict   = false
    kubernetes_disabled_components   = []
    kubernetes_ingress_annotations   = {}
    kubernetes_ingress_secret_name   = "authentik-outpost-tls"
    kubernetes_httproute_annotations = {}
    kubernetes_httproute_parent_refs = []
  })
  service_connection = authentik_service_connection_docker.authentik_service_connection.id
  lifecycle {
    ignore_changes = [protocol_providers]
  }
}

resource "netbox_device" "pve-prod-01_netbox_device" {
  name           = "PVE-Prod-01"
  device_type_id = netbox_device_type.hpe_proliant_dl360_gen9.id
  role_id        = netbox_device_role.virtualization.id
  site_id        = netbox_site.home.id
  rack_id        = netbox_rack.main.id
  rack_position  = 10
  rack_face      = "front"
  status         = "active"
}

resource "authentik_provider_proxy" "traefik-pve-prod-01_authentik_provider" {
  name               = "Provider for Traefik (pve-prod-01)"
  external_host      = "https://traefik.pve-prod-01.internal.dontddos.me"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.explicit-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
}

resource "authentik_application" "traefik-pve-prod-01_authentik_application" {
  name              = "Traefik (PVE-Prod-01)"
  slug              = "traefik-pve-prod-01"
  protocol_provider = authentik_provider_proxy.traefik-pve-prod-01_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/traefik.svg"
  group             = "Networking"
}

resource "authentik_policy_binding" "traefik-pve-prod-01_lab-admins_authentik_policy_binding" {
  target = authentik_application.traefik-pve-prod-01_authentik_application.uuid
  group  = data.authentik_group.lab_admins.id
  order  = 0
}
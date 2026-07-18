# DNS Records
resource "adguard_rewrite" "pve-prod-02_record" {
  domain = "pve-prod-02.internal.dontddos.me"
  answer = "10.77.0.12"
}
resource "adguard_rewrite" "pve-prod-02_wildcard_record" {
  domain = "*.pve-prod-02.internal.dontddos.me"
  answer = "pve-prod-02.internal.dontddos.me"
}

# Dockhand Environment
resource "dockhand_environment" "pve-prod-02_dockhand_environment" {
  name            = "pve-prod-02"
  connection_type = "direct"
  host            = "pve-prod-02.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = file("${path.module}/../ansible/docker-keys/pve-prod-02/ca.pem")
  client_cert     = file("${path.module}/../ansible/docker-keys/pve-prod-02/cert.pem")
  client_key      = file("${path.module}/../ansible/docker-keys/pve-prod-02/key.pem")
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "pve-prod-02_uptimekuma_monitor" {
  name           = "PVE-Prod-02"
  hostname       = "pve-prod-02.internal.dontddos.me"
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
resource "authentik_certificate_key_pair" "pve-prod-02-ca_authentik_key_pair" {
  name             = "pve-prod-02-ca"
  certificate_data = file("${path.module}/../ansible/docker-keys/pve-prod-02/ca.pem")
  lifecycle {
    ignore_changes = [key_data]
  }
}

resource "authentik_certificate_key_pair" "pve-prod-02-client_authentik_key_pair" {
  name             = "pve-prod-02-client"
  certificate_data = file("${path.module}/../ansible/docker-keys/pve-prod-02/cert.pem")
  key_data         = file("${path.module}/../ansible/docker-keys/pve-prod-02/key.pem")
}

# Authentik Service Connection and Outpost
resource "authentik_service_connection_docker" "pve-prod-02_authentik_service_connection" {
  name               = "pve-prod-02"
  url                = "https://pve-prod-02.internal.dontddos.me:2376"
  tls_verification   = authentik_certificate_key_pair.pve-prod-02-ca_authentik_key_pair.id
  tls_authentication = authentik_certificate_key_pair.pve-prod-02-client_authentik_key_pair.id
}

resource "authentik_outpost" "pve-prod-02_authentik_outpost" {
  name = "pve-prod-02"
  protocol_providers = [
    authentik_provider_proxy.traefik-pve-prod-02_authentik_provider.id
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
  service_connection = authentik_service_connection_docker.pve-prod-02_authentik_service_connection.id
  lifecycle {
    ignore_changes = [protocol_providers]
  }
}

resource "netbox_device" "pve-prod-02_netbox_device" {
  name           = "PVE-Prod-02"
  device_type_id = netbox_device_type.hpe_proliant_dl360p_gen8.id
  role_id        = netbox_device_role.virtualization.id
  site_id        = netbox_site.home.id
  rack_id        = netbox_rack.main.id
  rack_position  = 8
  rack_face      = "front"
  status         = "active"
}
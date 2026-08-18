module "nc-prod-01_vm" {
  source = "./modules/virtual-machine"

  name       = "nc-prod-01"
  id         = 122
  host       = "pve-prod-01"
  vlan_tag   = 78
  ip_address = "10.78.1.122/16"
  gateway    = "10.78.0.3"

  monitor_group = uptimekuma_monitor_group.vms_monitor_group.id
}


# Dockhand Environment
resource "dockhand_environment" "nc-prod-01_dockhand_environment" {
  name            = "nc-prod-01"
  connection_type = "direct"
  host            = "nc-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = local.nc-prod-01_ca
  client_cert     = local.nc-prod-01_cert
  client_key      = local.nc-prod-01_key
  icon            = "server"
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "nc-prod-01-ca_authentik_key_pair" {
  name             = "nc-prod-01-ca"
  certificate_data = local.nc-prod-01_ca
  lifecycle {
    ignore_changes = [certificate_data, key_data]
  }
}

resource "authentik_certificate_key_pair" "nc-prod-01-client_authentik_key_pair" {
  name             = "nc-prod-01-client"
  certificate_data = local.nc-prod-01_cert
  key_data         = local.nc-prod-01_key
  lifecycle {
    ignore_changes = [certificate_data, key_data]
  }
}

# Authentik Service Connection and Outpost
resource "authentik_service_connection_docker" "nc-prod-01_authentik_service_connection" {
  name               = "nc-prod-01"
  url                = "https://nc-prod-01.internal.dontddos.me:2376"
  tls_verification   = authentik_certificate_key_pair.nc-prod-01-ca_authentik_key_pair.id
  tls_authentication = authentik_certificate_key_pair.nc-prod-01-client_authentik_key_pair.id
}

resource "authentik_outpost" "nc-prod-01_authentik_outpost" {
  name = "nc-prod-01"
  protocol_providers = [
    authentik_provider_proxy.traefik-nc-prod-01_authentik_provider.id
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
  service_connection = authentik_service_connection_docker.nc-prod-01_authentik_service_connection.id
  lifecycle {
    ignore_changes = [protocol_providers]
  }
}

resource "authentik_provider_proxy" "traefik-nc-prod-01_authentik_provider" {
  name               = "Provider for Traefik (nc-prod-01)"
  external_host      = "https://traefik.nc-prod-01.internal.dontddos.me"
  mode               = "forward_single"
  authorization_flow = data.authentik_flow.explicit-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
}

resource "authentik_application" "traefik-nc-prod-01_authentik_application" {
  name              = "Traefik (TS-Prod-01)"
  slug              = "traefik-nc-prod-01"
  protocol_provider = authentik_provider_proxy.traefik-nc-prod-01_authentik_provider.id
  meta_icon         = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/svg/traefik.svg"
  group             = "Networking"
}

resource "authentik_policy_binding" "traefik-nc-prod-01_lab-admins_authentik_policy_binding" {
  target = authentik_application.traefik-nc-prod-01_authentik_application.uuid
  group  = data.authentik_group.lab_admins.id
  order  = 0
}

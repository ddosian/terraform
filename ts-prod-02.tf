resource "adguard_rewrite" "ts-prod-02_record" {
  domain = "ts-prod-02.internal.dontddos.me"
  answer = "10.77.1.119"
}
resource "adguard_rewrite" "ts-prod-02_wildcard_record" {
  domain = "*.ts-prod-02.internal.dontddos.me"
  answer = "ts-prod-02.internal.dontddos.me"
}

resource "uptimekuma_monitor_ping" "ts-prod-02_uptimekuma_monitor" {
  name           = "TS-Prod-02"
  hostname       = "ts-prod-02.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.routing_monitor_group.id
}

variable "ts-prod-02_password" {
  description = "Password for the ts-prod-02 LXC container"
  type        = string
  sensitive   = true
}

resource "proxmox_lxc_guest" "ts-prod-02" {
  name         = "ts-prod-02"
  power_state  = "running"
  target_node  = "pve-prod-02"
  unprivileged = true
  password     = var.ts-prod-02_password
  template {
    file    = "debian-13-standard_13.1-2_amd64.tar.zst"
    storage = "local"
  }
  cpu {
    cores = 1
  }
  features {
    unprivileged {
      nesting = true
    }
  }
  memory = 1024
  swap   = 512
  root_mount {
    size    = "8G"
    storage = "pve-prod-02-data-01"
  }
  network {
    id           = 0
    name         = "eth0"
    bridge       = "vmbr1"
    ipv4_address = "10.77.1.119/16"
    ipv4_gateway = "10.77.0.1"
  }
  ssh_public_keys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINQTU6Zw3pqHCDS+MUBXVEDPeDdtstFpK+8SVXN71QG/ admin@dontddos.me Jun 2026
    EOF
  startup_shutdown {}
  lifecycle {
    ignore_changes = [mounts]
  }
}


# Dockhand Environment
resource "dockhand_environment" "ts-prod-02_dockhand_environment" {
  name            = "ts-prod-02"
  connection_type = "direct"
  host            = "ts-prod-02.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = file("${path.module}/../ansible/docker-keys/ts-prod-02/ca.pem")
  client_cert     = file("${path.module}/../ansible/docker-keys/ts-prod-02/cert.pem")
  client_key      = file("${path.module}/../ansible/docker-keys/ts-prod-02/key.pem")
  icon            = "server"
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "ts-prod-02-ca_authentik_key_pair" {
  name             = "ts-prod-02-ca"
  certificate_data = file("${path.module}/../ansible/docker-keys/ts-prod-02/ca.pem")
  lifecycle {
    ignore_changes = [key_data]
  }
}

resource "authentik_certificate_key_pair" "ts-prod-02-client_authentik_key_pair" {
  name             = "ts-prod-02-client"
  certificate_data = file("${path.module}/../ansible/docker-keys/ts-prod-02/cert.pem")
  key_data         = file("${path.module}/../ansible/docker-keys/ts-prod-02/key.pem")
}

# Authentik Service Connection and Outpost
resource "authentik_service_connection_docker" "ts-prod-02_authentik_service_connection" {
  name               = "ts-prod-02"
  url                = "https://ts-prod-02.internal.dontddos.me:2376"
  tls_verification   = authentik_certificate_key_pair.ts-prod-02-ca_authentik_key_pair.id
  tls_authentication = authentik_certificate_key_pair.ts-prod-02-client_authentik_key_pair.id
}

resource "authentik_outpost" "ts-prod-02_authentik_outpost" {
  name = "ts-prod-02"
  protocol_providers = [
    authentik_provider_proxy.traefik-ts-prod-02_authentik_provider.id
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
  service_connection = authentik_service_connection_docker.ts-prod-02_authentik_service_connection.id
  lifecycle {
    ignore_changes = [protocol_providers]
  }
}

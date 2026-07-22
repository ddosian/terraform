# DNS Records
resource "adguard_rewrite" "immich-prod-01_record" {
  domain = "immich-prod-01.internal.dontddos.me"
  answer = "10.78.1.120"
}

resource "adguard_rewrite" "immich-prod-01_wildcard_record" {
  domain = "*.immich-prod-01.internal.dontddos.me"
  answer = "immich-prod-01.internal.dontddos.me"
}

# Cloudflare DNS records
resource "cloudflare_dns_record" "immich-prod-01_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "immich.dontddos.me"
  ttl     = 1
  type    = "CNAME"
  comment = "Managed by Terraform"
  content = "vps-prod-01.dontddos.me"
  proxied = false
}

# Dockhand Environment
resource "dockhand_environment" "immich-prod-01_dockhand_environment" {
  name            = "immich-prod-01"
  connection_type = "direct"
  host            = "immich-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = file("${path.module}/../ansible/docker-keys/immich-prod-01/ca.pem")
  client_cert     = file("${path.module}/../ansible/docker-keys/immich-prod-01/cert.pem")
  client_key      = file("${path.module}/../ansible/docker-keys/immich-prod-01/key.pem")
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "immich-prod-01_uptimekuma_monitor" {
  name           = "Immich-Prod-01"
  hostname       = "immich-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.vms_monitor_group.id
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "immich-prod-01-ca_authentik_key_pair" {
  name             = "immich-prod-01-ca"
  certificate_data = file("${path.module}/../ansible/docker-keys/immich-prod-01/ca.pem")
  lifecycle {
    ignore_changes = [key_data]
  }
}

resource "authentik_certificate_key_pair" "immich-prod-01-client_authentik_key_pair" {
  name             = "immich-prod-01-client"
  certificate_data = file("${path.module}/../ansible/docker-keys/immich-prod-01/cert.pem")
  key_data         = file("${path.module}/../ansible/docker-keys/immich-prod-01/key.pem")
}

# Authentik Service Connection and Outpost
resource "authentik_service_connection_docker" "immich-prod-01_authentik_service_connection" {
  name               = "immich-prod-01"
  url                = "https://immich-prod-01.internal.dontddos.me:2376"
  tls_verification   = authentik_certificate_key_pair.immich-prod-01-ca_authentik_key_pair.id
  tls_authentication = authentik_certificate_key_pair.immich-prod-01-client_authentik_key_pair.id
}

resource "authentik_outpost" "immich-prod-01_authentik_outpost" {
  name = "immich-prod-01"
  protocol_providers = [
    authentik_provider_proxy.traefik-immich-prod-01_authentik_provider.id
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
  service_connection = authentik_service_connection_docker.immich-prod-01_authentik_service_connection.id
  lifecycle {
    ignore_changes = [protocol_providers]
  }
}

# Proxmox VM
resource "proxmox_vm_qemu" "immich-prod-01_proxmox_vm" {
  name        = "immich-prod-01"
  description = "Managed by Terraform"
  vmid        = 120
  target_node = "pve-prod-01"
  agent       = 1
  clone       = "debian-13"

  memory = 4096

  cpu {
    cores   = 4
    sockets = 1
    type    = "host"
  }

  network {
    id     = 0
    bridge = "vmbr1"
    model  = "virtio"
    tag    = 78
  }

  vga {
    type = "std"
  }

  boot     = "order=scsi0"
  bootdisk = "scsi0"

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = "pve-prod-01-data-01"
        }
      }
    }

    scsi {
      scsi0 {
        disk {
          storage = "pve-prod-01-data-01"
          size    = "32G"
        }
      }
    }
  }

  os_type    = "cloud-init"
  ipconfig0  = "ip=10.78.1.120/16,gw=10.78.0.3"
  nameserver = "10.77.1.103"
  ciuser     = "ddos"
  sshkeys    = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINQTU6Zw3pqHCDS+MUBXVEDPeDdtstFpK+8SVXN71QG/ admin@dontddos.me Jun 2026
  EOF

  lifecycle {
    ignore_changes = [
      bootdisk,
      vm_state,
      startup_shutdown,
    ]
  }
}
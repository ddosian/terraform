# DNS Records
resource "adguard_rewrite" "gl-runner-prod-01_record" {
  domain = "gl-runner-prod-01.internal.dontddos.me"
  answer = "10.77.1.117"
}

# Dockhand Environment
resource "dockhand_environment" "gl-runner-prod-01_dockhand_environment" {
  name            = "gl-runner-prod-01"
  connection_type = "direct"
  host            = "gl-runner-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = file("${path.module}/../ansible/docker-keys/gl-runner-prod-01/ca.pem")
  client_cert     = file("${path.module}/../ansible/docker-keys/gl-runner-prod-01/cert.pem")
  client_key      = file("${path.module}/../ansible/docker-keys/gl-runner-prod-01/key.pem")
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "gl-runner-prod-01_uptimekuma_monitor" {
  name           = "GL-Runner-Prod-01"
  hostname       = "gl-runner-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "gl-runner-prod-01-ca_authentik_key_pair" {
  name             = "gl-runner-prod-01-ca"
  certificate_data = file("${path.module}/../ansible/docker-keys/gl-runner-prod-01/ca.pem")
}

resource "authentik_certificate_key_pair" "gl-runner-prod-01-client_authentik_key_pair" {
  name             = "gl-runner-prod-01-client"
  certificate_data = file("${path.module}/../ansible/docker-keys/gl-runner-prod-01/cert.pem")
  key_data         = file("${path.module}/../ansible/docker-keys/gl-runner-prod-01/key.pem")
}

# Proxmox VM
resource "proxmox_vm_qemu" "gl-runner-prod-01_proxmox_vm" {
  name        = "gl-runner-prod-01"
  description = "Managed by Terraform"
  vmid        = 117
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
  ipconfig0  = "ip=10.77.1.117/16,gw=10.77.0.1"
  nameserver = "10.77.1.103"
  ciuser     = "ddos"
  sshkeys    = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINQTU6Zw3pqHCDS+MUBXVEDPeDdtstFpK+8SVXN71QG/ admin@dontddos.me Jun 2026
  EOF
}
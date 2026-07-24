resource "adguard_rewrite" "infisical-prod-01_record" {
  domain = "infisical-prod-01.internal.dontddos.me"
  answer = "10.77.1.121"
}
resource "adguard_rewrite" "infisical-prod-01_wildcard_record" {
  domain = "*.infisical-prod-01.internal.dontddos.me"
  answer = "infisical-prod-01.internal.dontddos.me"
}

# Proxmox VM
resource "proxmox_vm_qemu" "infisical-prod-01_proxmox_vm" {
  name        = "infisical-prod-01"
  description = "Managed by Terraform"
  vmid        = 121
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
  ipconfig0  = "ip=10.77.1.121/16,gw=10.78.0.3"
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
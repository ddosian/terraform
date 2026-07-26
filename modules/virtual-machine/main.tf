
# Proxmox VM
resource "proxmox_vm_qemu" "proxmox_vm" {
  name        = var.name
  description = "Managed by Terraform"
  vmid        = var.id
  target_node = var.host
  agent       = 1
  clone       = var.template

  memory = var.memory

  cpu {
    cores   = var.cpu_cores
    sockets = 1
    type    = "host"
  }

  network {
    id     = 0
    bridge = var.network_bridge
    model  = "virtio"
    tag = var.vlan_tag
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
          storage = var.disk_storage
        }
      }
    }

    scsi {
      scsi0 {
        disk {
          storage = var.disk_storage
          size    = var.disk_size
        }
      }
    }
  }

  os_type    = "cloud-init"
  ipconfig0  = "ip=${var.ip_address},gw=${var.gateway}"
  nameserver = var.nameserver
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
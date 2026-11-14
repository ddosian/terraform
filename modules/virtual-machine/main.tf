terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
    }
    technitium = {
      source  = "kevynb/technitium"
    }
  }
}

# Proxmox VM
resource "proxmox_vm_qemu" "proxmox_vm" {
  name        = var.name
  description = "Managed by Terraform"
  vmid        = var.id
  target_node = var.host
  agent       = 1
  clone       = var.template
  tags = var.tags

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
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFoBKKeSGtfyG85mIhr5WQFW0JBF9haBOIDXz6wIEzx4 admin@dontddos.me
  EOF

  lifecycle {
    ignore_changes = [
      bootdisk,
      vm_state,
      startup_shutdown,
    ]
  }
}

resource "technitium_record" "root" {
  domain = "${var.name}.${var.domain}"
  type = "A"
  ip_address= split("/", var.ip_address)[0]
  ttl       = 3600
}

resource "technitium_record" "wildcard" {
  domain = "*.${var.name}.${var.domain}"
  type = "CNAME"
  value= "${var.name}.${var.domain}"
  ttl       = 3600
}
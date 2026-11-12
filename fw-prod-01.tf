resource "proxmox_vm_qemu" "fw-prod-01" {
  name        = "fw-prod-01"
  target_node = "pve-prod-01"

  vmid = 100
  tags = "production,networking,routing,firewall,pfsense"

  memory = 2048
  cpu {
    cores = 2
  }

  # WAN
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  # LAN
  network {
    id     = 1
    model  = "virtio"
    bridge = "vmbr1"
  }

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "local:iso/netgate-installer-v1.1.1-RELEASE-amd64.iso"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = "32G"
        }
      }
    }
  }

  boot = "order=scsi0;ide2"

}
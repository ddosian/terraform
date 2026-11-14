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

resource "technitium_record" "fw-prod-01" {
  domain = "fw-prod-01.home.internal.dontddos.me"
  type = "A"
  ip_address= "10.77.1.1"
  ttl       = 3600
}

resource "technitium_record" "fw-prod-01_wildcard" {
  domain = "*.fw-prod-01.home.internal.dontddos.me"
  type = "CNAME"
  value= "fw-prod-01.home.internal.dontddos.me"
  ttl       = 3600
}
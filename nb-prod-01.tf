resource "proxmox_lxc_guest" "nb-prod-01" {
  name         = "nb-prod-01"
  power_state  = "running"
  target_node  = "pve-prod-01"
  unprivileged = true
  password     = var.nb_prod_01_password
  tags = ["production", "networking", "exitnode", "netbird"]
  template {
    file    = "debian-12-standard_12.12-1_amd64.tar.zst"
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
    size    = "4G"
    storage = "local-lvm"
  }
  network {
    id           = "net0"
    name         = "eth0"
    bridge       = "vmbr1"
    ipv4_address = "10.77.80.101/24"
    ipv4_gateway = "10.77.80.1"
    vlan_native  = 80
  }
  startup_shutdown {}
  ssh_public_keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFoBKKeSGtfyG85mIhr5WQFW0JBF9haBOIDXz6wIEzx4 admin@dontddos.me"
}

resource "technitium_record" "nb-prod-01" {
  domain = "nb-prod-01.home.internal.dontddos.me"
  type = "A"
  ip_address= "10.77.80.101"
  ttl       = 3600
}

resource "technitium_record" "nb-prod-01_wildcard" {
  domain = "*.nb-prod-01.home.internal.dontddos.me"
  type = "CNAME"
  value= "nb-prod-01.home.internal.dontddos.me"
  ttl       = 3600
}
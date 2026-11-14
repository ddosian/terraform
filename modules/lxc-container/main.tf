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

# Proxmox LXC
resource "proxmox_lxc_guest" "proxmox_lxc" {
  name         = var.name
  power_state  = "running"
  target_node  = var.host
  unprivileged = true
  password     = var.password
  tags         = var.tags

  template {
    file    = var.template
    storage = var.template_storage
  }

  cpu {
    cores = var.cpu_cores
  }

  features {
    unprivileged {
      nesting = var.nesting
    }
  }

  memory = var.memory
  swap   = var.swap

  root_mount {
    size    = var.disk_size
    storage = var.disk_storage
  }

  network {
    id           = "net0"
    name         = "eth0"
    bridge       = var.network_bridge
    ipv4_address = var.ip_address
    ipv4_gateway = var.gateway
    vlan_native  = var.vlan_tag
  }

  startup_shutdown {}
  ssh_public_keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFoBKKeSGtfyG85mIhr5WQFW0JBF9haBOIDXz6wIEzx4 admin@dontddos.me"
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

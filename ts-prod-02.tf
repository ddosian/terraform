resource "adguard_rewrite" "ts-prod-02_record" {
  domain = "ts-prod-02.internal.dontddos.me"
  answer = "10.77.1.119"
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
        id = 0
        name = "eth0"
        bridge = "vmbr1"
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
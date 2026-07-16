# DNS Records
resource "adguard_rewrite" "pve-prod-03_record" {
  domain = "pve-prod-03.internal.dontddos.me"
  answer = "10.77.0.13"
}

# Dockhand Environment
resource "dockhand_environment" "pve-prod-03_dockhand_environment" {
  name            = "pve-prod-03"
  connection_type = "direct"
  host     = "pve-prod-03.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/pve-prod-03/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/pve-prod-03/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/pve-prod-03/key.pem")
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "pve-prod-03_uptimekuma_monitor" {
  name     = "PVE-Prod-03"
  hostname       = "pve-prod-03.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.proxmox-ve_monitor_group.id
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "pve-prod-03-ca_authentik_key_pair" {
  name             = "pve-prod-03-ca"
  certificate_data = file("${path.module}/../ansible/docker-keys/pve-prod-03/ca.pem")
}

resource "authentik_certificate_key_pair" "pve-prod-03-client_authentik_key_pair" {
  name             = "pve-prod-03-client"
  certificate_data = file("${path.module}/../ansible/docker-keys/pve-prod-03/cert.pem")
  key_data = file("${path.module}/../ansible/docker-keys/pve-prod-03/key.pem")
}
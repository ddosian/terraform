# Dockhand Environment
resource "dockhand_environment" "vps-prod-02_dockhand_environment" {
  name            = "vps-prod-02"
  connection_type = "direct"
  host            = "vps-prod-02.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = local.vps-prod-02_ca
  client_cert     = local.vps-prod-02_cert
  client_key      = local.vps-prod-02_key
  icon            = "server"
}

# Cloudflare DNS records
resource "cloudflare_dns_record" "vps-prod-02_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "vps-prod-02.dontddos.me"
  ttl     = 1
  type    = "A"
  comment = "Managed by Terraform"
  content = "38.242.248.156"
  proxied = false
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "vps-prod-02_uptimekuma_monitor" {
  name           = "VPS-Prod-02"
  hostname       = "vps-prod-02.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  notification_ids = [
    1,
  ]
  parent = uptimekuma_monitor_group.edge_monitor_group.id
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "vps-prod-02-ca_authentik_key_pair" {
  name             = "vps-prod-02-ca"
  certificate_data = local.vps-prod-02_ca
  lifecycle {
    ignore_changes = [certificate_data, key_data]
  }
}

resource "authentik_certificate_key_pair" "vps-prod-02-client_authentik_key_pair" {
  name             = "vps-prod-02-client"
  certificate_data = local.vps-prod-02_cert
  key_data         = local.vps-prod-02_key
  lifecycle {
    ignore_changes = [certificate_data, key_data]
  }
}

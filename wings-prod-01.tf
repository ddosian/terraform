# Dockhand Environment
resource "dockhand_environment" "wings-prod-01_dockhand_environment" {
  name            = "wings-prod-01"
  connection_type = "direct"
  host     = "wings-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/wings-prod-01/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/wings-prod-01/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/wings-prod-01/key.pem")
  icon            = "server"
}

# DNS Records
resource "adguard_rewrite" "wings-prod-01_record" {
  domain = "wings-prod-01.internal.dontddos.me"
  answer = "10.79.1.106"
}

# Cloudflare DNS records
resource "cloudflare_dns_record" "wings-prod-01_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "wings-prod-01.dontddos.me"
  ttl      = 1
  type     = "A"
  comment  = "Managed by Terraform"
  content  = "156.67.29.169"
  proxied  = false
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "wings-prod-01_uptimekuma_monitor" {
  name     = "Wings-Prod-01"
  hostname       = "wings-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "wings-prod-01-ca_authentik_key_pair" {
  name             = "wings-prod-01-ca"
  certificate_data = file("${path.module}/../ansible/docker-keys/wings-prod-01/ca.pem")
}

resource "authentik_certificate_key_pair" "wings-prod-01-client_authentik_key_pair" {
  name             = "wings-prod-01-client"
  certificate_data = file("${path.module}/../ansible/docker-keys/wings-prod-01/cert.pem")
  key_data = file("${path.module}/../ansible/docker-keys/wings-prod-01/key.pem")
}
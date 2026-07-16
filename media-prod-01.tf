# DNS Records
resource "adguard_rewrite" "media-prod-01_record" {
  domain = "media-prod-01.internal.dontddos.me"
  answer = "10.77.1.107"
}
resource "adguard_rewrite" "media-prod-01_wildcard_record" {
  domain = "*.media-prod-01.internal.dontddos.me"
  answer = "media-prod-01.internal.dontddos.me"
}

# Dockhand Environment
resource "dockhand_environment" "media-prod-01_dockhand_environment" {
  name            = "media-prod-01"
  connection_type = "direct"
  host     = "media-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/media-prod-01/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/media-prod-01/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/media-prod-01/key.pem")
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "media-prod-01_uptimekuma_monitor" {
  name     = "Media-Prod-01"
  hostname       = "media-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "media-prod-01-ca_authentik_key_pair" {
  name             = "media-prod-01-ca"
  certificate_data = file("${path.module}/../ansible/docker-keys/media-prod-01/ca.pem")
}

resource "authentik_certificate_key_pair" "media-prod-01-client_authentik_key_pair" {
  name             = "media-prod-01-client"
  certificate_data = file("${path.module}/../ansible/docker-keys/media-prod-01/cert.pem")
  key_data = file("${path.module}/../ansible/docker-keys/media-prod-01/key.pem")
}
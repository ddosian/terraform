# DNS Records
resource "adguard_rewrite" "nb-prod-01_record" {
  domain = "nb-prod-01.internal.dontddos.me"
  answer = "10.77.1.101"
}

# Dockhand Environment
resource "dockhand_environment" "nb-prod-01_dockhand_environment" {
  name            = "nb-prod-01"
  connection_type = "direct"
  host            = "nb-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = file("${path.module}/../ansible/docker-keys/nb-prod-01/ca.pem")
  client_cert     = file("${path.module}/../ansible/docker-keys/nb-prod-01/cert.pem")
  client_key      = file("${path.module}/../ansible/docker-keys/nb-prod-01/key.pem")
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "nb-prod-01_uptimekuma_monitor" {
  name           = "NB-Prod-01"
  hostname       = "nb-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.routing_monitor_group.id
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "nb-prod-01-ca_authentik_key_pair" {
  name             = "nb-prod-01-ca"
  certificate_data = file("${path.module}/../ansible/docker-keys/nb-prod-01/ca.pem")
}

resource "authentik_certificate_key_pair" "nb-prod-01-client_authentik_key_pair" {
  name             = "nb-prod-01-client"
  certificate_data = file("${path.module}/../ansible/docker-keys/nb-prod-01/cert.pem")
  key_data         = file("${path.module}/../ansible/docker-keys/nb-prod-01/key.pem")
}
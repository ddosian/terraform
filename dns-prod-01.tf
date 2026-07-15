# DNS Records
resource "adguard_rewrite" "dns_prod-01_record" {
  domain = "dns-prod-01.internal.dontddos.me"
  answer = "10.77.1.103"
}
resource "adguard_rewrite" "dns_prod-01_wildcard_record" {
  domain = "*.dns-prod-01.internal.dontddos.me"
  answer = "dns-prod-01.internal.dontddos.me"
}

# Dockhand Environment
resource "dockhand_environment" "dns-prod-01_dockhand_environment" {
  name            = "dns-prod-01"
  connection_type = "direct"
  host     = "dns-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/dns-prod-01/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/dns-prod-01/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/dns-prod-01/key.pem")
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "dns-prod-01_uptimekuma_monitor" {
  name     = "DNS-Prod-01"
  hostname       = "dns-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
}
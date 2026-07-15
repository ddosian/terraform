# DNS Records
resource "adguard_rewrite" "mon-prod-01_record" {
  domain = "mon-prod-01.internal.dontddos.me"
  answer = "10.77.1.112"
}
resource "adguard_rewrite" "mon-prod-01_wildcard_record" {
  domain = "*.mon-prod-01.internal.dontddos.me"
  answer = "mon-prod-01.internal.dontddos.me"
}

# Dockhand Environment
resource "dockhand_environment" "mon-prod-01_dockhand_environment" {
  name            = "mon-prod-01"
  connection_type = "direct"
  host     = "mon-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/mon-prod-01/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/mon-prod-01/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/mon-prod-01/key.pem")
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "mon-prod-01_uptimekuma_monitor" {
  name     = "Mon-Prod-01"
  hostname       = "mon-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
}
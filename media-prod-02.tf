# DNS Records
resource "adguard_rewrite" "media-prod-02_record" {
  domain = "media-prod-02.internal.dontddos.me"
  answer = "10.78.1.108"
}

# Dockhand Environment
resource "dockhand_environment" "media-prod-02_dockhand_environment" {
  name            = "media-prod-02"
  connection_type = "direct"
  host     = "media-prod-02.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/media-prod-02/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/media-prod-02/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/media-prod-02/key.pem")
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "media-prod-02_uptimekuma_monitor" {
  name     = "Media-Prod-02"
  hostname       = "media-prod-02.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
}
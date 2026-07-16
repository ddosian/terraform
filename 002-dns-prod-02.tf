resource "adguard_rewrite" "dns_prod-02_record" {
  domain = "dns-prod-02.internal.dontddos.me"
  answer = "10.77.1.104"
}
resource "adguard_rewrite" "dns_prod-02_wildcard_record" {
  domain = "*.dns-prod-02.internal.dontddos.me"
  answer = "dns-prod-02.internal.dontddos.me"
}

# Dockhand Environment
resource "dockhand_environment" "dns-prod-02_dockhand_environment" {
  name            = "dns-prod-02"
  connection_type = "direct"
  host            = "dns-prod-02.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = file("${path.module}/../ansible/docker-keys/dns-prod-02/ca.pem")
  client_cert     = file("${path.module}/../ansible/docker-keys/dns-prod-02/cert.pem")
  client_key      = file("${path.module}/../ansible/docker-keys/dns-prod-02/key.pem")
  icon            = "server"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "dns-prod-02_uptimekuma_monitor" {
  name           = "DNS-Prod-02"
  hostname       = "dns-prod-02.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.dns_monitor_group.id
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "dns-prod-02-ca_authentik_key_pair" {
  name             = "dns-prod-02-ca"
  certificate_data = file("${path.module}/../ansible/docker-keys/dns-prod-02/ca.pem")
}

resource "authentik_certificate_key_pair" "dns-prod-02-client_authentik_key_pair" {
  name             = "dns-prod-02-client"
  certificate_data = file("${path.module}/../ansible/docker-keys/dns-prod-02/cert.pem")
  key_data         = file("${path.module}/../ansible/docker-keys/dns-prod-02/key.pem")
}
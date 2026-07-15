# DNS Records
resource "adguard_rewrite" "k3s-cl-prod-01_record" {
  domain = "k3s-cl-prod-01.internal.dontddos.me"
  answer = "10.80.0.10"
}
resource "adguard_rewrite" "k3s-cl-prod-01_wildcard_record" {
  domain = "*.k3s-cl-prod-01.internal.dontddos.me"
  answer = "10.80.1.0"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "k3s-cl-prod-01_uptimekuma_monitor" {
  name     = "K3s-Cl-Prod-01"
  hostname       = "k3s-cl-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.k3s-cl-prod-01_monitor_group.id
}
# DNS Records
resource "adguard_rewrite" "fw-prod-02_record" {
  domain = "fw-prod-02.internal.dontddos.me"
  answer = "10.77.0.2"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "fw-prod-02_uptimekuma_monitor" {
  name           = "FW-Prod-02"
  hostname       = "10.81.0.2"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.routing_monitor_group.id
}
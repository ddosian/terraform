resource "adguard_rewrite" "nas-prod-01_record" {
  domain = "nas-prod-01.internal.dontddos.me"
  answer = "10.77.0.21"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "nas-prod-01_uptimekuma_monitor" {
  name     = "NAS-Prod-01"
  hostname       = "nas-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
}
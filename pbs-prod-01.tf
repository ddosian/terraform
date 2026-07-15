resource "adguard_rewrite" "pbs-prod-01_record" {
  domain = "pbs-prod-01.internal.dontddos.me"
  answer = "10.77.1.109"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "pbs-prod-01_uptimekuma_monitor" {
  name     = "PBS-Prod-01"
  hostname       = "pbs-prod-01.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
}
# DNS Records
resource "adguard_rewrite" "k3s-prod-02_record" {
  domain = "k3s-prod-02.internal.dontddos.me"
  answer = "10.80.0.12"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "k3s-prod-02_uptimekuma_monitor" {
  name           = "K3s-Prod-02"
  hostname       = "k3s-prod-02.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.k3s-cl-prod-01_monitor_group.id
}
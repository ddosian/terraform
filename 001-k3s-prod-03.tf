# DNS Records
resource "adguard_rewrite" "k3s-prod-03_record" {
  domain = "k3s-prod-03.internal.dontddos.me"
  answer = "10.80.0.13"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "k3s-prod-03_uptimekuma_monitor" {
  name           = "K3s-Prod-03"
  hostname       = "k3s-prod-03.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.k3s-cl-prod-01_monitor_group.id
}

resource "uptimekuma_monitor_tcp_port" "k3s-prod-03_kube_api" {
  name        = "K3s-Prod-03 (Kube API)"
  hostname    = "k3s-prod-03.internal.dontddos.me"
  port        = 6443
  interval    = 60
  max_retries = 2
  upside_down = false
  active      = true
  parent      = uptimekuma_monitor_group.k3s-cl-prod-01_kube_api.id
}
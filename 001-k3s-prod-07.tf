# DNS Records
resource "adguard_rewrite" "k3s-prod-07_record" {
  domain = "k3s-prod-07.internal.dontddos.me"
  answer = "10.81.1.115"
}

# Uptime Kuma Monitor
resource "uptimekuma_monitor_ping" "k3s-prod-07_uptimekuma_monitor" {
  name           = "k3s-Prod-07"
  hostname       = "k3s-prod-07.internal.dontddos.me"
  interval       = 60
  timeout        = 30
  max_retries    = 2
  retry_interval = 60
  upside_down    = false
  active         = true
  packet_size    = 56
  parent         = uptimekuma_monitor_group.k3s-cl-prod-02_monitor_group.id
}

resource "uptimekuma_monitor_tcp_port" "k3s-prod-07_kube_api" {
  name        = "K3s-Prod-07 (Kube API)"
  hostname    = "k3s-prod-07.internal.dontddos.me"
  port        = 6443
  interval    = 60
  max_retries = 2
  upside_down = false
  active      = true
  parent      = uptimekuma_monitor_group.k3s-cl-prod-02_kube_api.id
}
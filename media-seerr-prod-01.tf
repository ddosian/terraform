resource "uptimekuma_monitor_http" "seerr-prod-01" {
  name     = "Seerr-Prod-01"
  url      = "https://seerr.dontddos.me"
  interval = 60
  timeout  = 30
  active   = true
    parent   = uptimekuma_monitor_group.media.id
}

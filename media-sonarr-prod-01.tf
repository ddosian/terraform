resource "uptimekuma_monitor_http" "sonarr-prod-01" {
  name     = "Sonarr-Prod-01"
  url      = "https://sonarr-prod-01.media-prod-01.internal.dontddos.me"
  interval = 60
  timeout  = 30
  active   = true
    parent   = uptimekuma_monitor_group.media.id
}

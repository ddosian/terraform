resource "uptimekuma_monitor_http" "jellyfin-prod-01" {
  name     = "Jellyfin-Prod-01"
  url      = "https://jellyfin.dontddos.me"
  interval = 60
  timeout  = 30
  active   = true
  parent   = uptimekuma_monitor_group.media.id
}

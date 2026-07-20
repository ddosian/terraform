resource "uptimekuma_monitor_http" "qbittorrent-prod-01" {
  name     = "qBittorrent-Prod-01"
  url      = "https://qbittorrent-prod-01.media-prod-01.internal.dontddos.me"
  interval = 60
  timeout  = 30
  active   = true
  parent   = uptimekuma_monitor_group.media.id
}

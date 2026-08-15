resource "uptimekuma_monitor_http" "prowlarr-prod-01" {
  name     = "Prowlarr-Prod-01"
  url      = "https://prowlarr-prod-01.media-prod-01.internal.dontddos.me"
  interval = 60
  timeout  = 30
  active   = true
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.media.id
}

resource "uptimekuma_monitor_http" "github" {
  name     = "GitHub"
  url      = "https://github.com"
  interval = 60
  timeout  = 30
  active   = true
  notification_ids = [
    1,
  ]
  parent = uptimekuma_monitor_group.git.id
}

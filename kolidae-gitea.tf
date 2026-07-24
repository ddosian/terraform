resource "uptimekuma_monitor_http" "kolidae-gitea" {
  name     = "Kolidae's Gitea"
  url      = "https://git.kolidae.cc"
  interval = 60
  timeout  = 30
  active   = true
  parent   = uptimekuma_monitor_group.git.id
}

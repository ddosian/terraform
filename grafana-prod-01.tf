resource "uptimekuma_monitor_http" "grafana-prod-01" {
  name                  = "Grafana-Prod-01"
  url                   = "https://grafana-prod-01.mon-prod-01.internal.dontddos.me"
  interval              = 60
  timeout               = 30
  max_retries           = 2
  retry_interval        = 60
  active                = true
  accepted_status_codes = ["200-299"]
  notification_ids = [
    1,
    2,
  ]
  parent = uptimekuma_monitor_group.monitoring.id
}

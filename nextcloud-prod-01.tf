# Cloudflare DNS records
resource "cloudflare_dns_record" "nextcloud-prod-01_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "nextcloud.dontddos.me"
  ttl     = 1
  type    = "A"
  comment = "Managed by Terraform"
  content = "156.67.29.169"
  proxied = false
}

resource "uptimekuma_monitor_http" "nextcloud-prod-01" {
  name                  = "Nextcloud-Prod-01"
  url                   = "https://nextcloud.dontddos.me"
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
  parent = uptimekuma_monitor_group.storage.id
}

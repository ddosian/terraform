# DNS Records
resource "adguard_rewrite" "media-prod-01_record" {
  domain = "media-prod-01.internal.dontddos.me"
  answer = "10.77.1.107"
}
resource "adguard_rewrite" "media-prod-01_wildcard_record" {
  domain = "*.media-prod-01.internal.dontddos.me"
  answer = "media-prod-01.internal.dontddos.me"
}
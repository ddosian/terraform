# DNS Records
resource "adguard_rewrite" "mon-prod-01_record" {
  domain = "mon-prod-01.internal.dontddos.me"
  answer = "10.77.1.112"
}
resource "adguard_rewrite" "mon-prod-01_wildcard_record" {
  domain = "*.mon-prod-01.internal.dontddos.me"
  answer = "mon-prod-01.internal.dontddos.me"
}

# DNS Records
resource "adguard_rewrite" "dns_prod-01_record" {
  domain = "dns-prod-01.internal.dontddos.me"
  answer = "10.77.1.103"
}
resource "adguard_rewrite" "dns_prod-01_wildcard_record" {
  domain = "*.dns-prod-01.internal.dontddos.me"
  answer = "dns-prod-01.internal.dontddos.me"
}
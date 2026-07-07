# DNS Records
resource "adguard_rewrite" "nb-prod-01_record" {
  domain = "nb-prod-01.internal.dontddos.me"
  answer = "10.77.1.101"
}

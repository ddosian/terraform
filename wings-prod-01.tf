# DNS Records
resource "adguard_rewrite" "wings-prod-01_record" {
  domain = "wings-prod-01.internal.dontddos.me"
  answer = "10.78.1.106"
}

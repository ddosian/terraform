# DNS Records
resource "adguard_rewrite" "auth-prod-01_record" {
  domain = "auth-prod-01.internal.dontddos.me"
  answer = "10.78.1.112"
}

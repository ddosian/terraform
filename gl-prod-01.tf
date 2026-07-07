# DNS Records
resource "adguard_rewrite" "gl-prod-01_record" {
  domain = "gl-prod-01.internal.dontddos.me"
  answer = "10.78.1.111"
}

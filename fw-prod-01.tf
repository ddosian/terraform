# DNS Records
resource "adguard_rewrite" "fw-prod-01_record" {
  domain = "fw-prod-01.internal.dontddos.me"
  answer = "10.77.0.1"
}

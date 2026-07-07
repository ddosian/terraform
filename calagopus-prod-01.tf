# DNS Records
resource "adguard_rewrite" "calagopus-prod-01_record" {
  domain = "calagopus-prod-01.internal.dontddos.me"
  answer = "10.78.1.105"
}

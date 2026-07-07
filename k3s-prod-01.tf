# DNS Records
resource "adguard_rewrite" "k3s-prod-01_record" {
  domain = "k3s-prod-01.internal.dontddos.me"
  answer = "10.80.0.11"
}

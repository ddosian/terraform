# DNS Records
resource "adguard_rewrite" "k3s-prod-03_record" {
  domain = "k3s-prod-03.internal.dontddos.me"
  answer = "10.80.0.13"
}

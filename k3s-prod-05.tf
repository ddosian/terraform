# DNS Records
resource "adguard_rewrite" "k3s-prod-05_record" {
  domain = "k3s-prod-05.internal.dontddos.me"
  answer = "10.81.1.113"
}

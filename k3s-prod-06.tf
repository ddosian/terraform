# DNS Records
resource "adguard_rewrite" "k3s-prod-06_record" {
  domain = "k3s-prod-06.internal.dontddos.me"
  answer = "10.81.1.114"
}

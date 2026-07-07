# DNS Records
resource "adguard_rewrite" "k3s-prod-07_record" {
  domain = "k3s-prod-07.internal.dontddos.me"
  answer = "10.81.1.115"
}

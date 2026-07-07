# DNS Records
resource "adguard_rewrite" "k3s-prod-04_record" {
  domain = "k3s-prod-04.internal.dontddos.me"
  answer = "10.80.0.14"
}

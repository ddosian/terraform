# DNS Records
resource "adguard_rewrite" "k3s-cl-prod-01_record" {
  domain = "k3s-cl-prod-01.internal.dontddos.me"
  answer = "10.80.0.10"
}
resource "adguard_rewrite" "k3s-cl-prod-01_wildcard_record" {
  domain = "*.k3s-cl-prod-01.internal.dontddos.me"
  answer = "10.80.1.0"
}

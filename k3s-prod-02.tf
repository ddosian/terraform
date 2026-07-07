# DNS Records
resource "adguard_rewrite" "k3s-prod-02_record" {
  domain = "k3s-prod-02.internal.dontddos.me"
  answer = "10.80.0.12"
}

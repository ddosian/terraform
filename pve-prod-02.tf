# DNS Records
resource "adguard_rewrite" "pve-prod-02_record" {
  domain = "pve-prod-02.internal.dontddos.me"
  answer = "10.77.0.12"
}
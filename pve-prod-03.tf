# DNS Records
resource "adguard_rewrite" "pve-prod-03_record" {
  domain = "pve-prod-03.internal.dontddos.me"
  answer = "10.77.0.13"
}
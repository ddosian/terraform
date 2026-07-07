# DNS Records
resource "adguard_rewrite" "pve-prod-01_record" {
  domain = "pve-prod-01.internal.dontddos.me"
  answer = "10.77.0.11"
}
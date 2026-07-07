resource "adguard_rewrite" "nas-prod-01_record" {
  domain = "nas-prod-01.internal.dontddos.me"
  answer = "10.77.0.21"
}
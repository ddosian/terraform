resource "adguard_rewrite" "sel-automation-prod-01_record" {
  domain = "sel-automation-prod-01.internal.dontddos.me"
  answer = "10.77.1.110"
}
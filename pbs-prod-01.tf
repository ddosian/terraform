resource "adguard_rewrite" "pbs-prod-01_record" {
  domain = "pbs-prod-01.internal.dontddos.me"
  answer = "10.77.1.109"
}
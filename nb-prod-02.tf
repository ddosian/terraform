# DNS Records
resource "adguard_rewrite" "nb-prod-02_record" {
  domain = "nb-prod-02.internal.dontddos.me"
  answer = "10.77.1.102"
}

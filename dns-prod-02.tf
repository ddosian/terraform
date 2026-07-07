resource "adguard_rewrite" "dns_prod-02_record" {
  domain = "dns-prod-02.internal.dontddos.me"
  answer = "10.77.1.104"
}
resource "adguard_rewrite" "dns_prod-02_wildcard_record" {
  domain = "*.dns-prod-02.internal.dontddos.me"
  answer = "dns-prod-02.internal.dontddos.me"
}
# DNS Records
resource "adguard_rewrite" "media-prod-02_record" {
  domain = "media-prod-02.internal.dontddos.me"
  answer = "10.78.1.108"
}
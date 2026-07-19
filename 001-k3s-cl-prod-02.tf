# DNS Records
resource "adguard_rewrite" "k3s-cl-prod-02_record" {
  domain = "k3s-cl-prod-02.internal.dontddos.me"
  answer = "10.81.0.10"
}

resource "adguard_rewrite" "k3s-cl-prod-02_wildcard_record" {
  domain = "*.k3s-cl-prod-02.internal.dontddos.me"
  answer = "10.81.1.0"
}
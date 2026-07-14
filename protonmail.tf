# ProtonMail DKIM CNAME records
resource "cloudflare_dns_record" "protonmail_dkim_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "protonmail._domainkey.dontddos.me"
  ttl      = 1
  type     = "CNAME"
  comment  = "Managed by Terraform"
  content  = "protonmail.domainkey.dk7rn4h4c3mlcummpygdpvblcu2lkvalznmlpdnkh2awnmix6yk2q.domains.proton.ch"
  proxied  = false
}

resource "cloudflare_dns_record" "protonmail2_dkim_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "protonmail2._domainkey.dontddos.me"
  ttl      = 1
  type     = "CNAME"
  comment  = "Managed by Terraform"
  content  = "protonmail2.domainkey.dk7rn4h4c3mlcummpygdpvblcu2lkvalznmlpdnkh2awnmix6yk2q.domains.proton.ch"
  proxied  = false
}

resource "cloudflare_dns_record" "protonmail3_dkim_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "protonmail3._domainkey.dontddos.me"
  ttl      = 1
  type     = "CNAME"
  comment  = "Managed by Terraform"
  content  = "protonmail3.domainkey.dk7rn4h4c3mlcummpygdpvblcu2lkvalznmlpdnkh2awnmix6yk2q.domains.proton.ch"
  proxied  = false
}

# ProtonMail MX records
resource "cloudflare_dns_record" "mx_root_1_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "dontddos.me"
  ttl      = 1
  type     = "MX"
  comment  = "Managed by Terraform"
  content  = "mail.protonmail.ch"
  priority = 10
  proxied  = false
}

resource "cloudflare_dns_record" "mx_root_2_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "dontddos.me"
  ttl      = 1
  type     = "MX"
  comment  = "Managed by Terraform"
  content  = "mailsec.protonmail.ch"
  priority = 20
  proxied  = false
}

# ProtonMail TXT records
resource "cloudflare_dns_record" "txt_protonmail_verification_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "dontddos.me"
  ttl      = 1
  type     = "TXT"
  comment  = "Managed by Terraform"
  content  = "protonmail-verification=0ebb9892aa0f3b4963e0b2855d1740e1ce23d2ac"
  proxied  = false
}

resource "cloudflare_dns_record" "txt_spf_root_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "dontddos.me"
  ttl      = 1
  type     = "TXT"
  comment  = "Managed by Terraform"
  content  = "v=spf1 include:_spf.protonmail.ch ~all"
  proxied  = false
}

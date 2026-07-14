# Apex domain A record
resource "cloudflare_dns_record" "apex_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "@"
  ttl      = 1
  type     = "A"
  comment  = "Managed by Terraform"
  content  = "156.67.29.169"
  proxied  = false
}

# Root domain DMARC
resource "cloudflare_dns_record" "txt_dmarc_root_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "_dmarc.dontddos.me"
  ttl      = 1
  type     = "TXT"
  comment  = "Managed by Terraform"
  content  = "v=DMARC1; p=quarantine"
  proxied  = false
}

# Matrix SRV records
resource "cloudflare_dns_record" "srv_matrix_fed_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "_matrix-fed._tcp.matrix.dontddos.me"
  ttl      = 1
  type     = "SRV"
  comment  = "Managed by Terraform"
  proxied  = false
  data = {
    port     = 443
    priority = 10
    target   = "matrix.dontddos.me"
    weight   = 5
  }
}

resource "cloudflare_dns_record" "srv_matrix_cloudflare_record" {
  zone_id  = "310137280dfff667dd7414c94ef3a938"
  name     = "_matrix._tcp.matrix.dontddos.me"
  ttl      = 1
  type     = "SRV"
  comment  = "Managed by Terraform"
  proxied  = false
  data = {
    port     = 443
    priority = 10
    target   = "matrix.dontddos.me"
    weight   = 5
  }
}

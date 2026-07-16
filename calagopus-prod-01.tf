# DNS Records
resource "adguard_rewrite" "calagopus-prod-01_record" {
  domain = "calagopus-prod-01.internal.dontddos.me"
  answer = "10.78.1.105"
}

# Dockhand Environment
resource "dockhand_environment" "calagopus-prod-01_dockhand_environment" {
  name            = "calagopus-prod-01"
  connection_type = "direct"
  host            = "calagopus-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = file("${path.module}/../ansible/docker-keys/calagopus-prod-01/ca.pem")
  client_cert     = file("${path.module}/../ansible/docker-keys/calagopus-prod-01/cert.pem")
  client_key      = file("${path.module}/../ansible/docker-keys/calagopus-prod-01/key.pem")
  icon            = "server"
}

# Cloudflare DNS records
resource "cloudflare_dns_record" "calagopus-prod-01_cloudflare_record" {
  zone_id = "310137280dfff667dd7414c94ef3a938"
  name    = "calagopus.dontddos.me"
  ttl     = 1
  type    = "CNAME"
  comment = "Managed by Terraform"
  content = "vps-prod-01.dontddos.me"
  proxied = false
}

# Authentik Cert Key-pairs
resource "authentik_certificate_key_pair" "calagopus-prod-01-ca_authentik_key_pair" {
  name             = "calagopus-prod-01-ca"
  certificate_data = file("${path.module}/../ansible/docker-keys/calagopus-prod-01/ca.pem")
  lifecycle {
    ignore_changes = [key_data]
  }
}

resource "authentik_certificate_key_pair" "calagopus-prod-01-client_authentik_key_pair" {
  name             = "calagopus-prod-01-client"
  certificate_data = file("${path.module}/../ansible/docker-keys/calagopus-prod-01/cert.pem")
  key_data         = file("${path.module}/../ansible/docker-keys/calagopus-prod-01/key.pem")
}
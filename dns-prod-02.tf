resource "adguard_rewrite" "dns_prod-02_record" {
  domain = "dns-prod-02.internal.dontddos.me"
  answer = "10.77.1.104"
}
resource "adguard_rewrite" "dns_prod-02_wildcard_record" {
  domain = "*.dns-prod-02.internal.dontddos.me"
  answer = "dns-prod-02.internal.dontddos.me"
}

# Dockhand Environment
resource "dockhand_environment" "dns-prod-02_dockhand_environment" {
  name            = "dns-prod-02"
  connection_type = "direct"
  host     = "dns-prod-02.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/dns-prod-02/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/dns-prod-02/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/dns-prod-02/key.pem")
  icon            = "server"
}
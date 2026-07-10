# DNS Records
resource "adguard_rewrite" "nb-prod-02_record" {
  domain = "nb-prod-02.internal.dontddos.me"
  answer = "10.77.1.102"
}

# Dockhand Environment
resource "dockhand_environment" "nb-prod-02_dockhand_environment" {
  name            = "nb-prod-02"
  connection_type = "direct"
  host     = "nb-prod-02.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/nb-prod-02/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/nb-prod-02/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/nb-prod-02/key.pem")
  icon            = "server"
}
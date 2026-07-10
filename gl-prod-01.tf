# DNS Records
resource "adguard_rewrite" "gl-prod-01_record" {
  domain = "gl-prod-01.internal.dontddos.me"
  answer = "10.78.1.111"
}

# Dockhand Environment
resource "dockhand_environment" "gl-prod-01_dockhand_environment" {
  name            = "gl-prod-01"
  connection_type = "direct"
  host     = "gl-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert     = file("${path.module}/../ansible/docker-keys/gl-prod-01/ca.pem")
  client_cert = file("${path.module}/../ansible/docker-keys/gl-prod-01/cert.pem")
  client_key  = file("${path.module}/../ansible/docker-keys/gl-prod-01/key.pem")
  icon            = "server"
}
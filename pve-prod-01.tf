module "pve_prod_01" {
  source = "./modules/machine"

  name        = "pve-prod-01"
  hostname    = "pve-prod-01.internal.dontddos.me"
  ip_address  = "10.77.0.11"
  ca_cert     = local.pve_prod_01_ca
  client_cert = local.pve_prod_01_cert
  client_key  = local.pve_prod_01_key
}
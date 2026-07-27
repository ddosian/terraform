module "nc-prod-01_vm" {
  source = "./modules/virtual-machine"

  name       = "nc-prod-01"
  id         = 122
  host       = "pve-prod-01"
  vlan_tag   = 78
  ip_address = "10.78.1.122/16"
  gateway    = "10.78.0.3"

  monitor_group = uptimekuma_monitor_group.vms_monitor_group.id
}

resource "dockhand_environment" "nc-prod-01_dockhand_environment" {
  name            = "nc-prod-01"
  connection_type = "direct"
  host            = "nc-prod-01.internal.dontddos.me"

  protocol        = "https"
  port            = 2376
  tls_skip_verify = false
  ca_cert         = local.nc-prod-01_ca
  client_cert     = local.nc-prod-01_cert
  client_key      = local.nc-prod-01_key
  icon            = "server"
}
module "nb-prod-01" {
  source = "./modules/lxc-container"

  tags = ["production", "networking", "exitnode", "netbird"]

  name          = "nb-prod-01"
  password      = var.nb_prod_01_password
  ip_address    = "10.77.80.101/24"
  gateway       = "10.77.80.1"
  vlan_tag      = 80

}

moved {
  from = proxmox_lxc_guest.nb-prod-01
  to   = module.nb-prod-01.proxmox_lxc_guest.proxmox_lxc
}

moved {
  from = technitium_record.nb-prod-01
  to   = module.nb-prod-01.technitium_record.root
}

moved {
  from = technitium_record.nb-prod-01_wildcard
  to   = module.nb-prod-01.technitium_record.wildcard
}

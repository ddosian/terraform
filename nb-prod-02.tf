module "nb-prod-02" {
  source = "./modules/lxc-container"

  tags = ["production", "networking", "exitnode", "netbird"]

  name          = "nb-prod-02"
  host          = "pve-prod-02"
  password      = var.nb_prod_02_password
  ip_address    = "10.77.80.102/24"
  gateway       = "10.77.80.1"
  vlan_tag      = 80

}

moved {
  from = proxmox_lxc_guest.nb-prod-02
  to   = module.nb-prod-02.proxmox_lxc_guest.proxmox_lxc
}

moved {
  from = technitium_record.nb-prod-02
  to   = module.nb-prod-02.technitium_record.root
}

moved {
  from = technitium_record.nb-prod-02_wildcard
  to   = module.nb-prod-02.technitium_record.wildcard
}

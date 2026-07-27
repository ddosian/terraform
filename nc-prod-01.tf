module "nc-prod-01_vm" {
  source = "../modules/virtual-machine"

  name       = "nc-prod-01"
  id         = 122
  host       = "pve-prod-01"
  vlan_tag   = 78
  ip_address = "10.78.1.122/16"
  gateway    = "10.78.0.3"
}
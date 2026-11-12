resource "pfsense_vlan" "mgmt" {
  parent_interface = "vtnet1"
  tag              = 10
  pcp              = 0
  description      = "Management"
}

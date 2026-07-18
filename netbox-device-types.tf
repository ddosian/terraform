
resource "netbox_device_type" "hpe_proliant_dl360_gen9" {
  model           = "ProLiant DL360 Gen9"
  manufacturer_id = netbox_manufacturer.hewlett_packard_enterprise.id
  is_full_depth    = true
}
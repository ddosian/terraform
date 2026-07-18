
resource "netbox_device_type" "hpe_proliant_dl360_gen9" {
  model           = "ProLiant DL360 Gen9"
  manufacturer_id = netbox_manufacturer.hewlett_packard_enterprise.id
  is_full_depth   = true
}

resource "netbox_device_type" "hpe_proliant_dl360p_gen8" {
  model           = "ProLiant DL360p Gen8"
  manufacturer_id = netbox_manufacturer.hewlett_packard_enterprise.id
  is_full_depth   = true
}

resource "netbox_device_type" "arista_7010t-48" {
  model           = "7010T-48"
  manufacturer_id = netbox_manufacturer.arista.id
  is_full_depth   = false
}
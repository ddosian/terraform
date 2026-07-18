resource "netbox_device" "sw-prod-01_netbox_device" {
  name           = "SW-Prod-01"
  device_type_id = netbox_device_type.arista_7010t-48.id
  role_id        = netbox_device_role.switching.id
  site_id        = netbox_site.home.id
  rack_id        = netbox_rack.main.id
  rack_position = 14
  rack_face           = "front"
  status         = "active"
}
resource "netbox_rack" "main" {
  name     = "Main"
  site_id  = netbox_site.home.id
  status   = "active"
  width    = 19
  u_height = 15
}
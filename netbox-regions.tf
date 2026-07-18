resource "netbox_region" "europe" {
  name = "Europe"
}

resource "netbox_region" "england" {
  name             = "England"
  parent_region_id = netbox_region.europe.id
}

resource "netbox_region" "london" {
  name             = "London"
  parent_region_id = netbox_region.england.id
}
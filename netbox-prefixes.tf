resource "netbox_prefix" "lan" {
  prefix      = "10.77.0.0/16"
  status      = "active"
  description = "LAN"
}

resource "netbox_prefix" "lan_dhcp" {
  prefix      = "10.77.255.0/24"
  status      = "active"
  description = "LAN - DHCP"
}

resource "netbox_prefix" "dmz" {
  prefix      = "10.78.0.0/16"
  status      = "active"
  description = "DMZ"
}

resource "netbox_prefix" "dmz_dhcp" {
  prefix      = "10.78.255.0/24"
  status      = "active"
  description = "DMZ - DHCP"
}

resource "netbox_prefix" "game" {
  prefix      = "10.79.0.0/16"
  status      = "active"
  description = "Game"
}

resource "netbox_prefix" "game_dhcp" {
  prefix      = "10.79.255.0/24"
  status      = "active"
  description = "Game - DHCP"
}

resource "netbox_prefix" "kube" {
  prefix      = "10.80.0.0/16"
  status      = "active"
  description = "Kube"
}

resource "netbox_prefix" "kube_dhcp" {
  prefix      = "10.80.255.0/24"
  status      = "active"
  description = "Kube - DHCP"
}

resource "netbox_prefix" "kube2" {
  prefix      = "10.81.0.0/16"
  status      = "active"
  description = "Kube2"
}

resource "netbox_prefix" "kube2_dhcp" {
  prefix      = "10.81.255.0/24"
  status      = "active"
  description = "Kube2 - DHCP"
}
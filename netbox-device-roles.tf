resource "netbox_device_role" "virtualization" {
  color_hex = "004444"
  name      = "Virtualization"
  vm_role   = true
}

resource "netbox_device_role" "switching" {
  color_hex = "444400"
  name      = "Switching"
  vm_role   = false
}
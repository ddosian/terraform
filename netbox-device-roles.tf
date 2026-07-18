resource "netbox_device_role" "virtualization" {
  color_hex = "004444"
  name      = "Virtualization"
  vm_role   = true
}
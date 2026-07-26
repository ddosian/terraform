module "os-controller-test-03_vm" {
  source = "./modules/virtual-machine"

  name        = "os-controller-test-03"
  id          = 124
  host        = "pve-prod-03"
  network_bridge = "vmbr1"
  disk_storage = "local-lvm"
  ip_address  = "10.77.1.124/16" 
}
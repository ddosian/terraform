module "os-compute-test-01_vm" {
  source = "./modules/virtual-machine"

  name        = "os-compute-test-01"
  id          = 125
  host        = "pve-prod-01"
  network_bridge = "vmbr1"
  disk_storage = "pve-prod-01-data-01"
  ip_address  = "10.77.1.125/16" 
}
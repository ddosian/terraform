module "os-compute-test-02_vm" {
  source = "./modules/virtual-machine"

  name        = "os-compute-test-02"
  id          = 126
  host        = "pve-prod-02"
  network_bridge = "vmbr1"
  disk_storage = "pve-prod-02-data-01"
  ip_address  = "10.77.1.126/16" 
}
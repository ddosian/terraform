module "os-compute-test-03_vm" {
  source = "./modules/virtual-machine"

  name        = "os-compute-test-03"
  id          = 127
  host        = "pve-prod-03"
  network_bridge = "vmbr1"
  disk_storage = "local-lvm"
  ip_address  = "10.77.1.127/16" 
}
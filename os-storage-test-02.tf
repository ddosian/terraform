module "os-storage-test-02_vm" {
  source = "./modules/virtual-machine"

  name        = "os-storage-test-02"
  id          = 129
  host        = "pve-prod-01"
  network_bridge = "vmbr1"
  disk_storage = "local-lvm"
  ip_address  = "10.77.1.129/16" 
}
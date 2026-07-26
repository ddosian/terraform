module "os-controller-test-02_vm" {
  source = "./modules/virtual-machine"

  name        = "os-controller-test-02"
  id          = 123
  host        = "pve-prod-02"
  disk_storage = "pve-prod-02-data-01"
  ip_address  = "10.77.1.123/16" 
}
module "os-controller-test-01_vm" {
  source = "./modules/virtual-machine"

  name        = "os-controller-test-01"
  id          = 122
  host        = "pve-prod-01"
  ip_address  = "10.77.1.122/16" 
}
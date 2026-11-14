module "dns-prod-01" {
  source = "./modules/virtual-machine"

  tags = "production,networking,dns,technitium"

  name          = "dns-prod-01"
  id            = 103
  ip_address    = "10.77.40.103/24"
  
}

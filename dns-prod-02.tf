module "dns-prod-02" {
  source = "./modules/virtual-machine"

  tags = "production,networking,dns,technitium"

  name          = "dns-prod-02"
  id            = 104
  host = "pve-prod-02"
  disk_storage = "pve-prod-02-data-01"
  ip_address    = "10.77.40.104/24"
  
}

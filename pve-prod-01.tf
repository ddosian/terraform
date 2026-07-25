module "pve_prod_01" {
  source = "./modules/machine"

  name        = "pve-prod-01"
  hostname    = "pve-prod-01.internal.dontddos.me"
  ip_address  = "10.77.0.11"
  ca_cert     = local["pve-prod-01_ca"]
  client_cert = local["pve-prod-01_cert"]
  client_key  = local["pve-prod-01_key"]

  uptimekuma_parent_id            = uptimekuma_monitor_group.proxmox-ve_monitor_group.id
  netbox_device_type_id           = netbox_device_type.hpe_proliant_dl360_gen9.id
  netbox_device_role_id           = netbox_device_role.virtualization.id
  netbox_site_id                  = netbox_site.home.id
  netbox_rack_id                  = netbox_rack.main.id
  authentik_authorization_flow_id = data.authentik_flow.explicit-authorization-flow.id
  authentik_invalidation_flow_id  = data.authentik_flow.default-provider-invalidation-flow.id
}
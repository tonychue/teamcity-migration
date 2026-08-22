output "vnet_id" {
  description = "Virtual Network resource ID"
  value       = module.vnet.resource_id
}

output "vnet_name" {
  description = "Virtual Network name"
  value       = module.vnet.name
}

output "vnet_address_spaces" {
  description = "VNet address spaces"
  value       = module.vnet.address_spaces
}

output "subnets" {
  description = "VNet subnets"
  value       = module.vnet.subnets
}
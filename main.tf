module "vnet" {
  source = "Azure/avm-res-network-virtualnetwork/azurerm"

  name                = var.vnet_name
  location            = var.location
  parent_id           = data.azurerm_resource_group.this.id
  address_space       = var.vnet_address_space
  tags                = var.tags

  subnets = var.subnets
}
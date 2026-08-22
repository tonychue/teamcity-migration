environment = "dev"

location            = "UK South"
resource_group_name = "rg_devops"

vnet_name = "vnet-dev-uksouth"

vnet_address_space = [
  "10.10.0.0/16"
]

subnets = {

  web = {
    name = "snet-web"

    address_prefixes = [
      "10.10.1.0/24"
    ]

    service_endpoints = [
      "Microsoft.Storage",
      "Microsoft.KeyVault"
    ]
  }

  app = {
    name = "snet-app"

    address_prefixes = [
      "10.10.2.0/24"
    ]
  }

  data = {
    name = "snet-data"

    address_prefixes = [
      "10.10.3.0/24"
    ]
  }

  management = {
    name = "snet-management"

    address_prefixes = [
      "10.10.10.0/24"
    ]
  }
}

tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
  Workload    = "Networking"
}
terraform {
    backend "azurerm" {
        # use_oidc             = true                                    # Can also be set via `ARM_USE_OIDC` environment variable.
        # use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
        # tenant_id            = "00000000-0000-0000-0000-000000000000"  # Can also be set via `ARM_TENANT_ID` environment variable.
        # client_id            = "00000000-0000-0000-0000-000000000000"  # Can also be set via `ARM_CLIENT_ID` environment variable.
        # storage_account_name = "abcd1234"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
        # container_name       = "tfstate"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
        # key                  = "prod.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
        storage_account_name="tfdevopsaccount"
        container_name="tf-dev-state-container"
        key="uksouth/terraform.state"
        resource_group_name="rg_devops"
        subscription_id="732ec2db-5140-4675-bf72-0dd352a999a8"
        use_azuread_auth=true

  } 
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.1.0"
    }
  }
}



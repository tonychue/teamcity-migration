
variable "environment" {
  type = string

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be dev, stage, or prod."
  }
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the VNet"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = set(string)
}

variable "subnets" {
  description = "Virtual network subnets"

  type = map(object({
    name             = string
    address_prefixes = set(string)

    service_endpoints = optional(set(string), [])

    delegations = optional(list(object({
      name = string

      service_delegation = object({
        name    = string
        actions = optional(set(string), [])
      })
    })), [])

    default_outbound_access_enabled = optional(bool, false)
  }))
}

variable "tags" {
  description = "Tags applied to the VNet"
  type        = map(string)
  default     = {}
}
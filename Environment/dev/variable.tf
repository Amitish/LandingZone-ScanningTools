variable "rgs_mod" {
  type = map(object({

    name     = string
    location = string
    tags     = optional(map(string))

  }))
}


variable "key_vault" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}


variable "vnets_mod" {
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
    # subnet = map(object({
    #   subnet_name             = string
    #   subnet_address_prefixes = list(string)
    # }))
    subnet = optional(map(object({
      subnet_name             = string
      subnet_address_prefixes = list(string)
    })))
  }))
}


variable "pips_mod" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    tags                = optional(map(string))
  }))
}


variable "vms_mod" {
  type = map(object({
    vm_name             = string
    subnet_name         = string
    vnet_name           = string
    pip_name            = string
    nic_name            = string
    location            = string
    resource_group_name = string
    script_name         = string
    #custom_data         = optional(string)
    tags = optional(map(string))
    ip_configuration = object({
      name                          = string
      private_ip_address_allocation = string
    })
    }
  ))
}


variable "nsgs" {
  type = map(object({
    subnet_name         = string
    vnet_name           = string
    nsg_name            = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
    security_rule = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}


variable "asg_mod" {
  description = "A map of application security groups to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    nic_name            = string
  }))
}

variable "acr_mod" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
  }))
}

variable "stg_mod" {
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    account_tier             = string
    account_replication_type = string
    tags                     = optional(map(string))
  }))
}


# variable "bastion_mod" {
#   type = map(object({
#     bastion_name        = string
#     location            = string
#     resource_group_name = string
#     subnet_name         = string
#     vnet_name           = string
#     pip_name            = string
#     ip_configuration = object({
#       ip_configuration_name = string
#       subnet_id             = string
#       public_ip_address_id  = string
#     })
#   }))
# }

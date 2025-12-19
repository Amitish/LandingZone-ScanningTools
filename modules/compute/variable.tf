variable "vms" {
  type = map(object({
    subnet_name         = string
    vnet_name           = string
    pip_name            = string
    nic_name            = string
    resource_group_name = string
    location            = string
    script_name         = string
    vm_name             = string
    #custom_data         = optional(string)

    tags = optional(map(string))
    ip_configuration = object({
      name                          = string
      private_ip_address_allocation = string
    })
    }
  ))
}



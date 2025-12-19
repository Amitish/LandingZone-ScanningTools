variable "bastion" {
  type = map(object({
    bastion_name        = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    vnet_name           = string
    pip_name            = string
    ip_configuration = object({
      ip_configuration_name = string
      subnet_id             = string
      public_ip_address_id  = string
    })
  }))
}

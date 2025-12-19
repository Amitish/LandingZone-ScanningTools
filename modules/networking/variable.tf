variable "vnets" {
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
    }
  ))
}

# Agar subnet = object → use [each.value.subnet]

# Agar subnet = list(object(...)) → use each.value.subnet
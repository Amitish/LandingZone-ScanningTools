resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "subnet" {
    for_each = each.value.subnet == null ? {} : each.value.subnet
    #  for_each = each.value.subnet
    content {
      name             = subnet.value.subnet_name
      address_prefixes = subnet.value.subnet_address_prefixes
    }
  }
}


# address_prefixes - - - list of strings
# address_prefix - - - single string
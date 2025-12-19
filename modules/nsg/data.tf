data "azurerm_subnet" "sub" {
  for_each             = var.nsg
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

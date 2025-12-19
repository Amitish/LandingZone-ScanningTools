

resource "azurerm_application_security_group" "asgs" {
  for_each            = var.asg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface_application_security_group_association" "example" {
  for_each                      = var.asg
  network_interface_id          = data.azurerm_network_interface.nic[each.key].id
  application_security_group_id = azurerm_application_security_group.asgs[each.key].id
}


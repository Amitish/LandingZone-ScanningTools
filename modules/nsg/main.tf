resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags = {
    environment = "Production"
  }

  # we have to define 2 rules inside the nsg
  # One to enable port 22 for ssh
  # Another to enable port 80 for http

  dynamic "security_rule" {
    for_each = each.value.security_rule
    content {
      # we can use each.value.security_rule.name, etc. to access the values
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_sub_assoc" {
  for_each                  = var.nsg
  subnet_id                 = data.azurerm_subnet.sub[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}
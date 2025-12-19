
resource "azurerm_resource_group" "res_grp" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags

  # lifecycle {
  #   prevent_destroy = true
  # }
}



# Make a block using string interpoplation ....... 25/10/2025 start of video


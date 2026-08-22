resource "azurerm_resource_group" "rg" {
  for_each = var.resource_grp_child
  name     = each.value.name
  location = each.value.location
}

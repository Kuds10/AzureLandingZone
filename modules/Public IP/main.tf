resource "azurerm_public_ip" "Pip" {
  for_each            = var.public_ip_child
  name                = each.value.public_ip_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = each.value.allo_method
}

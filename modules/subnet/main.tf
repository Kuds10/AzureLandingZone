resource "azurerm_subnet" "snet" {
  for_each             = var.subnet_child
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

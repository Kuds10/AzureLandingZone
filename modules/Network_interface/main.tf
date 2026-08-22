resource "azurerm_network_interface" "nic" {
  for_each            = var.nic_child
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_config_name
    subnet_id                     = data.azurerm_subnet.s-net[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

data "azurerm_subnet" "s-net" {
  for_each             = var.nic_child
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name

}

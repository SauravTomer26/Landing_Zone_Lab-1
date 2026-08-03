
resource "azurerm_virtual_network" "VNet-Phoenix" {
  for_each = var.c-vnet

  name                = each.key
  location            = each.value.vnet_loc
  resource_group_name = each.value.vnet_rg
  address_space       = each.value.add_space
}


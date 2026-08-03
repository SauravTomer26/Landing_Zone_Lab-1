
resource "azurerm_subnet" "Subnet-Phoenix" {
  for_each = var.c-snet

  name                 = each.key
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.add_prefix
}


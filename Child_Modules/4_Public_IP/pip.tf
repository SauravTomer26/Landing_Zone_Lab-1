
resource "azurerm_public_ip" "PIP-Phoenix" {
  for_each = var.c-pip

  name                = each.key
  location            = each.value.ip_loc
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.alloc_method
}

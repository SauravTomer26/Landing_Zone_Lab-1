
resource "azurerm_resource_group" "RG-Phoenix" {
  for_each = var.c-rg

  name       = each.key
  location   = each.value.location
  managed_by = each.value.managed
}

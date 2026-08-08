
data "azurerm_subnet" "Subnet_data_block" {
  for_each = var.c-snet

  name                 = each.key
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip_data_block" {
  for_each = var.c-pip

  name                = each.key
  resource_group_name = each.value.rg_name
}


resource "azurerm_bastion_host" "Bastion-Phoenix" {
  for_each = var.c-bastion

  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = each.value.ipconfig_name
    subnet_id            = data.azurerm_subnet.Subnet_data_block[each.value.subnet_name].id
    public_ip_address_id = data.azurerm_public_ip.pip_data_block[each.value.pip_name].id
  }
}

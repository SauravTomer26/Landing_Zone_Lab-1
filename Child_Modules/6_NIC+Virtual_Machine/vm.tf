data "azurerm_subnet" "Subnet_data_block" {
  for_each             = var.c-snet
  name                 = each.key
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
}


resource "azurerm_network_interface" "NIC-Phoenix" {
  for_each            = var.c-vm
  name                = each.key
  location            = each.value.nic_location
  resource_group_name = each.value.nic_rg_name

  ip_configuration {
    name                          = each.value.ipconfig_name
    subnet_id                     = data.azurerm_subnet.Subnet_data_block[each.value.subnet_name].id
    private_ip_address_allocation = each.value.private_ip_alloc
  }
}

resource "azurerm_linux_virtual_machine" "VM-Phoenix" {
  for_each = var.c-vm

  name                            = each.value.vm_name
  resource_group_name             = each.value.vm_rg_name
  location                        = each.value.vm_location
  size                            = each.value.vm_size
  admin_username                  = each.value.vm_username
  admin_password                  = each.value.vm_password
  disable_password_authentication = each.value.vm_pswd_auth
  network_interface_ids           = [azurerm_network_interface.NIC-Phoenix[each.key].id]

  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }
  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }
}

# ------------ Resource Group ------------
p-rg = {
  dev-rg = {
    location = "centralindia"
    managed  = "Saurav"
  }
  test-rg = {
    location = "west europe"
    managed  = "Vishvendra"
  }
  prod-rg = {
    location = "japan east"
    managed  = "Gaurav"
  }
}

# ------------ Virtual Network ------------
p-vnet = {
  VNet-dev = {
    vnet_loc  = "centralindia"
    vnet_rg   = "dev-rg"
    add_space = ["10.4.0.0/16"]
  }
}

# ------------ Subnet ----------------
p-snet = {
  Frontend-Subnet = {
    rg_name    = "dev-rg"
    vnet_name  = "VNet-dev"
    add_prefix = ["10.4.1.0/24"]
  }
  Backend-Subnet = {
    rg_name    = "dev-rg"
    vnet_name  = "VNet-dev"
    add_prefix = ["10.4.2.0/24"]
  }
  AzureBastionSubnet = {
    rg_name    = "dev-rg"
    vnet_name  = "VNet-dev"
    add_prefix = ["10.4.3.0/24"]
  }
}

# ------------ Public IP ------------
p-pip = {
  Bastion_IP = {
    ip_loc       = "centralindia"
    rg_name      = "dev-rg"
    alloc_method = "Static"
  }
}

# ------------ Bastion ------------
p-bastion = {
  Bastion-dev = {
    location      = "centralindia"
    rg_name       = "dev-rg"
    ipconfig_name = "internal"
    subnet_name   = "AzureBastionSubnet"
    vnet_name     = "VNet-dev"
    pip_name      = "Bastion_IP"
  }
}

# ------------ NIC + Virtual Machine ------------
p-vm = {
  NIC-dev-frontend = {
    nic_location     = "centralindia"
    nic_rg_name      = "dev-rg"
    ipconfig_name    = "internal"
    subnet_name      = "Frontend-Subnet"
    private_ip_alloc = "Dynamic"

    vm_name      = "VM-dev"
    vm_rg_name   = "dev-rg"
    vm_location  = "centralindia"
    vm_size      = "Standard_D4_v5"
    vm_username  = "dev-user"
    vm_password  = "password@123"
    vm_pswd_auth = "false"

    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    image_publisher              = "Canonical"
    image_offer                  = "0001-com-ubuntu-server-jammy"
    image_sku                    = "22_04-lts"
    image_version                = "latest"
  }


}

# ------------ NSG ------------


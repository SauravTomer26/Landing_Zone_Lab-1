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


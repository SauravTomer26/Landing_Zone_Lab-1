module "RG" {
  source = "../Child_Modules/1_Resource_Group"
  c-rg   = var.p-rg
}

module "VNet" {
  depends_on = [module.RG]
  source     = "../Child_Modules/2_Virtual_Network"
  c-vnet     = var.p-vnet
}

module "Subnet" {
  depends_on = [module.VNet]
  source     = "../Child_Modules/3_Subnet"
  c-snet     = var.p-snet
}

module "Public_IP" {
  depends_on = [module.RG]
  source     = "../Child_Modules/4_Public_IP"
  c-pip      = var.p-pip
}

module "Bastion" {
  depends_on = [module.Subnet, module.Public_IP]
  source     = "../Child_Modules/5_Bastion"
  c-bastion  = var.p-bastion
}


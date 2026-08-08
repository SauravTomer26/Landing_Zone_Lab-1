terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>5.0.0"
    }
  }

  backend "azurerm" {
    storage_account_name = "backendstorgeaccountsrv"
    resource_group_name  = "Saurav_Backend_Storage--rg"
    container_name       = "landingzonelab1container"
    key                  = "dev/state_file"
  }
}

provider "azurerm" {
  features {}
}

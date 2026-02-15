terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-foundational"
    storage_account_name = "zentrafdprodsa"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }

}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  resource_provider_registrations = "none"

}

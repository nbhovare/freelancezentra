
resource "azurerm_resource_group" "rg-vnet-dmz" {
  name     = "rg-vnet-dmz"
  location = var.location
}

resource "azurerm_virtual_network" "dmz" {
  name                = "vnet-dmz-us"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-vnet-dmz.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name             = "vnet-dmz-us-subnet1"
    address_prefixes = ["10.0.1.0/24"]

    delegation {
      name = var.linux_appservice
      service_delegation {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }

  }
}

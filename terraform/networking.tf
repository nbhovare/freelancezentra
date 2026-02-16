
resource "azurerm_resource_group" "rg-vnet-dmz" {
  name     = var.vnet_rg_name
  location = var.location
}

resource "azurerm_virtual_network" "dmz" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-vnet-dmz.name
  address_space       = ["10.0.16.0/20"]

}

resource azurerm_subnet "app_service_subnet" {
  name                 = var.vnet_subnet_name
  resource_group_name  = azurerm_resource_group.rg-vnet-dmz.name
  virtual_network_name = azurerm_virtual_network.dmz.name
  address_prefixes = ["10.0.1.0/20"]

  delegation {
    name = var.linux_appservice
      service_delegation {
        name    = var.azure_app_service_delegation_name
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

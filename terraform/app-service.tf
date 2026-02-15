resource "azurerm_service_plan" "linux_appserviceplan" {
  # Dedicated Linux App Service Plan
  name                = var.linux_appserviceplan
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name    
  sku_name            = "S1"
  os_type = "Linux"
}

resource "azurerm_linux_web_app" "linux_appservice" {
  name                = var.linux_appservice
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name  
  service_plan_id = azurerm_service_plan.linux_appserviceplan.id


  tags = {
    env = "dev"
  }

  site_config {
    linux_fx_version = "python|3.13"
  }

  app_settings = {
    ENABLE_ORYX_BUILD              = true
    SCM_DO_BUILD_DURING_DEPLOYMENT = true
    test                           = "123"
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "example" {
  app_service_id = azurerm_app_service.linux_appservice.id

  subnet_id = [
    for s in azurerm_virtual_network.dmz.subnet :
    s.id if s.name == "vnet-dmz-us-subnet1"
  ][0]

  # subnet_id      = azurerm_virtual_network.dmz.subnet.vnet-dmz-us-subnet1.id
}
resource "azurerm_service_plan" "linux_appserviceplan" {
  # Dedicated Linux App Service Plan
  name                = var.linux_appserviceplan
  location            = var.location
  resource_group_name = var.resource_group
  sku_name            = var.sku_code
  os_type = "Linux"
}

resource "azurerm_linux_web_app" "linux_appservice" {
  name                = var.linux_appservice
  location            = var.location
  resource_group_name = var.resource_group    
  service_plan_id = var.linux_appserviceplan
  webdeploy_publish_basic_authentication_enabled = true  

  site_config {
    application_stack {
      python_version = var.app_stack
    } 
  }

  app_settings = {
    for key, value in var.app_settings : key => value   
  }
}
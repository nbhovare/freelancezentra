resource "azurerm_resource_group" "devops-rg" {
  name     = var.resource_group
  location = var.location
}

module "linux_appservice_plan" {
  source = "../../modules/app_service/"
  name                = "${var.linux_appservice}-plan"
  resource_group_name = azurerm_resource_group.devops-rg.name
  location            = azurerm_resource_group.devops-rg.location
  sku_code            = var.sku_code
}

module "linux_appservice" {
  source = "../../modules/app_service/"

  name                 = var.linux_appservice
  resource_group_name  = var.resource_group
  location             = var.location
  linux_appserviceplan = module.linux_appservice_plan.name.id
}

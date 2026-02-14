data "azurerm_resource_group" "storage_acc_rg" {
  name = var.storage_acc_rg_name
}

data "azurerm_storage_account" "storage_acc" {
  resource_group_name = data.azurerm_resource_group.storage_acc_rg.name
  name                = var.storage_acc_name
}

data "azurerm_storage_container" "sa_container" {
  storage_account_name = data.azurerm_storage_account.storage_acc.name
  name                 = var.sa_container_name
}
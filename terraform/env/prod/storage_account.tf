/*
resource "azurerm_resource_group" "storage_acc_rg" {
  name     = var.storage_acc_rg_name
  location = var.storage_acc_rg_location
}

resource "azurerm_management_lock" "storage_acc_rg_lock" {
  name       = "${var.storage_acc_rg_name}-lock"
  scope      = azurerm_resource_group.storage_acc_rg.id
  lock_level = "CanNotDelete"
  notes      = "This Resource Group is CanNotDelete"
}

resource "azurerm_storage_account" "storage_acc" {
  name                     = var.storage_acc_name
  resource_group_name      = azurerm_resource_group.storage_acc_rg.name
  location                 = azurerm_resource_group.storage_acc_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "production"
  }
}

resource "azurerm_storage_container" "sa_container" {
  name                  = var.sa_container_name
  storage_account_name  = azurerm_storage_account.storage_acc.name
  container_access_type = "private"
}

# Network Rules for this Storage Account

resource "azurerm_storage_account_network_rules" "storage_acc_nw_rules" {
  storage_account_id = azurerm_storage_account.storage_acc.id
  default_action     = "Allow"
}

*/
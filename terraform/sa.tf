resource azurerm_storage_account storage_acc {
    name                     = "fdprod123"
    resource_group_name      = var.app_service_resource_group_name
    location                 = var.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
    
    tags = {
        environment = "production"
    }
}
variable "linux_appserviceplan" {
  type = string
}

variable "linux_appservice" {
  type = string
}

variable "location" {
  type = string
}

variable "size" {
  type = string
}

variable "tier" {
  type = string
}

variable "app_service_resource_group_name" {
  type = string
}

variable "azure_app_service_delegation_name" {
  type = string
}

### Networking Variables ###

variable "vnet_name" {
  type = string
}

variable "vnet_subnet_name" {
  type = string
}

variable "vnet_rg_name" {
  type = string
}

/*

variable "storage_acc_rg_location" {
  type = string
}

variable "storage_acc_rg_name" {
  type = string
}

variable "storage_acc_name" {
  type = string
}

variable "sa_container_name" {
  type = string
}

*/
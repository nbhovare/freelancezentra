data "azurerm_resource_group" "resource_group" {
  name = "devops"
}

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
variable "linux_appserviceplan" {
  type = string
}

variable "linux_appservice" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}

variable "sku_code" {
  type    = string
  default = "B1"
}

variable "app_stack" {
  type = string
}

variable "app_settings" {
  type = map(any)
}

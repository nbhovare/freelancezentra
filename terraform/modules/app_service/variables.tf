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
  type = string
  default = "B1"
}

variable "service_plan_id" {
  type = string
}

variable "app_stack" {
  type = string
  validation {
    condition = var.app_stack >= "3.12"
    error_message = "Invalid app_stack value. Allowed values are: 3.12 or greater."
  }
}

variable "app_settings" {
  type = map
  
  validation {
    condition = (
      lookup  (var.app_settings, "WEBSITE_WEBDEPLOY_USE_SCM", null) == null ||
      lookup  (var.app_settings, "WEBSITE_WEBDEPLOY_USE_SCM", null) == "true"
    )
    error_message = "Linux App Service requires WEBSITE_WEBDEPLOY_USE_SCM to be set to true or not set at all in app_settings."
    
  }
}

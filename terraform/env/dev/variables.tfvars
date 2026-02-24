linux_appservice = "aas-am-devops-dev"
resource_group   = "rg-devops-dev"
location         = "centralus"
sku_code         = "B1"
app_stack        = "3.11"

app_settings = {
  "WEBSITE_RUN_FROM_PACKAGE"  = "1"
  "WEBSITE_WEBDEPLOY_USE_SCM" = "false"
}

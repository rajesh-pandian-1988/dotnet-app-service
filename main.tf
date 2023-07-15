resource "azurerm_resource_group" "terraform_app_service_rg" {
  name     = "terraform-app-service-rg"
  location = var.location
}

resource "azurerm_service_plan" "terraform_app_service_plan" {
  name                = "terraform-app-service-plan"
  location            = azurerm_resource_group.terraform_app_service_rg.location
  resource_group_name = azurerm_resource_group.terraform_app_service_rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "terraform_app_service" {
  name                = "linuxappservice07152023"
  location            = azurerm_resource_group.terraform_app_service_rg.location
  resource_group_name = azurerm_resource_group.terraform_app_service_rg.name
  service_plan_id     = azurerm_service_plan.terraform_app_service_plan.id
  site_config {
    always_on         = false
    use_32_bit_worker = true
    application_stack {
      dotnet_version = "6.0"
    }
  }
}

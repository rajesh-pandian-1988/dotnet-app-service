output "app-url" {
  value = "https://${azurerm_linux_web_app.terraform_app_service.name}.azurewebsites.net"
}

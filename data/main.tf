# data block is to get the info from provider or existing resources

data "azurerm_resource_group" "example" {
  name = "project-setup"
}

output "id" {
  value = data.azurerm_resource_group.example.id
}
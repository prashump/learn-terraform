# data block is to get the info from provider or existing resources

provider "azurerm" {
  features {}
  subscription_id = "fce3d656-0949-412a-9e49-d5c96a4783c9"
}

data "azurerm_resource_group" "example" {
  name = "project-setup"
}

output "id" {
  value = data.azurerm_resource_group.example
}
provider "azurerm" {
  features {}
  subscription_id = "fce3d656-0949-412a-9e49-d5c96a4783c9"
}

variable "nodes" {
  default = {
    test1 = {
      private_ip_address_allocation = "Static"
    }
    test2 = {

    }
  }
}
resource "azurerm_network_interface" "privateip" {
  for_each            = var.nodes
  name                = "${each.key}-ip"
  location            = "UK West"
  resource_group_name = "project-setup"

  ip_configuration {
    name                          = "${each.key}-ip"
    subnet_id                     = "/subscriptions/fce3d656-0949-412a-9e49-d5c96a4783c9/resourceGroups/project-setup/providers/Microsoft.Network/virtualNetworks/project-setup-network/subnets/default"
    private_ip_address_allocation = length(each.value["private_ip_address_allocation"]) > 0 ? each.value["private_ip_address_allocation"] : "Dynamic"
  }
}
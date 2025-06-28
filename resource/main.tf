# providers
# resource  "abc"  "xyz"{
#   x = 10
#   y = 20
# }

# abc label is by provider
# xyz local resource label we are giving our own name
# x , y arguments 10 , 20 are inputs key : value
# Attributes by resource

# terraform init plan apply destroy

provider "azurerm" {
  # resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = "fce3d656-0949-412a-9e49-d5c96a4783c9"
}

# variable "prefix" {
#   default = "tfvmex"
# }
#
# resource "azurerm_resource_group" "example" {
#   name     = "${var.prefix}-resources"
#   location = "West Europe"
# }
#
# resource "azurerm_virtual_network" "main" {
#   name                = "${var.prefix}-network"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }
#
# resource "azurerm_subnet" "internal" {
#   name                 = "internal"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = ["10.0.2.0/24"]
# }
#
# resource "azurerm_network_interface" "main" {
#   name                = "${var.prefix}-nic"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#
#   ip_configuration {
#     name                          = "testconfiguration1"
#     subnet_id                     = azurerm_subnet.internal.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

resource "azurerm_virtual_machine" "test" {
  name                  = "test-vm"
  location              = "UK West"
  resource_group_name   = "project-setup"
  network_interface_ids = ["/subscriptions/fce3d656-0949-412a-9e49-d5c96a4783c9/resourceGroups/project-setup/providers/Microsoft.Network/networkInterfaces/terraform-testing"]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/fce3d656-0949-412a-9e49-d5c96a4783c9/resourceGroups/project-setup/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "test-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "test-vm"
    admin_username = "azuser"
    admin_password = "Devops@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  # tags = {
  #   environment = "staging"
  # }
}
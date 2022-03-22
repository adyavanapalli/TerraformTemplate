terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

# locals {
#   common_resource_suffix = "tftemplate-eastus"
# }

# data "azurerm_resource_group" "resource_group" {
#   name = "rg-${local.common_resource_suffix}"
# }

# resource "azurerm_virtual_network" "virtual_network" {
#   address_space       = ["10.0.0.0/29"]
#   location            = data.azurerm_resource_group.resource_group.location
#   name                = "vnet-${local.common_resource_suffix}"
#   resource_group_name = data.azurerm_resource_group.resource_group.name
# }

# resource "azurerm_subnet" "subnet" {
#   address_prefixes     = ["10.0.0.0/29"]
#   name                 = "snet-${local.common_resource_suffix}"
#   resource_group_name  = data.azurerm_resource_group.resource_group.name
#   virtual_network_name = azurerm_virtual_network.virtual_network.name
# }

# resource "azurerm_network_interface" "network_interface" {
#   ip_configuration {
#     name                          = "nicip-${local.common_resource_suffix}"
#     private_ip_address_allocation = "Dynamic"
#     subnet_id                     = azurerm_subnet.subnet.id
#   }
#   location            = data.azurerm_resource_group.resource_group.location
#   name                = "nic-${local.common_resource_suffix}"
#   resource_group_name = data.azurerm_resource_group.resource_group.name
# }

# resource "azurerm_network_security_group" "network_security_group" {
#   location            = data.azurerm_resource_group.resource_group.location
#   name                = "nsg-${local.common_resource_suffix}"
#   resource_group_name = data.azurerm_resource_group.resource_group.name
# }

# resource "azurerm_network_security_rule" "network_security_rule" {
#   access                      = "Deny"
#   destination_address_prefix  = "*"
#   destination_port_range      = "*"
#   direction                   = "Inbound"
#   name                        = "nsr-${local.common_resource_suffix}"
#   network_security_group_name = azurerm_network_security_group.network_security_group.name
#   priority                    = "100"
#   protocol                    = "*"
#   resource_group_name         = data.azurerm_resource_group.resource_group.name
#   source_address_prefix       = "*"
#   source_port_range           = "*"
# }

# resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
#   subnet_id                 = azurerm_subnet.subnet.id
#   network_security_group_id = azurerm_network_security_group.network_security_group.id
# }

# data "azurerm_platform_image" "platform_image" {
#   offer     = "0001-com-ubuntu-server-hirsute"
#   location  = data.azurerm_resource_group.resource_group.location
#   publisher = "Canonical"
#   sku       = "21_04-gen2"
# }

# resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
#   admin_ssh_key {
#     public_key = var.public_key
#     username   = var.username
#   }
#   admin_username             = var.username
#   allow_extension_operations = false
#   location                   = data.azurerm_resource_group.resource_group.location
#   name                       = "vm-${local.common_resource_suffix}"
#   network_interface_ids      = [azurerm_network_interface.network_interface.id]
#   os_disk {
#     caching              = "None"
#     name                 = "osdisk-${local.common_resource_suffix}"
#     storage_account_type = "Standard_LRS"
#   }
#   resource_group_name = data.azurerm_resource_group.resource_group.name
#   size                = "Standard_B1ls"
#   source_image_reference {
#     offer     = data.azurerm_platform_image.platform_image.offer
#     publisher = data.azurerm_platform_image.platform_image.publisher
#     sku       = data.azurerm_platform_image.platform_image.sku
#     version   = data.azurerm_platform_image.platform_image.version
#   }
# }

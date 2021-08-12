provider "azurerm" {
    version = 1.38
    }

# Create virtual network
resource "azurerm_virtual_network" "TFNet" {
    name                = "arunnetwork"
    address_space       = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = "terraform-rg"

    tags = {
        environment = "Terraform Networking"
    }
}

# Create subnet
resource "azurerm_subnet" "tfsubnet1" {
    name                 = "LabSubnet1"
    resource_group_name = "terraform-rg"
    virtual_network_name = azurerm_virtual_network.TFNet.name
    address_prefix       = "10.0.1.0/24"
}
resource "azurerm_subnet" "tfsubnet2" {
    name                 = "LabSubnet2"
    resource_group_name = "terraform-rg"
    virtual_network_name = azurerm_virtual_network.TFNet.name
    address_prefix       = "10.0.2.0/24"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg1
  location = var.location
}

resource "azurerm_virtual_network" "vt_net" {
    name                = var.v_net
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space       = var.vnet_addr_space  
}

resource "azurerm_subnet" "subnet1" {
    name                            = var.subnet1
    resource_group_name             = azurerm_resource_group.rg.name
    virtual_network_name            = azurerm_virtual_network.vt_net.name
    address_prefixes                = var.subnet1_address_prefixes 
}


resource "azurerm_network_security_group" "nsg1" {
  name                            = var.nsg1["name"]
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
 

  security_rule {
    name                       = var.nsg1["security_rule"]
    priority                   = var.nsg1[ "priority" ]
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = var.nsg1["destination_port_range"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet" "subnet2" {
    name                            = var.subnet2
    resource_group_name             = azurerm_resource_group.rg.name
    virtual_network_name            = azurerm_virtual_network.vt_net.name
    address_prefixes                = var.subnet2_address_prefixes 
}

resource "azurerm_network_security_group" "nsg2" {
  name                            = var.nsg2["name"]
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
 

  security_rule {
    name                       = var.nsg2["security_rule1"]
    priority                   = var.nsg2[ "priority1" ]
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = var.nsg2["destination_port_range1"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
security_rule {
    name                       = var.nsg2["security_rule2"]
    priority                   = var.nsg2[ "priority2" ]
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = var.nsg2["destination_port_range2"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "network-assoctation" {
   network_security_group_id = azurerm_network_security_group.nsg1.id
   subnet_id                 = azurerm_subnet.subnet1.id

}

resource "azurerm_subnet_network_security_group_association" "network-assoctation2" {
   network_security_group_id = azurerm_network_security_group.nsg2.id
   subnet_id                 = azurerm_subnet.subnet2.id
}


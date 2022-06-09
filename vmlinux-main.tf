resource "azurerm_network_interface" "nic" {
    count               = var.nb_count
    name                = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    tags                = local.common_tags
    lifecycle {
      ignore_changes = [tags, ]
    }
    
    ip_configuration {
      name = "${var.linux_name}-ipconfig1-${format("%1d", count.index + 1)}"
      subnet_id  = azurerm_subnet.subnet1.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = element(azurerm_public_ip.pip[*].id, count.index + 1)
    }
    
}

resource "azurerm_availability_set" "avail_set" {
  name = "${var.linux_avs}_availibility_set"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  platform_fault_domain_count   = 2
  platform_update_domain_count  = 5
}

resource "azurerm_public_ip" "pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  tags                = local.common_tags
  lifecycle {
      ignore_changes = [tags, ]
    }
}

resource "azurerm_linux_virtual_machine" "vm" {
   count                 = var.nb_count
   name                  = "${var.linux_name}${format("%1d", count.index + 1)}"
   location              = azurerm_resource_group.rg.location
   resource_group_name   = azurerm_resource_group.rg.name 
   size                  = var.linux_size
   admin_username        = var.admin_username
   tags                = local.common_tags
   network_interface_ids = [element(azurerm_network_interface.nic[*].id, count.index + 1)]
   lifecycle {
      ignore_changes = [tags, ]
    }
   
   admin_password = var.admin_password
   disable_password_authentication =  false

   os_disk {
    storage_account_type     = var.OS_disk["storage_account_type"]
    caching                  = var.OS_disk["caching"]
    disk_size_gb             = var.OS_disk["disk_size"]
  }

  source_image_reference {
    publisher = var.UbuntuLinuxOS["publisher"]
    offer     = var.UbuntuLinuxOS["offer"]
    sku       = var.UbuntuLinuxOS["sku"]
    version   = var.UbuntuLinuxOS["version"]
  }

}
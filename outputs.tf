output "VM_hostname" {
    value = azurerm_linux_virtual_machine.vm[*].name
}


output "linux_availibility_set" {
    value = azurerm_availability_set.avail_set.name
}

output "VMPrivateIpAddr" {
    value = azurerm_network_interface.nic[*].private_ip_address
}

output "VMPublicIpAddr" {
    value = azurerm_linux_virtual_machine.vm[*].public_ip_address
}

output "VMVnetName" {
    value = azurerm_virtual_network.vt_net.name
}

output "AddressSpace" {
    value = azurerm_virtual_network.vt_net.address_space
}

output "SubnetName1" {
    value = azurerm_subnet.subnet1.name
}

output "SubnetName2" {
    value = azurerm_subnet.subnet2.name
}

output "AddressSpace1" {
    value = azurerm_subnet.subnet1.address_prefixes
}

output "AddressSpace2" {
    value = azurerm_subnet.subnet2.address_prefixes
}
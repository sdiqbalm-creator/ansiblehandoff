output "subnet_id" {
  value       = azurerm_subnet.subnet.id
  description = "Resource ID of the subnet — consumed by the compute module"
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "Resource ID of the Virtual Network"
}

output "nsg_id" {
  value       = azurerm_network_security_group.nsg.id
  description = "Resource ID of the Network Security Group"
}

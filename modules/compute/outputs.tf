output "public_ip_address" {
  value       = azurerm_public_ip.pip.ip_address
  description = "Public IP address of the VM"
}

output "private_ip_address" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "Private IP address of the VM"
}

output "vm_id" {
  value       = azurerm_linux_virtual_machine.vm.id
  description = "Resource ID of the VM"
}

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

output "managed_identity_principal_id" {
  value       = azurerm_linux_virtual_machine.vm.identity[0].principal_id
  description = "Principal ID of the VM's system-assigned managed identity. Use this to grant RBAC roles to the VM identity."
}

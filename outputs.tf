# =======================================================================
# outputs.tf — Root module outputs
# =======================================================================

output "vm_public_ip" {
  value       = module.compute.public_ip_address
  description = "Public IP address of the provisioned VM"
}

output "vm_private_ip" {
  value       = module.compute.private_ip_address
  description = "Private IP address of the provisioned VM"
}

# SSH via Azure AD — no private key needed on your laptop
output "ssh_command" {
  value       = "az ssh vm --resource-group ${var.resource_group_name} --vm-name ${var.vm_name}"
  description = "Ready-to-run SSH command using Azure AD identity — no key file required"
}

output "nginx_url" {
  value       = "http://${module.compute.public_ip_address}"
  description = "URL to verify nginx is running after Ansible completes"
}

output "ansible_run_command" {
  value       = "ansible-playbook -i ansible/azure_rm.yml ansible/playbook.yml"
  description = "Command to run Ansible against all VMs discovered dynamically from Azure"
}

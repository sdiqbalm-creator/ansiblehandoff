# =======================================================================
# ANSIBLETEST: Terraform + Ansible with Azure AD SSH + Dynamic Inventory
#
# WHAT CHANGED FROM SCENARIO 6:
# - SSH key files removed. Access is via Azure AD (AADSSHLoginForLinux).
# - No local_file inventory — Ansible uses the azure_rm dynamic plugin
#   which queries Azure directly at runtime. Always current, never stale.
# - No null_resource — Ansible is decoupled from Terraform. Run it
#   separately after apply using: ansible-playbook -i ansible/azure_rm.yml ansible/playbook.yml
# - The tls resource generates a throw-away keypair just to satisfy the
#   Azure API. The private key is never written to disk.
#
# INTERVIEW TALKING POINT:
# "Terraform owns the immutable layer — VM, network, identity, RBAC.
#  Ansible owns the mutable layer — packages, config, service state.
#  The handoff is no longer a static file. Ansible talks directly to the
#  Azure API using the azure_rm plugin and discovers targets from the
#  'role' tag. No IP to track. No file to go stale."
# =======================================================================

# -----------------------------------------------------------------------
# Resource Group
# -----------------------------------------------------------------------
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

# -----------------------------------------------------------------------
# Networking Module
# -----------------------------------------------------------------------
module "networking" {
  source = "./modules/networking"

  vnet_name           = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  subnet_name         = var.subnet_name
  subnet_prefix       = var.subnet_prefix
  allowed_ssh_cidr    = var.allowed_ssh_cidr
  tags                = local.common_tags
}

# -----------------------------------------------------------------------
# Compute Module
# -----------------------------------------------------------------------
module "compute" {
  source = "./modules/compute"

  vm_name             = var.vm_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.networking.subnet_id
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_object_id     = var.admin_object_id
  tags                = local.common_tags
}

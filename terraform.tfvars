# =======================================================================
# terraform.tfvars — Your actual environment values
#
# ACTION REQUIRED: Replace every value marked with a comment
# =======================================================================

resource_group_name = "ansibletest-rg"
location            = "eastus"

# Networking
vnet_name          = "ansibletest-vnet"
vnet_address_space = "10.10.0.0/16"
subnet_name        = "websubnet"
subnet_prefix      = "10.10.1.0/24"

# REPLACE THIS: Run `curl ifconfig.me` to get your public IP, add /32
allowed_ssh_cidr = "REPLACE_WITH_YOUR_PUBLIC_IP/32"

# Compute
vm_name        = "ansibletest-vm"
vm_size        = "Standard_B1s"
admin_username = "azureuser"

# Your Azure AD Object ID — used to grant you SSH access via AAD
# Run: az ad signed-in-user show --query id -o tsv
admin_object_id = "REPLACE_WITH_YOUR_OBJECT_ID"

# Tags
environment = "dev"
owner       = "syed-iqbal"
cost_center = "CC-1001"
project     = "terraform-ansible-aad"

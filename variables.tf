variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create"
}

variable "location" {
  type        = string
  description = "Azure region for all resources"
  default     = "eastus"
}

# Networking
variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "vnet_address_space" {
  type        = string
  description = "Address space for the VNet e.g. 10.10.0.0/16"
}

variable "subnet_name" {
  type        = string
  description = "Name of the web subnet"
}

variable "subnet_prefix" {
  type        = string
  description = "Address prefix for the subnet e.g. 10.10.1.0/24"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "Your public IP in CIDR notation e.g. 1.2.3.4/32. Run: curl ifconfig.me"

  validation {
    condition     = var.allowed_ssh_cidr != "0.0.0.0/0"
    error_message = "SSH must not be open to the entire internet. Set allowed_ssh_cidr to your specific public IP e.g. 1.2.3.4/32"
  }
}

# Compute
variable "vm_name" {
  type        = string
  description = "Name of the Linux virtual machine"
}

variable "vm_size" {
  type        = string
  description = "Azure VM SKU. Use Standard_B1s to stay within free trial limits."
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username on the VM"
  default     = "azureuser"
}

variable "admin_object_id" {
  type        = string
  description = "Azure AD Object ID of the user allowed to SSH via AAD. Run: az ad signed-in-user show --query id -o tsv"
}

# Tagging
variable "environment" {
  type        = string
  description = "Environment name: dev, staging, or prod"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod"
  }
}

variable "owner" {
  type        = string
  description = "Name or team responsible for this resource"
}

variable "cost_center" {
  type        = string
  description = "Cost center code used by finance for chargeback"
}

variable "project" {
  type        = string
  description = "Project name for grouping costs"
}

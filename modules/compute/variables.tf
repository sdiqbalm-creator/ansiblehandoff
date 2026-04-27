variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "subnet_id" {
  type        = string
  description = "Resource ID of the subnet to attach the NIC to — comes from networking module output"
}

variable "vm_size" {
  type        = string
  description = "Azure VM SKU e.g. Standard_B1s"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username on the VM"
  default     = "azureuser"
}

variable "admin_object_id" {
  type        = string
  description = "Azure AD Object ID granted the Virtual Machine Administrator Login role"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources in this module"
  default     = {}
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "address_space" {
  type        = string
  description = "Address space for the VNet e.g. 10.10.0.0/16"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "subnet_prefix" {
  type        = string
  description = "Address prefix for the subnet e.g. 10.10.1.0/24"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "Specific CIDR block allowed for SSH — must not be 0.0.0.0/0"

  validation {
    condition     = var.allowed_ssh_cidr != "0.0.0.0/0"
    error_message = "SSH must not be open to 0.0.0.0/0. Provide a specific CIDR e.g. 1.2.3.4/32"
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources in this module"
  default     = {}
}

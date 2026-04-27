terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.69.0"
    }
    # tls provider generates a throw-away SSH keypair purely to satisfy the
    # Azure API requirement that every Linux VM has at least one SSH key.
    # Day-to-day access goes through Azure AD (AADSSHLoginForLinux extension).
    # The generated private key is never stored anywhere — it is kept only in
    # Terraform state and never written to disk or used by humans.
    tls = {
      source  = "hashicorp/tls"
      version = ">=4.0.0"
    }
  }

  # -------------------------------------------------------------------
  # Remote Backend — uncomment after creating the Storage Account
  # -------------------------------------------------------------------
  # backend "azurerm" {
  #   resource_group_name  = "tfstate-rg"
  #   storage_account_name = "siqbaltfstate001"
  #   container_name       = "tfstate"
  #   key                  = "ansibletest/dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  tenant_id       = "0b5ac31e-e17a-4021-9d04-550f86320765"
  subscription_id = "7bd2f18c-4871-4974-9580-dee988ee01e7"
}

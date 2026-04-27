# =======================================================================
# locals.tf — Centralized tag map applied to every resource
#
# INTERVIEW TALKING POINT:
# "We had an audit finding — 40% of Azure resources had no tags. Finance
#  couldn't allocate costs. I centralized all tags in a locals block so
#  every resource gets the same tag set with a single reference.
#  The 'role' tag is what the azure_rm dynamic inventory plugin uses to
#  group VMs into Ansible host groups automatically. No static inventory
#  file needed — Ansible discovers targets from Azure directly."
# =======================================================================

locals {
  common_tags = {
    environment  = var.environment
    owner        = var.owner
    cost_center  = var.cost_center
    project      = var.project
    managed_by   = "terraform"
    role         = "webserver"   # Used by azure_rm plugin to build [webservers] group
  }
}

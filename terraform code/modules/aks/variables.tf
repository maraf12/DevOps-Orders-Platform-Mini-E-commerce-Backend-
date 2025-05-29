variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "log_analytics_workspace_id" {}
variable "node_count" { default = 1 }
variable "vm_size" { default = "Standard_B2s" }

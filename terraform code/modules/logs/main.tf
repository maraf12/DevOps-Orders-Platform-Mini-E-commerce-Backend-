resource "azurerm_log_analytics_workspace" "this" {
  name                = "logs-${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

output "workspace_id" {
  value = azurerm_log_analytics_workspace.this.id
}

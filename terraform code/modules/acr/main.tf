resource "azurerm_container_registry" "this" {
  name                = "acr${random_string.suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

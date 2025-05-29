resource "azurerm_postgresql_flexible_server" "this" {
  name                   = "pg-${random_string.suffix.result}"
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "13"
  administrator_login    = "pgadmin"
  administrator_password = "ChangeMe123!"
  sku_name               = "B1ms"
  storage_mb             = 5120
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  name             = "AllowAll"
  server_id        = azurerm_postgresql_flexible_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

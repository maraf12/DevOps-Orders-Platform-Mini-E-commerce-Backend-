provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../../modules/resource_group"
  name   = "devops-rg"
  location = var.location
}

module "logs" {
  source              = "../../modules/logs"
  resource_group_name = module.resource_group.name
  location            = var.location
}

module "aks" {
  source                     = "../../modules/aks"
  name                       = "devops-aks"
  location                   = var.location
  resource_group_name        = module.resource_group.name
  log_analytics_workspace_id = module.logs.workspace_id
}

module "acr" {
  source              = "../../modules/acr"
  resource_group_name = module.resource_group.name
  location            = var.location
}

module "keyvault" {
  source              = "../../modules/keyvault"
  resource_group_name = module.resource_group.name
  location            = var.location
}

module "postgres" {
  source              = "../../modules/postgres"
  resource_group_name = module.resource_group.name
  location            = var.location
}

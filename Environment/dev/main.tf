terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "amit-rg"
    storage_account_name = "stg121amit"
    container_name       = "ctg121amit"
    key                  = "test.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "86c2c7ab-0841-425a-9004-95c83c2075de"
}

module "resource_group" {
  source = "../../modules/resource_group"
  rgs    = var.rgs_mod # child_variable = var.parent_variable
}

module "key_vaults" {
  depends_on = [module.resource_group]
  source     = "../../modules/key_vault"
  key_vault  = var.key_vault
}

module "network" {
  depends_on = [module.resource_group]
  source     = "../../modules/networking"
  vnets      = var.vnets_mod # child_variable = var.parent_variable
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/public_ip"
  pips       = var.pips_mod
}

module "compute" {
  # since public IP depends on resource group and virtual network
  # But we have already set vnet dependency on resource group
  # so even if we set only public IP dependency here it will work fine
  depends_on = [module.network, module.public_ip, module.resource_group]
  source     = "../../modules/compute"
  vms        = var.vms_mod
}

module "sql_server" {
  depends_on      = [module.resource_group]
  source          = "../../modules/sql_server"
  sql_server_name = "dholu-sql-server"
  rg_name         = "dhondu"
  location        = "eastus"
  admin_username  = "dholu"
  admin_password  = "Without@12345"
  tags = {
    environment = "dev-test"
    owner       = "uinocorn"
  }
}

module "sql_database" {
  depends_on  = [module.sql_server]
  source      = "../../modules/sql_db"
  sql_db_name = "dhondu-db"
  server_id   = module.sql_server.server_id
  max_size_gb = 2
  tags = {
    environment = "dev-test"
    owner       = "uinocorn"
  }
}

module "network_security_group" {
  depends_on = [module.resource_group, module.network]
  source     = "../../modules/nsg"
  nsg        = var.nsgs
}

module "application_security_group" {
  depends_on = [module.resource_group, module.compute]
  source     = "../../modules/asg"
  asg        = var.asg_mod
}

module "container_registry" {
  depends_on = [module.resource_group]
  source     = "../../modules/acr"
  acr        = var.acr_mod
}

# module "bastion_host" {
#   depends_on = [module.resource_group, module.network, module.public_ip]
#   source     = "../../modules/bastion"
#   bastion    = var.bastion_mod
# }
data "terraform_remote_state" "rg" {
    backend = "remote"
    workspace = "resource-group-${var.environment}"
    config = {
        organization = "azprolab"
        workspaces = {
            prefix = "resource-group-"
        }
  }
}

resource "azurerm_virtual_network" "vnet" {
    name = var.nw_vnet_name
    resource_group_name =  var.nw_resource_group_name
    location = var.nw_location
    address_space = var.nw_address_space
    # name = "sree-${var.project_code}-${var.location}-${var.environment}-vnet"
    # resource_group_name = data.terraform_remote_state.rg.outputs.resource_group_name
    # location = var.location
    # address_space = [ "10.228.0.0/26" ]
}

resource "azurerm_subnet" "snet" {
    name = "${azurerm_virtual_network.vnet.name}-snet"
    resource_group_name = var.nw_resource_group_name
    address_prefixes = var.nw_subnet_address_prefixes
    virtual_network_name = azurerm_virtual_network.vnet.name
    # resource_group_name = data.terraform_remote_state.rg.outputs.resource_group_name
    # address_prefixes = [ "10.228.0.0/27" ]
    # virtual_network_name = azurerm_virtual_network.vnet.name
    # depends_on = [ azurerm_virtual_network.vnet ]
}
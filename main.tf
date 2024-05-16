resource "azurerm_virtual_network" "vnet" {
    name = var.nw_vnet_name
    resource_group_name =  var.nw_resource_group_name
    location = var.nw_location
    address_space = var.nw_address_space
}

resource "azurerm_subnet" "snet" {
    name = "${azurerm_virtual_network.vnet.name}-snet"
    resource_group_name = var.nw_resource_group_name
    address_prefixes = var.nw_subnet_address_prefixes
    virtual_network_name = azurerm_virtual_network.vnet.name
    depends_on = [ azurerm_virtual_network.vnet ]
}
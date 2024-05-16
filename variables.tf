variable "project_code" {
    default = ""
    type = string
    description = "shortcode for project"
}

variable "location" {
    default = ""
    type = string
    description = "location where project is hosted"
}

variable "environment" {
    default = ""
    type = string
    description = "host in the environment"
}

variable "nw_vnet_name" {
    default = ""
    description = "network name"
    type = string
}

variable "nw_resource_group_name" {
    type = string
    default = ""
}

variable "nw_location" {
    type = string
    default = ""
}

variable "nw_address_space" {
    type = list(string)
    default = [ "" ]
}

variable "nw_subnet_address_prefixes" {
    type = list(string)
    default = [ "" ]
}
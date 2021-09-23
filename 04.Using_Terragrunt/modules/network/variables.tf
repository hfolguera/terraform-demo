variable "compartment_id" {
    description = "OCID of the compartment for the network"
    type = string
}

variable "vcn_cidr_blocks" {
    description = "CIDR list for the VCN"
    type = list
}

variable "vcn_display_name" {
    description = "VCN friendly name"
    type = string
}

variable "subnet_cidr_block" {
    description = "Subnet CIDR block"
    type = string
}

variable "subnet_display_name" {
    description = "Subnet friendly name"
    type = string
}
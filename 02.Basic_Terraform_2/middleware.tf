resource "oci_identity_compartment" "terraform_demo_mw_compartment" {
  compartment_id = var.compartment_id
  description    = "Compartment for Middleware Terraform Demo"
  name           = "terraform_demo_mw"
  enable_delete  = true
}

resource "oci_core_vcn" "terraform_demo_mw_vcn01" {
  compartment_id = oci_identity_compartment.terraform_demo_mw_compartment.id

  cidr_blocks  = ["192.168.2.0/24"]
  display_name = "terraform_demo_mw_vcn01"
}

resource "oci_core_subnet" "terraform_demo_mw_subnet01" {
  cidr_block     = "192.168.2.0/24"
  compartment_id = oci_identity_compartment.terraform_demo_mw_compartment.id
  vcn_id         = oci_core_vcn.terraform_demo_mw_vcn01.id
  display_name   = "terraform_demo_mw_subnet01"

}

resource "oci_core_default_dhcp_options" "terraform_demo_mw_vcn01_dhcp" {
  manage_default_resource_id = oci_core_vcn.terraform_demo_mw_vcn01.default_dhcp_options_id

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  options {
    type                = "SearchDomain"
    search_domain_names = ["vcn.oraclevcn.com"]
  }

  display_name = "terraform_demo_mw_vcn01_default_dhcp"
}

resource "oci_core_default_route_table" "terraform_demo_mw_vcn01_rt" {
  manage_default_resource_id = oci_core_vcn.terraform_demo_mw_vcn01.default_route_table_id

  display_name = "terraform_demo_mw_vcn01_default_rt"
}

resource "oci_core_default_security_list" "terraform_demo_mw_vcn01_sl" {
  manage_default_resource_id = oci_core_vcn.terraform_demo_mw_vcn01.default_security_list_id
  display_name               = "terraform_demo_mw_vcn01_default_sl"
}
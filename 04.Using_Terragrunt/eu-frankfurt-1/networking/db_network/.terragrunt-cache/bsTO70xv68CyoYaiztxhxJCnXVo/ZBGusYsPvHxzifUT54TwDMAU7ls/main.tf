resource "oci_core_vcn" "this" {
  compartment_id = var.compartment_id

  cidr_blocks  = var.vcn_cidr_blocks
  display_name = var.vcn_display_name
}

resource "oci_core_subnet" "this" {
  cidr_block     = var.subnet_cidr_block
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = var.subnet_display_name
}

resource "oci_core_default_dhcp_options" "this" {
    manage_default_resource_id = oci_core_vcn.this.default_dhcp_options_id

    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }

    options {
        type = "SearchDomain"
        search_domain_names = ["vcn.oraclevcn.com"]
    }

    display_name = "${var.vcn_display_name}_default_dhcp"
}

resource "oci_core_default_route_table" "this" {
    manage_default_resource_id = oci_core_vcn.this.default_route_table_id

    display_name = "${var.vcn_display_name}_default_rt"
}

resource "oci_core_default_security_list" "this" {
    manage_default_resource_id = oci_core_vcn.this.default_security_list_id
    display_name = "${var.vcn_display_name}_default_sl"
}

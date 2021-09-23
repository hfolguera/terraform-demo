resource "oci_identity_compartment" "terraform_demo_db_compartment" {
  compartment_id = var.compartment_id
  description    = "Compartment for Database Terraform Demo"
  name           = "terraform_demo_db"
  enable_delete  = true
}

resource "oci_core_vcn" "terraform_demo_db_vcn01" {
  compartment_id = oci_identity_compartment.terraform_demo_db_compartment.id

  cidr_blocks  = ["192.168.1.0/24"]
  display_name = "terraform_demo_db_vcn01"
}

resource "oci_core_subnet" "terraform_demo_db_subnet01" {
  cidr_block     = "192.168.1.0/24"
  compartment_id = oci_identity_compartment.terraform_demo_db_compartment.id
  vcn_id         = oci_core_vcn.terraform_demo_db_vcn01.id
  display_name   = "terraform_demo_db_subnet01"

}

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
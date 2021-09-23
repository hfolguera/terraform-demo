resource "oci_identity_compartment" "this" {
  compartment_id = var.compartment_id
  description    = var.compartment_description
  name           = var.compartment_name
  enable_delete  = true
}
module "terraform_demo_mw_compartment" {
  source = "../modules/compartment"

  compartment_id          = var.compartment_id
  compartment_description = "Compartment for Middleware Terraform Demo"
  compartment_name        = "terraform_demo_mw"
}

module "terraform_demo_mw_vcn01" {
  source = "../modules/network"

  compartment_id   = module.terraform_demo_mw_compartment.id
  vcn_cidr_blocks  = ["192.168.2.0/24"]
  vcn_display_name = "terraform_demo_mw_vcn01"

  subnet_cidr_block   = "192.168.2.0/24"
  subnet_display_name = "terraform_demo_mw_subnet01"
}


module "terraform_demo_db_compartment" {
  source = "../modules/compartment"

  compartment_id          = var.compartment_id
  compartment_description = "Compartment for Database Terraform Demo"
  compartment_name        = "terraform_demo_db"
}

module "terraform_demo_db_vcn01" {
  source = "../modules/network"

  compartment_id   = module.terraform_demo_db_compartment.id
  vcn_cidr_blocks  = ["192.168.1.0/24"]
  vcn_display_name = "terraform_demo_db_vcn01"

  subnet_cidr_block   = "192.168.1.0/24"
  subnet_display_name = "terraform_demo_db_subnet01"
}


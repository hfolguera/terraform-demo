include {
  path = find_in_parent_folders()
  expose = true
}

terraform {
  source = "../../../modules/network"
}

dependency "compartment" { config_path = "../../compartments/mw_compartment" }

inputs = {
    compartment_id   = dependency.compartment.outputs.id
    vcn_cidr_blocks  = ["192.168.2.0/24"]
    vcn_display_name = "terraform_demo_mw_vcn01"

    subnet_cidr_block   = "192.168.2.0/24"
    subnet_display_name = "terraform_demo_mw_subnet01"
}

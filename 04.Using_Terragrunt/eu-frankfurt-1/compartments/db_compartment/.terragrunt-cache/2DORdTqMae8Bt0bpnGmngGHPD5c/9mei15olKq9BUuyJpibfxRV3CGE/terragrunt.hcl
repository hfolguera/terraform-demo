include {
  path = find_in_parent_folders()
  expose = true
}

terraform {
  source = "../../../modules/compartment"
}

inputs = {
    compartment_id          = include.locals.compartment_id
    compartment_description = "Compartment for Database Terraform Demo"
    compartment_name        = "terraform_demo_db"
}

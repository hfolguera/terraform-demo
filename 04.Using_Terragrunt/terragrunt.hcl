locals {
    tenancy_ocid        = "ocid1.tenancy.oc1..aaaaaaaa3roehpairwhfhzenxbmofim6ies4h7cvcowbzv26ia3oiq47ygga"
    user_ocid           = "ocid1.user.oc1..aaaaaaaa7fcbiowrdo4fcy37c6wqbwfewzhc4tinkbfh6zdethvk4ht7lgzq"
    compartment_id      = "ocid1.tenancy.oc1..aaaaaaaa3roehpairwhfhzenxbmofim6ies4h7cvcowbzv26ia3oiq47ygga"
    region              = "eu-frankfurt-1"
    os_bucket_name      = "terraform-state-bucket"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "oci" {
  tenancy_ocid = "${local.tenancy_ocid}"
  user_ocid    = "${local.user_ocid}"
  region       = "${local.region}"
  # fingerprint and private_key_path or private_key variables must be declared as environment variables
}
EOF
}

remote_state {
  backend = "http"
  config = {
    address       = "https://objectstorage.${local.region}.oraclecloud.com/p/${get_env("TF_VAR_par_token")}/n/frdv3joeh99d/b/${local.os_bucket_name}/o/04/${replace(path_relative_to_include(), "/", "%2F")}%2Fterraform.tfstate"
    # par_token variable must be declared as environment variable
    update_method = "PUT"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
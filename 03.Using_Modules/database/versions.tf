terraform {
  required_version = ">=0.13"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "=4.4"
    }
  }
}

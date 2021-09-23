terraform {
  backend "http" {
    address       = "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/8Af25GnbWoj9--FDkZGv5bsJX7LIJ9eoC9WD6GmZp1YFaAoHiTYNHGSl3C9ueuT-/n/frdv3joeh99d/b/terraform-state-bucket/o/terraform.tfstate"
    update_method = "PUT"
  }
}

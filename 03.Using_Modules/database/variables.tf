variable "tenancy_ocid" {
  description = "Tenancy OCID"
  type        = string
}

variable "user_ocid" {
  description = "User OCID"
  type        = string
}

variable "region" {
  description = "Region donde se encuentran los recursos"
  type        = string
  default     = "eu-frankfurt-1"
}

variable "compartment_id" {
  description = "Root compartment OCID"
  type        = string
}

variable "fingerprint" {
  description = "User SSH-key fingerprint"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private SSH key"
  type        = string
}


# terraform-demo
Terraform workshop

This repository is itended to store Terraform exercices for an internal workshop.

## Requisites
Before beeing able to execute the Labs, you should accomplish...
- Sign-up and create your own Oracle Cloud Infrastructure [Always Free account](https://www.oracle.com/cloud/free/)
- Download and install [Terraform](https://www.terraform.io/downloads.html)
- Download and install [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)

## Preparing the environment
Choose a folder in your filesystem and clone the repo:
`git clone git@github.com:hfolguera/terraform-demo.git`

Once you have the lab's code, for each exercice copy the `*.example` file, paste it removing the .example suffix and edit to set your own variables. In the first 3 exercices the `terraform.auto.tfvars` file is used to automatically load those variables, meanwhile the fourth exercice uses the `ocienv` file to set environment variables.

Once you are done, you have to create an OCI Object Storage by accessing your tenant throught the UI and, for simplicity, make it public. You will have to edit all the `backend.tf` files to adapt to your bucket.

## Laboratories
- Laboratory 01. Basic Terraform 1
  - This exercice pretends to show the basic concepts of Terraform: Provider, backend, statefile, resources and the Terraform workflow (init, plan, apply and destroy).
- Laboratory 02. Basic Terraform 2
  - This exercice pretends to reflect how your infrastructure can grow (along with your files) and how you can use different `*.tf` files to organize your resources.
- Laboratory 03. Using Modules
  - In this exercice is shown how modules work and how you can group related resources by using modules and see how you can reuse and abstract your code.
- Laboratory 04. Using Terragrunt
  - In this exercice you can see the advantages of using tools like Terragrunt showing how you can generate dinamically the `provider.tf` and `backend.tf` files and also using variables in your backend URL.
  
terraform {
  backend "s3" {
    bucket       = "sentania-labs-terraform-state"
    key          = "vra/all-apps-private-cloud/lab/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
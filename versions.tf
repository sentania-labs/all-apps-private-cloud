terraform {
  required_version = ">= 1.1.9"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    vcfa = {
      source = "vmware/vcfa"
    }
    github = {
      source  = "integrations/github"
      version = ">= 4.20.0, < 6.0.0"
    }
  }
}

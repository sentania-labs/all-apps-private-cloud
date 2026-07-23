terraform {
  required_version = ">= 1.14.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.2"
    }
    vcfa = {
      source  = "vmware/vcfa"
      version = "~> 1.2"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.45"
    }
  }
}

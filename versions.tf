terraform {
  required_version = ">= 1.1.9"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    vcfa = {
      source = "vmware/vcfa"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
    github = {
      source  = "integrations/github"
      version = ">= 4.20.0, < 6.0.0"
    }
  }
}

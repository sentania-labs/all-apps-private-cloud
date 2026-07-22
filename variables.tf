########################################
# General VCF-A Configuration
########################################

/**
 * vcfa_url
 * URL of the VCF-A (Aria Automation) endpoint.
 */
variable "vcfa_url" {
  type = string
}

variable "vcfa_organization" {
  type        = string
  description = "The VCFA Organization"
}

/**
 * vcfa_refresh_token
 * Refresh token used for authentication to the VCF-A API.
 * Marked sensitive to avoid logging/output exposure.
 */
variable "vcfa_refresh_token" {
  type      = string
  sensitive = true
}

/**
 * insecure
 * Whether to skip SSL certificate verification when connecting
 * to the VCF-A API (typically true for lab environments).
 */
variable "insecure" {
  type    = bool
  default = true
}

/**
 * github_access_token
 * GitHub PAT used by the github provider to manage per-project repos
 * (repo-per-project CICD path). Supplied via TF_VAR_github_access_token.
 */
variable "github_access_token" {
  type      = string
  sensitive = true
}

variable "projects" {
  type = map(object({
    project_name = string
    description  = string
    role_bindings = list(object({
      kind = string
      name = string
      role = string
    }))
  }))
}

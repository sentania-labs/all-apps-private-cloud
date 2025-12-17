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
########################################
# Project Definitions
########################################

/**
 * projects
 *
 * A map of project configurations.
 *
 * Structure:
 *   projects = {
 *     key = {
 *       name           = string
 *       description    = string
 *     }
 *   }
 */
variable "projects" {
  description = "Map of project definitions."
  type = map(object({
    name        = string
    description = string
  }))
}

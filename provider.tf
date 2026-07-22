provider "vcfa" {
  url                  = var.vcfa_url
  org                  = var.vcfa_organization
  api_token            = var.vcfa_refresh_token
  allow_unverified_ssl = var.insecure
  auth_type            = "api_token"
}

# CCI projects + role bindings are Kubernetes CRs (the sentania-labs/*/vcfa
# modules use kubernetes_manifest), so this provider is REQUIRED even for the
# current project/role-binding scope. Its client config comes from the org's
# Supervisor kubeconfig.
data "vcfa_kubeconfig" "kubeconfig" {}

provider "kubernetes" {
  host     = data.vcfa_kubeconfig.kubeconfig.host
  insecure = data.vcfa_kubeconfig.kubeconfig.insecure_skip_tls_verify
  token    = data.vcfa_kubeconfig.kubeconfig.token
}



provider "github" {
  owner = "sentania-labs"
  token = var.github_access_token
}
module "project_role_binding" {
  for_each = local.project_role_bindings

  source  = "sentania-labs/projectrolebinding/vcfa"
  version = "0.3.0"

  project_name = each.value.project_name
  role = {
    kind = each.value.kind
    name = each.value.name
    role = each.value.role
  }

  # Role bindings are CRs inside the project's namespace; the project
  # (which creates that namespace) must exist first, or apply races and
  # fails with "Namespace '<project>' not found".
  depends_on = [module.projects]
}

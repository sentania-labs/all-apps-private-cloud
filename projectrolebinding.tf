module "project_role_binding" {
  for_each = local.project_role_bindings

  source  = "sentania-labs/projectrolebinding/vcfa"
  version = "0.2.0"

  project_name = each.value.project_name
  role = {
    kind = each.value.kind
    name = each.value.name
    role = each.value.role
  }

}

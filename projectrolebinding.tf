module "project_role_binding" {
  for_each = local.project_role_bindings

  source  = "sentania-labs/projectrolebinding/vcfa"
  version = "0.1.0"

  project_name = each.value.project_name
  kind         = each.value.kind
  name         = each.value.name
  role         = each.value.role
}

module "projects" {
  source  = "sentania-labs/project/vcfa"
  version = "0.1.0"

  for_each = var.projects

  project_name = each.value.name
  description  = each.value.description
}

module "projects" {
  source   = "../../modules/terraform-vcfa-projects"
  for_each = var.projects

  project_name = each.value.name
  description  = each.value.description
}


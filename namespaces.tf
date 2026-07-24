module "supervisor_namespace" {
  source  = "sentania-labs/supervisor-namespace/vcfa"
  version = "0.2.1"

  for_each = { for k, p in var.projects : k => p if p.namespace != null }

  name_prefix     = each.value.project_name
  project_name    = each.value.project_name
  region_name     = "vcf-lab-region01"
  vpc_name        = each.value.namespace.vpc_name
  class_name      = each.value.namespace.class_name
  storage_classes = each.value.namespace.storage_classes
  vm_classes      = each.value.namespace.vm_classes
  zones           = each.value.namespace.zones

  # A Supervisor Namespace attaches to an existing project's namespace;
  # the project (which creates that namespace) must exist first, or
  # apply races and fails the same way role bindings do (see
  # projectrolebinding.tf).
  depends_on = [module.projects]
}

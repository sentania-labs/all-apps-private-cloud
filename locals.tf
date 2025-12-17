locals {
  project_role_bindings = {
    for rb in flatten([
      for _, p in var.projects : [
        for b in p.role_bindings : {
          key          = "${p.project_name}:${b.kind}:${b.name}:${b.role}"
          project_name = p.project_name
          kind         = b.kind
          name         = b.name
          role         = b.role
        }
      ]
    ]) :
    rb.key => rb
  }
}

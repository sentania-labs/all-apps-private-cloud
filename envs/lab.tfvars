vcfa_url          = "https://vcf-lab-automation.int.sentania.net"
vcfa_organization = "vcf-lab-all-apps"

projects = {
  sandbox_project = {
    project_name = "vcf-lab-sandbox-tf"
    description  = "This is a project created with TF - Do Not Edit"
    role_bindings = [
      {
        kind = "Group"
        name = "labadmins@int.sentania.net"
        role = "admin"
      },
      {
        kind = "User"
        name = "vcf@int.sentania.net"
        role = "admin"
      }
    ]
    namespace = {
      # UNCONFIRMED placeholders — must be replaced with real live values
      # before merge. vpc_name: auto-generated default VPC name for this
      # project, not yet queried live. class_name: name of the
      # SupervisorNamespaceClass an org-admin must create; unconfirmed
      # whether one exists yet in vcf-lab-all-apps.
      vpc_name   = "REPLACE_ME_VPC_NAME"
      class_name = "REPLACE_ME_CLASS_NAME"
      storage_classes = {
        "iscsi-default-policy" = { limit = "100Gi" }
      }
      vm_classes = ["best-effort-small", "best-effort-medium"]
    }
  }
}

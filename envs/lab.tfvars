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
      vpc_name   = "default-vcf-lab-region01"
      class_name = "small"
      storage_classes = {
        "iscsi-default-policy" = { limit = "100Gi" }
      }
      vm_classes = ["best-effort-small", "best-effort-medium"]
      zones = [
        {
          name               = "domain-c10"
          cpu_limit          = "10000M"
          cpu_reservation    = "0M"
          memory_limit       = "10000Mi"
          memory_reservation = "0M"
        }
      ]
    }
  }
}

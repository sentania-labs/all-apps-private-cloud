vcfa_url          = "https://vcf-lab-automation.int.sentania.net"
vcfa_organization = "vcf-lab-all-apps"

projects = {
  sandbox_project = {
    name        = "vcf-lab-sandbox-tf"
    description = "This is a project created with TF - Do Not Edit"
    role_bindings = [
      {
        kind = "Group"
        name = "labAdmins@int.sentania.net"
        role = "admin"
      },
      {
        kind = "User"
        name = "vcf@int.sentania.net"
        role = "admin"
      }
    ]
  }
}

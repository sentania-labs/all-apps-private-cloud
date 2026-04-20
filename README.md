# all-apps-private-cloud

Control-plane Terraform automation for the VCFA All Apps private cloud. Creates and manages VCFA projects and project role bindings using the `sentania-labs/project/vcfa` and `sentania-labs/projectrolebinding/vcfa` modules.

Work in progress.

## Structure

```
all-apps-private-cloud/
├── projects.tf             # VCFA project creation (sentania-labs/project/vcfa)
├── projectrolebinding.tf   # Role assignments per project (sentania-labs/projectrolebinding/vcfa)
├── locals.tf               # Flattened role-binding locals
├── variables.tf            # vcfa_url, vcfa_refresh_token, projects map
├── versions.tf             # Required providers
├── provider.tf             # VCFA provider config
├── backend.tf              # S3 remote state
└── envs/                   # Environment tfvars
```

## Usage

```bash
terraform init -backend-config="key=all-apps-private-cloud/terraform.tfstate"
terraform plan  -var-file="envs/<your-env>.tfvars"
terraform apply -var-file="envs/<your-env>.tfvars"
```

Credentials (`vcfa_refresh_token`) should not be committed — supply via `.tfvars` or `TF_VAR_vcfa_refresh_token`.

## License

MIT

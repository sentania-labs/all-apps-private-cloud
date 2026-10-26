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
├── backend.tf              # Lab S3 remote state
└── envs/                   # Environment tfvars
```

## What this repo owns

The VCFA projects, project role bindings and supervisor namespaces for the All Apps tenant, as declared in `envs/lab.tfvars`. State lives on the lab S3 (bucket `tfstate`, key `vra/all-apps-private-cloud/lab/terraform.tfstate`, endpoint `https://s3.int.sentania.net:9443`, lock file locking); see `backend.tf`. Only runners with the `lab` label can reach it.

This repo has never written state, so the first apply creates everything the config declares.

## CI

`.github/workflows/configure-private-cloud.yml` runs on the `lab` runner pool.

- Pull requests: credential-free checks only (fmt, `init -backend=false`, validate). No secrets are exposed, so branch code never runs with lab credentials and no plan is produced.
- Pushes to `main`: fmt, init, validate and **plan only**, with the lab credentials. Nothing is applied.
- Apply: run the workflow manually (Actions, "Configure Lab Private Cloud", Run workflow) on `main` and set `confirm_apply` to `apply`. Any other value plans only. Dispatch runs from branches other than `main` do nothing. The plan file is applied in the same job and is never uploaded.

State credentials are the org secrets `TF_STATE_S3_ACCESS_KEY_ID` / `TF_STATE_S3_SECRET_ACCESS_KEY`, which must be scoped to this repository.

## First apply

1. Confirm this repo is in scope for the two state secrets above.
2. Run the workflow manually on `main` with the default input and read the plan (PRs do not plan). Against empty state it should show every declared resource as a create; check that against what already exists in VCFA, and import anything that does.
3. Run the workflow manually on `main` with `confirm_apply` = `apply`.

## Local use

Run against the lab only through the workflow. For syntax checks without touching state:

```bash
terraform init -backend=false
terraform validate
terraform fmt -check
```

Credentials (`vcfa_refresh_token`) should not be committed; they come from `TF_VAR_*` secrets in CI.

## License

MIT

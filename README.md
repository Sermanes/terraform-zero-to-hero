# terraform-zero-to-hero

Terraform examples accompanying the blog series at [sregio.es](https://sregio.es/blog/).

Terraform runs through Docker, with nothing installed on the machine: the Makefiles wrap the official `hashicorp/terraform` image and mount the lab directory inside the container.

## Requirements

- Docker
- Make

## Usage

Each post in the series has its own lab under `labs/`. The shared logic lives in `terraform.mk` at the root, and each lab has a one-line Makefile that includes it, so you just cd into a lab and run make there:

```bash
cd labs/02-remote-state
make init      # download providers
make plan      # show what would change
make apply     # apply the changes
make destroy   # destroy what was created
make help      # list all commands
```

The root Makefile is a convenience wrapper that forwards any target to a lab (the first one by default):

```bash
make plan LAB=labs/02-remote-state
```

The Terraform version is pinned in `terraform.mk` (`TF_VERSION`). It can be overridden without editing the file:

```bash
make plan TF_VERSION=1.16
```

## Labs

1. [`labs/01-installing-terraform`](labs/01-installing-terraform) — a `local_file` resource to check the setup works.
2. [`labs/02-remote-state`](labs/02-remote-state) — the same configuration with the state stored in a Google Cloud Storage bucket (`gcs` backend). Create the bucket first and replace the bucket name in `backend.tf` with your own; the container picks up your `gcloud` Application Default Credentials, so run `gcloud auth application-default login` once before `make init LAB=labs/02-remote-state`.
3. [`labs/03-providers`](labs/03-providers) — pinned `required_providers`/`required_version`, and a `google` provider used with an alias to create two buckets in different regions. Replace the project and bucket names with your own before running.
4. [`labs/04-variables`](labs/04-variables) — same two buckets as lab 3, now parameterized with input variables. Ships `terraform.tfvars` and `prefix.auto.tfvars` to show variable definition precedence in action. Replace the project in `terraform.tfvars` with your own before running.

## Posts in the series

1. [From snapshots to infrastructure as code](https://sregio.es/en/blog/de-snapshots-a-infraestructura-como-codigo/)
2. [Installing Terraform: binary, apt and Docker (with a Makefile)](https://sregio.es/en/blog/instalar-terraform/)
3. [Remote state in Terraform: a bucket, a lock, and no more stepping on each other](https://sregio.es/en/blog/terraform-state-remoto/)
4. [What Terraform providers are and how to use them](https://sregio.es/en/blog/terraform-providers/)
5. [How to declare variables in Terraform](https://sregio.es/en/blog/terraform-variables/)

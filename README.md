# terraform-zero-to-hero

Terraform examples accompanying the blog series at [sregio.es](https://sregio.es/blog/).

Terraform runs through Docker, with nothing installed on the machine: the Makefile wraps the official `hashicorp/terraform` image and mounts the current directory inside the container.

## Requirements

- Docker
- Make

## Usage

```bash
make init      # download providers
make plan      # show what would change
make apply     # apply the changes
make destroy   # destroy what was created
make help      # list all commands
```

Each post in the series has its own lab under `labs/`. The Makefile targets the first lab by default; pick another one with the `LAB` variable:

```bash
make plan LAB=labs/01-installing-terraform
```

The Terraform version is pinned in the Makefile (`TF_VERSION`). It can be overridden without editing the file:

```bash
make plan TF_VERSION=1.16
```

## Labs

1. [`labs/01-installing-terraform`](labs/01-installing-terraform) — a `local_file` resource to check the setup works.

## Posts in the series

1. [From snapshots to infrastructure as code](https://sregio.es/en/blog/de-snapshots-a-infraestructura-como-codigo/)
2. [Installing Terraform: binary, apt and Docker (with a Makefile)](https://sregio.es/en/blog/instalar-terraform/)

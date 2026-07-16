# Terraform Documentation

## Purpose

This directory contains Terraform code for homelab infrastructure.

The file naming standard is designed to:

- separate concerns by layer,
- keep files easy to scan,
- maintain consistent ordering across the codebase.

## Naming standard

Terraform files should follow this pattern:

`<prefix>-<component>-<environment>-<index>.tf`

Example: `001-k3s-prod-01.tf`

## Prefix reference

### `000-*` - Terraform core

Use for shared Terraform/bootstrap configuration:

- providers
- credentials/variables
- global/shared setup

Examples:

- `000-providers.tf`
- `000-credentials.auto.tfvars`

### `001-*` - Infrastructure

Use for foundational infrastructure resources:

- hosts
- VMs
- core compute building blocks

Examples:

- `001-pve-prod-01.tf`
- `001-k3s-prod-01.tf`

### `002-*` - Networking

Use for networking and connectivity resources:

- firewalls
- network-level services
- interconnectivity components

Examples:

- `002-fw-prod-01.tf`
- `002-nb-prod-01.tf`

### `003-*` - Monitoring

Used for machines or services related to monitoring:

- Alertmanager instances
- mon-prod-01

Examples:

- `003-alertmanager-k3s-cl-prod-01.tf`
- `003-mon-prod-01.tf`

## Terraform workflow

Run from this directory:

```bash
terraform fmt
terraform plan
terraform apply
```

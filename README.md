![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

# Terraform Cloud Management

This repo houses my ever-growing collection of Terraform modules to manage GitHub, AWS, Digital Ocean, and so on.

By using IaC everywhere, you are never configuring cloud providers: you are developing a modular and reusable resource for GitOps, MLOps, DevOps...and you're saving your hair by avoiding ClickOps! Clicking through GUIs, yeck.

Each folder contains a readme to describe how to apply the scripts.

## Environmental Variables

Terraform will grab variables defined in `.tfvars` or `.bash_profile`. I couldn't get it to read from a `.env` file. Eventually I'm sure I'll want it to read SSH keys automatically.

For other environmental variables like AWS access keys, storing them in `.bash_profile`  worked with the Terraform plugin while the `.tfvars` did not. I'd rather have a single source of truth or a single consistent method of storing environmental variables in the local repo, but here we are.

## tfstate
Sharing the state files is important as Terraform uses it to map metadata to resource IDs.

However, Terraform [may store secrets](https://developer.hashicorp.com/terraform/language/state/sensitive-data) in it. For now I won't track it in version control.

## Secrets
For later development, I believe it may be possible to generate secrets on the fly with Terraform. Once this is in place, it may be possible to store state in version control.

## Useful commands
init, plan, apply, validate, format, refresh, show, destroy

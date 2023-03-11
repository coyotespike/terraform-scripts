## Terraform GH

We want to easily set up CI/CD when deploying a repo to Digital Ocean.

This TF sets up the required information in GH to enable CD.

It is designed to work with the `main.yml` file workflow, which has been added here for reference.

variables.tf automatically loads variables into the root providers.tf file. Use it like a .env file.

Put the below into it, use as `var.GH_ACCESS_TOKEN`:

variable "GH_ACCESS_TOKEN" {
  description = "Classic GH Token to allow Terraform to authenticate"
  type        = string
  default     = "token_string"
}

variable "DO_SECRET" {
  description = "Specific secret for GH Actions runner to SSH into DO"
  type        = string
  default     = "what what what"
}

## Steps to Set up CD GH->DO

1. Create SSH key on DO droplet
2. Copy private SSH key
3. Set repo secrets on GH: private key, droplet IP, username
4. Copy and paste script into runner
5. Profit

Note that multiline strings on terraform must begin with <<EOT and end with EOT.

[This resource](https://medium.com/swlh/how-to-deploy-your-application-to-digital-ocean-using-github-actions-and-save-up-on-ci-cd-costs-74b7315facc2) and even more [here](https://dverasc.github.io/posts/digitaloceancicd/) were very helpful in figuring out how to get this script working.

## TODO

- figure out how to create a new SSH key and role on the droplet
- ensure this is in authorized_keys in .ssh
- figure out how to get IP and so on into this TF script after creating the droplet
- check if IP should be a string and if the ssh key works


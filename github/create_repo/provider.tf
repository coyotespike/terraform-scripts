terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}
# Configure the Github provider
provider "github" {
  token = var.GH_ACCESS_TOKEN
}

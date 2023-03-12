resource "github_repository" "terraform-scripts" {
  name        = "terraform-scripts"
  description = "Terraform scripts to manage cloud providers: GH, AWS, DO, etc"
  visibility  = "public"
}

resource "github_repository" "template-repo" {
  name        = "my-template-repo"
  description = "A template repo to initialize with a README"
  visibility  = "public"
  is_template = true
  topics      = ["template", "terraform"]
}

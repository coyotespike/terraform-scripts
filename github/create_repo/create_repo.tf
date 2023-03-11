resource "github_repository" "terraform-scripts" {
  name        = "terraform-scripts"
  description = "Terraform scripts to manage cloud providers: GH, AWS, DO, etc"
  visibility  = "public"
}

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

resource "github_repository" "convolutions-from-scratch" {
  name        = "convolutions-from-scratch"
  description = "Some models built from scratch with PyTorch during my graduate program at UT Austin"
  visibility  = "public"
  topics      = ["machine-learning", "convolutions", "cnn", "unet", "fcn", "pytorch"]
  template {
    owner      = "coyotespike"
    repository = "my-template-repo"
  }
}

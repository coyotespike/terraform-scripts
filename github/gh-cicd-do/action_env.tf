resource "github_actions_secret" "ssh_secret" {
  repository       = "fast-api-ocean"
  secret_name      = "HOST_KEY"
  plaintext_value  = var.DO_SSH_KEY
}

resource "github_actions_secret" "ip_secret" {
  repository       = "fast-api-ocean"
  secret_name      = "HOST_IP"
  plaintext_value  = var.DO_IP
}

resource "github_actions_secret" "username_secret" {
  repository       = "fast-api-ocean"
  secret_name      = "HOST_USERNAME"
  plaintext_value  = var.DO_USERNAME
}
resource "github_repository" "create-new-repo" {
  name        = var.github_repo_name
  description = var.github_repo_description
  visibility  = var.github_repo_visibility
  auto_init   = var.github_repo_auto_init
}


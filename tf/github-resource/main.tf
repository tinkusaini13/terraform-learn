resource "github_repository" "tf_first_repo" {
  name        = "test-repo-created-using-terraform"
  description = "My awesome codebase"
  visibility  = "public"
  auto_init   = true
}

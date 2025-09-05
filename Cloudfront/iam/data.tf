# OIDC Role, used by Github Action
data "aws_iam_role" "oidc_role" {
  name = "ifaakash-github-action-role"
}

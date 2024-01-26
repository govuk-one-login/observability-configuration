resource "aws_iam_role" "role" {
    name = "gha-observability-access"
    assume_role_policy = file("${path.module}/policies/assume-role.json")
    inline_policy {
        name = "access-tfstate"
        policy = file("${path.module}/policies/access-tfstate.json")
    }
    inline_policy {
        name = "read-secrets"
        policy = file("${path.module}/policies/read-secrets.json")
    }
}
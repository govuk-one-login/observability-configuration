data "aws_secretsmanager_secret" "np" {
  arn = "arn:aws:secretsmanager:eu-west-2:216552277552:secret:DynatraceNonProductionSlackIntegration-KTAK1u"
}

data "aws_secretsmanager_secret_version" "np" {
  secret_id = data.aws_secretsmanager_secret.np.id
}

data "aws_secretsmanager_secret" "pr" {
  arn = "arn:aws:secretsmanager:eu-west-2:216552277552:secret:DynatraceProductionSlackIntegration-AR5VOj"
}

data "aws_secretsmanager_secret_version" "pr" {
  secret_id = data.aws_secretsmanager_secret.pr.id
}
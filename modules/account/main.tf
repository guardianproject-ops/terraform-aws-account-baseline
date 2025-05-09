data "aws_caller_identity" "this" {}

resource "aws_iam_account_alias" "default" {
  account_alias = var.aws_iam_account_alias != null ? var.aws_iam_account_alias : module.this.id
}

resource "aws_iam_account_password_policy" "default" {
  count = var.account_password_policy != null ? 1 : 0

  allow_users_to_change_password = var.account_password_policy.allow_users_to_change
  max_password_age               = var.account_password_policy.max_age
  minimum_password_length        = var.account_password_policy.minimum_length
  password_reuse_prevention      = var.account_password_policy.reuse_prevention_history
  require_lowercase_characters   = var.account_password_policy.require_lowercase_characters
  require_numbers                = var.account_password_policy.require_numbers
  require_symbols                = var.account_password_policy.require_symbols
  require_uppercase_characters   = var.account_password_policy.require_uppercase_characters
}

resource "aws_s3_account_public_access_block" "default" {
  count = var.aws_s3_public_access_block_config.enabled ? 1 : 0

  block_public_acls       = var.aws_s3_public_access_block_config.block_public_acls
  block_public_policy     = var.aws_s3_public_access_block_config.block_public_policy
  ignore_public_acls      = var.aws_s3_public_access_block_config.ignore_public_acls
  restrict_public_buckets = var.aws_s3_public_access_block_config.restrict_public_buckets
}


module "iam_github_oidc_provider" {
  count   = var.iam_github_oidc_provider_enabled ? 1 : 0
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-provider"
  version = "5.52.2"
  tags    = module.this.tags
}


module "iam_gitlab_oidc_provider" {
  count   = var.iam_gitlab_oidc_provider_enabled ? 1 : 0
  source  = "../iam-gitlab-oidc-provider"
  context = module.this.context
}

module "aws_support_role" {
  count   = var.aws_support_role_enabled ? 1 : 0
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-roles"
  version = "5.52.2"
  trusted_role_arns = [
    "arn:aws:iam::${data.aws_caller_identity.this.account_id}:root",
  ]
  poweruser_role_name        = "AWSSupportRole"
  poweruser_role_policy_arns = ["arn:aws:iam::aws:policy/AWSSupportAccess"]
  create_poweruser_role      = true
}

module "break_glass" {
  source = "git::https://gitlab.com/guardianproject-ops/terraform-aws-account-break-glass//modules/target?ref=v0.0.1"

  allow_break_glass      = var.break_glass.enabled
  break_glass_principals = var.break_glass.principals
  break_glass_policy_arn = var.break_glass.policy_arn
  break_glass_role_name  = var.break_glass.role_name
}

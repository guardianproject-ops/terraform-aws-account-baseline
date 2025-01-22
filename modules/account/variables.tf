variable "aws_iam_account_alias" {
  type        = string
  default     = null
  description = "The alias for the AWS account"
}

variable "account_password_policy" {
  type = object({
    allow_users_to_change        = bool
    max_age                      = number
    minimum_length               = number
    require_lowercase_characters = bool
    require_numbers              = bool
    require_symbols              = bool
    require_uppercase_characters = bool
    reuse_prevention_history     = number
  })
  default = {
    allow_users_to_change        = true
    max_age                      = 90
    minimum_length               = 14
    require_lowercase_characters = true
    require_numbers              = true
    require_symbols              = true
    require_uppercase_characters = true
    reuse_prevention_history     = 24
  }
  description = "AWS account password policy parameters"
}

variable "aws_s3_public_access_block_config" {
  type = object({
    enabled                 = optional(bool, true)
    block_public_acls       = optional(bool, true)
    block_public_policy     = optional(bool, true)
    ignore_public_acls      = optional(bool, true)
    restrict_public_buckets = optional(bool, true)
  })
  default     = {}
  description = "S3 bucket-level Public Access Block config"
}

variable "iam_github_oidc_provider_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable the GitHub OIDC provider"
}


variable "iam_gitlab_oidc_provider_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable the GitLab OIDC provider"
}


variable "aws_support_role_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable the AWS Support role"
}

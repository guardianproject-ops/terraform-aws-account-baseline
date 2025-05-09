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

variable "break_glass" {
  type = object({
    enabled    = bool
    principals = list(string)
    role_name  = optional(string, "BreakGlassRole")
    policy_arn = optional(string, "arn:aws:iam::aws:policy/AdministratorAccess")
  })
  description = <<EOT
Configuration for emergency "break glass" access to the AWS account.

**Fields:**

* `enabled` - (Required) Boolean flag to control whether the emergency access role is created.
  Set to true to enable emergency access capabilities.

* `principals` - (Required) The AWS principals that can assume the emergency role.
  Can be an AWS account root ARN, an IAM user ARN, or an IAM role ARN.
  Format examples:
  - AWS account: ["arn:aws:iam::123456789012}:root"]
  - IAM user: ["arn:aws:iam::123456789012:user/EmergencyUser"]
  - IAM role: ["arn:aws:iam::123456789012:role/EmergencyRole"]
  - Multiple principals: ["arn:aws:iam::123456789012:user/User1", "arn:aws:iam::123456789012:user/User2"]

* `role_name` - (Optional) Name of the IAM role created for emergency access.
  Defaults to "BreakGlassRole" if not specified. If you change this from the default value,
  you must also change it in the break glass account and ensure your break glass documentation
  and procedures are updated accordingly so authorized personnel know which role to
  assume during an emergency.

* `policy_arn` - (Optional) ARN of the IAM policy to attach to the emergency role.
  Defaults to "arn:aws:iam::aws:policy/AdministratorAccess" if not specified.
  Consider using a more restrictive policy based on your specific emergency scenarios.

**Security Note:** Break glass access should be strictly controlled, thoroughly audited,
and only used in genuine emergency situations. Ensure proper monitoring and alerting
are set up for any use of this role.
EOT
}

variable "aws_ebs_kms_key_arn" {
  type        = string
  default     = null
  description = "The ARN of the AWS Key Management Service (AWS KMS) customer master key (CMK) to use to encrypt the EBS volumes"
}

variable "aws_ebs_encryption_by_default" {
  type        = bool
  default     = true
  description = "Set to true to enable AWS Elastic Block Store encryption by default"
}

variable "aws_ebs_encryption_custom_key" {
  type        = bool
  default     = false
  description = "Set to true and specify the `aws_kms_key_arn` to use in place of the AWS-managed default CMK"
}

variable "aws_ebs_snapshot_block_public_access_state" {
  type        = string
  default     = "block-all-sharing"
  description = "The mode in which to enable 'Block public access for snapshots' for the region. Allowed values are block-all-sharing, block-new-sharing, unblocked."
}


variable "ec2_instance_metadata_defaults_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable EC2 instance metadata defaults"
}

variable "ec2_instance_metadata_defaults" {
  type = object({
    http_enabled                = bool
    http_token_required         = bool
    http_put_response_hop_limit = number
    instance_tags_enabled       = bool
  })
  default = {
    http_enabled                = true
    http_token_required         = true
    http_put_response_hop_limit = 1
    instance_tags_enabled       = false
  }
}

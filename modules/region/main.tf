resource "aws_ebs_encryption_by_default" "default" {
  enabled = var.aws_ebs_encryption_by_default
}

resource "aws_ebs_default_kms_key" "default" {
  count   = var.aws_ebs_encryption_custom_key == true ? 1 : 0
  key_arn = var.aws_ebs_kms_key_arn
}

resource "aws_ebs_snapshot_block_public_access" "this" {
  state = var.aws_ebs_snapshot_block_public_access_state
}

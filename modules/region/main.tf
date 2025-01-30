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

resource "aws_ec2_instance_metadata_defaults" "this" {
  count                       = var.ec2_instance_metadata_defaults_enabled ? 1 : 0
  http_endpoint               = var.ec2_instance_metadata_defaults.http_enabled ? "enabled" : "disabled"
  http_tokens                 = var.ec2_instance_metadata_defaults.http_token_required ? "required" : "optional"
  http_put_response_hop_limit = var.ec2_instance_metadata_defaults.http_put_response_hop_limit
  instance_metadata_tags      = var.ec2_instance_metadata_defaults.instance_tags_enabled ? "enabled" : "disabled"
}

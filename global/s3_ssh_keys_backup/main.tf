resource "aws_s3_bucket" "ssh_keys_backup" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ssh_keys_backup" {
  bucket = aws_s3_bucket.ssh_keys_backup.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "enable" {
  bucket = aws_s3_bucket.ssh_keys_backup.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.ssh_keys_backup.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "prod_ssh_dir" {
  for_each = fileset("../../coolify_hetzner_infra/.ssh", "*")

  bucket = aws_s3_bucket.ssh_keys_backup.id
  key    = "prod/${each.value}"
  source = "../../prod/.ssh/${each.value}"
  etag   = filemd5("../../coolify_hetzner_infra/.ssh/${each.value}")
}


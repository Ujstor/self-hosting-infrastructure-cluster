variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default     = "ssh-keys-backup-cluster-ujstor"
}

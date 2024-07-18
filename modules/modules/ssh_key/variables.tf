variable "ssh_key_name" {
  type        = string
  description = "Name of the SSH key created and used for Hetzner cloud and serves"
  default     = "self_hosted_hetzner_key"
}

variable "ssh_key_path" {
  description = "Path where the SSH key is stored"
  type        = string
  default     = "~/.ssh"
}

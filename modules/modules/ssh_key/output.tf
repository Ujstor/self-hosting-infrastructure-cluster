output "public_key" {
  description = "Public key"
  value       = tls_private_key.ssh_key.public_key_openssh
}

output "hcloud_ssh_key_id" {
  description = "Pass Hcloud ssh key id into controler and workers"
  value       = hcloud_ssh_key.default.id
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "hcloud_ssh_key" "default" {
  name       = var.ssh_key_name
  public_key = tls_private_key.ssh_key.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
     echo "${tls_private_key.ssh_key.private_key_pem}" > ${var.ssh_key_path}/${var.ssh_key_name}.pem &&
     echo "${tls_private_key.ssh_key.public_key_openssh}" > ${var.ssh_key_path}/${var.ssh_key_name}.pub &&
     chmod 600 ${var.ssh_key_path}/${var.ssh_key_name}.pem
   EOT
  }

  depends_on = [tls_private_key.ssh_key]
}


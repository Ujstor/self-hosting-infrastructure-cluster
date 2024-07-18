```bash
terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # cloudflare_record.controller-record will be created
  + resource "cloudflare_record" "controller-record" {
      + allow_overwrite = false
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "coolify-ui"
      + proxiable       = (known after apply)
      + proxied         = true
      + ttl             = 1
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.firewall.hcloud_firewall.default["coolify"] will be created
  + resource "hcloud_firewall" "default" {
      + id     = (known after apply)
      + labels = {
          + "type" = "firewall-1"
        }
      + name   = "firewall-coolify"

      + rule {
          + destination_ips = [
              + "0.0.0.0/0",
            ]
          + direction       = "out"
          + port            = "443"
          + protocol        = "tcp"
          + source_ips      = [
              + "0.0.0.0/0",
              + "::/0",
            ]
            # (1 unchanged attribute hidden)
        }
      + rule {
          + destination_ips = [
              + "0.0.0.0/0",
            ]
          + direction       = "out"
          + port            = "6001"
          + protocol        = "tcp"
          + source_ips      = [
              + "0.0.0.0/0",
              + "::/0",
            ]
            # (1 unchanged attribute hidden)
        }
      + rule {
          + destination_ips = [
              + "0.0.0.0/0",
            ]
          + direction       = "out"
          + port            = "80"
          + protocol        = "tcp"
          + source_ips      = [
              + "0.0.0.0/0",
              + "::/0",
            ]
            # (1 unchanged attribute hidden)
        }
      + rule {
          + destination_ips = []
          + direction       = "in"
          + port            = "22"
          + protocol        = "tcp"
          + source_ips      = [
              + "0.0.0.0/0",
              + "::/0",
            ]
            # (1 unchanged attribute hidden)
        }
      + rule {
          + destination_ips = []
          + direction       = "in"
          + port            = "443"
          + protocol        = "tcp"
          + source_ips      = [
              + "0.0.0.0/0",
              + "::/0",
            ]
            # (1 unchanged attribute hidden)
        }
      + rule {
          + destination_ips = []
          + direction       = "in"
          + port            = "6001"
          + protocol        = "tcp"
          + source_ips      = [
              + "0.0.0.0/0",
              + "::/0",
            ]
            # (1 unchanged attribute hidden)
        }
      + rule {
          + destination_ips = []
          + direction       = "in"
          + port            = "80"
          + protocol        = "tcp"
          + source_ips      = [
              + "0.0.0.0/0",
              + "::/0",
            ]
            # (1 unchanged attribute hidden)
        }
      + rule {
          + destination_ips = []
          + direction       = "in"
          + port            = "8000"
          + protocol        = "tcp"
          + source_ips      = [
              + "0.0.0.0/0",
              + "::/0",
            ]
            # (1 unchanged attribute hidden)
        }
    }

  # module.network_config.hcloud_network.network will be created
  + resource "hcloud_network" "network" {
      + delete_protection        = false
      + expose_routes_to_vswitch = false
      + id                       = (known after apply)
      + ip_range                 = "10.0.0.0/16"
      + name                     = "coolify"
    }

  # module.network_config.hcloud_network_subnet.deployment_subnet["subnet-1"] will be created
  + resource "hcloud_network_subnet" "deployment_subnet" {
      + gateway      = (known after apply)
      + id           = (known after apply)
      + ip_range     = "10.0.1.0/24"
      + network_id   = (known after apply)
      + network_zone = "eu-central"
      + type         = "cloud"
    }

  # module.network_config.hcloud_network_subnet.deployment_subnet["subnet-2"] will be created
  + resource "hcloud_network_subnet" "deployment_subnet" {
      + gateway      = (known after apply)
      + id           = (known after apply)
      + ip_range     = "10.0.2.0/24"
      + network_id   = (known after apply)
      + network_zone = "eu-central"
      + type         = "cloud"
    }

  # module.cluster.module.controller.hcloud_server.coolify_controler["controler-1"] will be created
  + resource "hcloud_server" "coolify_controler" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "debian-12"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "controler"
        }
      + location                   = "fsn1"
      + name                       = "controler-1"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx22"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)
    }

  # module.cluster.module.controller.hcloud_server_network.subnet_controler["controler-1"] will be created
  + resource "hcloud_server_network" "subnet_controler" {
      + id          = (known after apply)
      + ip          = "10.0.1.1"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # module.cluster.module.ssh_key.hcloud_ssh_key.default will be created
  + resource "hcloud_ssh_key" "default" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + labels      = {}
      + name        = "coolify_cluster_hetzner_key"
      + public_key  = (known after apply)
    }

  # module.cluster.module.ssh_key.tls_private_key.ssh_key will be created
  + resource "tls_private_key" "ssh_key" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

  # module.cluster.module.workers.hcloud_server.coolify_worker["worker-1"] will be created
  + resource "hcloud_server" "coolify_worker" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "debian-12"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "worker"
        }
      + location                   = "fsn1"
      + name                       = "worker-1"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx22"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = false
        }
    }

  # module.cluster.module.workers.hcloud_server.coolify_worker["worker-2"] will be created
  + resource "hcloud_server" "coolify_worker" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "debian-12"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "worker"
        }
      + location                   = "nbg1"
      + name                       = "worker-2"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx22"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = false
        }
    }

  # module.cluster.module.workers.hcloud_server.coolify_worker["worker-3"] will be created
  + resource "hcloud_server" "coolify_worker" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "debian-12"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + labels                     = {
          + "type" = "worker"
        }
      + location                   = "hel1"
      + name                       = "worker-3"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx22"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = false
        }
    }

  # module.cluster.module.workers.hcloud_server_network.subnet_controler["worker-1"] will be created
  + resource "hcloud_server_network" "subnet_controler" {
      + id          = (known after apply)
      + ip          = "10.0.2.1"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # module.cluster.module.workers.hcloud_server_network.subnet_controler["worker-2"] will be created
  + resource "hcloud_server_network" "subnet_controler" {
      + id          = (known after apply)
      + ip          = "10.0.2.2"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # module.cluster.module.workers.hcloud_server_network.subnet_controler["worker-3"] will be created
  + resource "hcloud_server_network" "subnet_controler" {
      + id          = (known after apply)
      + ip          = "10.0.2.3"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

Plan: 15 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + controller_status = {
      + controler-1 = {
          + ip     = (known after apply)
          + status = (known after apply)
        }
    }
  + worker_status     = {
      + worker-1 = {
          + ip     = (known after apply)
          + status = (known after apply)
        }
      + worker-2 = {
          + ip     = (known after apply)
          + status = (known after apply)
        }
      + worker-3 = {
          + ip     = (known after apply)
          + status = (known after apply)
        }
    }

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.network_config.hcloud_network.network: Creating...
module.cluster.module.ssh_key.tls_private_key.ssh_key: Creating...
module.firewall.hcloud_firewall.default["coolify"]: Creating...
module.network_config.hcloud_network.network: Creation complete after 1s [id=4444534]
module.network_config.hcloud_network_subnet.deployment_subnet["subnet-1"]: Creating...
module.network_config.hcloud_network_subnet.deployment_subnet["subnet-2"]: Creating...
module.firewall.hcloud_firewall.default["coolify"]: Creation complete after 1s [id=1506259]
module.network_config.hcloud_network_subnet.deployment_subnet["subnet-2"]: Creation complete after 1s [id=4444534-10.0.2.0/24]
module.network_config.hcloud_network_subnet.deployment_subnet["subnet-1"]: Creation complete after 1s [id=4444534-10.0.1.0/24]
module.cluster.module.ssh_key.tls_private_key.ssh_key: Creation complete after 2s [id=bdaddd9a2253df2865e0c4ceb8ad41c0f7f78c20]
module.cluster.module.ssh_key.hcloud_ssh_key.default: Creating...
module.cluster.module.ssh_key.hcloud_ssh_key.default: Provisioning with 'local-exec'...
module.cluster.module.ssh_key.hcloud_ssh_key.default (local-exec): (output suppressed due to sensitive value in config)
module.cluster.module.ssh_key.hcloud_ssh_key.default: Creation complete after 0s [id=22158316]
module.cluster.module.controller.hcloud_server.coolify_controler["controler-1"]: Creating...
module.cluster.module.workers.hcloud_server.coolify_worker["worker-3"]: Creating...
module.cluster.module.workers.hcloud_server.coolify_worker["worker-1"]: Creating...
module.cluster.module.workers.hcloud_server.coolify_worker["worker-2"]: Creating...
module.cluster.module.workers.hcloud_server.coolify_worker["worker-2"]: Still creating... [10s elapsed]
module.cluster.module.workers.hcloud_server.coolify_worker["worker-1"]: Still creating... [10s elapsed]
module.cluster.module.controller.hcloud_server.coolify_controler["controler-1"]: Still creating... [10s elapsed]
module.cluster.module.workers.hcloud_server.coolify_worker["worker-3"]: Still creating... [10s elapsed]
module.cluster.module.workers.hcloud_server.coolify_worker["worker-1"]: Creation complete after 10s [id=50557676]
module.cluster.module.workers.hcloud_server.coolify_worker["worker-3"]: Creation complete after 14s [id=50557674]
module.cluster.module.workers.hcloud_server.coolify_worker["worker-2"]: Creation complete after 14s [id=50557675]
module.cluster.module.controller.hcloud_server.coolify_controler["controler-1"]: Creation complete after 14s [id=50557677]
module.cluster.module.workers.hcloud_server_network.subnet_controler["worker-1"]: Creating...
module.cluster.module.workers.hcloud_server_network.subnet_controler["worker-3"]: Creating...
module.cluster.module.workers.hcloud_server_network.subnet_controler["worker-2"]: Creating...
module.cluster.module.controller.hcloud_server_network.subnet_controler["controler-1"]: Creating...
cloudflare_record.controller-record: Creating...
cloudflare_record.controller-record: Creation complete after 2s [id=8eefdb528aad7df10f1d3d19949f95da]
module.cluster.module.workers.hcloud_server_network.subnet_controler["worker-2"]: Creation complete after 3s [id=50557675-4444534]
module.cluster.module.workers.hcloud_server_network.subnet_controler["worker-1"]: Creation complete after 4s [id=50557676-4444534]
module.cluster.module.controller.hcloud_server_network.subnet_controler["controler-1"]: Creation complete after 5s [id=50557677-4444534]
module.cluster.module.workers.hcloud_server_network.subnet_controler["worker-3"]: Still creating... [10s elapsed]
module.cluster.module.workers.hcloud_server_network.subnet_controler["worker-3"]: Creation complete after 17s [id=50557674-4444534]

Apply complete! Resources: 15 added, 0 changed, 0 destroyed.

Outputs:

controller_status = {
  "controler-1" = {
    "ip" = "168.119.50.26"
    "status" = "running"
  }
}
worker_status = {
  "worker-1" = {
    "ip" = "49.12.97.239"
    "status" = "running"
  }
  "worker-2" = {
    "ip" = "195.201.34.199"
    "status" = "running"
  }
  "worker-3" = {
    "ip" = "37.27.11.186"
    "status" = "running"
  }
}
```

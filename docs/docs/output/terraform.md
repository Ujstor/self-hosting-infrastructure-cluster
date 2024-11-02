```bash
terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.cloudflare_record.cloudflare_record.domain_recorda["app-bar"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = (known after apply)
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "app-bar"
      + proxiable       = (known after apply)
      + proxied         = true
      + ttl             = 1
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.cloudflare_record.cloudflare_record.domain_recorda["app-foo"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = (known after apply)
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "app-foo"
      + proxiable       = (known after apply)
      + proxied         = true
      + ttl             = 1
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.cloudflare_record.cloudflare_record.domain_recorda["controler"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = (known after apply)
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "controler.coolify"
      + proxiable       = (known after apply)
      + proxied         = false
      + ttl             = 3600
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.cloudflare_record.cloudflare_record.domain_recorda["coolify-ui"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = (known after apply)
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "coolify-ui"
      + proxiable       = (known after apply)
      + proxied         = false
      + ttl             = 3600
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.cloudflare_record.cloudflare_record.domain_recorda["worker-1"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = (known after apply)
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "worker-1.coolify"
      + proxiable       = (known after apply)
      + proxied         = false
      + ttl             = 3600
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.cloudflare_record.cloudflare_record.domain_recorda["worker-2"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = (known after apply)
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "worker-2.coolify"
      + proxiable       = (known after apply)
      + proxied         = false
      + ttl             = 3600
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.cloudflare_record.cloudflare_record.domain_recorda["worker-3"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = (known after apply)
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "worker-3.coolify"
      + proxiable       = (known after apply)
      + proxied         = false
      + ttl             = 3600
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
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

  # module.volumes.hcloud_volume.vol["volume-1"] will be created
  + resource "hcloud_volume" "vol" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "nbg1"
      + name              = "volume-1"
      + server_id         = (known after apply)
      + size              = 100
    }

  # module.volumes.hcloud_volume.vol["volume-2"] will be created
  + resource "hcloud_volume" "vol" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "hel1"
      + name              = "volume-2"
      + server_id         = (known after apply)
      + size              = 100
    }

  # module.volumes.hcloud_volume.vol["volume-3"] will be created
  + resource "hcloud_volume" "vol" {
      + delete_protection = false
      + format            = "xfs"
      + id                = (known after apply)
      + linux_device      = (known after apply)
      + location          = "hel1"
      + name              = "volume-3"
      + server_id         = (known after apply)
      + size              = 100
    }

  # module.volumes.hcloud_volume_attachment.vol_attachment["volume-1"] will be created
  + resource "hcloud_volume_attachment" "vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # module.volumes.hcloud_volume_attachment.vol_attachment["volume-2"] will be created
  + resource "hcloud_volume_attachment" "vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # module.volumes.hcloud_volume_attachment.vol_attachment["volume-3"] will be created
  + resource "hcloud_volume_attachment" "vol_attachment" {
      + automount = true
      + id        = (known after apply)
      + server_id = (known after apply)
      + volume_id = (known after apply)
    }

  # module.cluster.module.firewall.hcloud_firewall.default["default_firewall"] will be created
  + resource "hcloud_firewall" "default" {
      + id     = (known after apply)
      + labels = {
          + "type" = "firewall-default"
        }
      + name   = "default-firewall"

      + rule {
          + destination_ips = [
              + "0.0.0.0/0",
            ]
          + direction       = "out"
          + port            = "22"
          + protocol        = "tcp"
          + source_ips      = []
            # (1 unchanged attribute hidden)
        }
      + rule {
          + destination_ips = [
              + "0.0.0.0/0",
            ]
          + direction       = "out"
          + port            = "443"
          + protocol        = "tcp"
          + source_ips      = []
            # (1 unchanged attribute hidden)
        }
      + rule {
          + destination_ips = [
              + "0.0.0.0/0",
            ]
          + direction       = "out"
          + port            = "80"
          + protocol        = "tcp"
          + source_ips      = []
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
          + port            = "80"
          + protocol        = "tcp"
          + source_ips      = [
              + "0.0.0.0/0",
              + "::/0",
            ]
            # (1 unchanged attribute hidden)
        }
    }

  # module.cluster.module.firewall.hcloud_firewall.default["ui"] will be created
  + resource "hcloud_firewall" "default" {
      + id     = (known after apply)
      + labels = {
          + "type" = "coolify-ui"
        }
      + name   = "coolify-ui"

      + rule {
          + destination_ips = [
              + "0.0.0.0/0",
            ]
          + direction       = "out"
          + port            = "8000"
          + protocol        = "tcp"
          + source_ips      = []
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

  # module.cluster.module.firewall.hcloud_firewall.default["websoc-term"] will be created
  + resource "hcloud_firewall" "default" {
      + id     = (known after apply)
      + labels = {
          + "type" = "websocket-terminal"
        }
      + name   = "websocket-terminal"

      + rule {
          + destination_ips = [
              + "0.0.0.0/0",
            ]
          + direction       = "out"
          + port            = "6001"
          + protocol        = "tcp"
          + source_ips      = []
            # (1 unchanged attribute hidden)
        }
      + rule {
          + destination_ips = [
              + "0.0.0.0/0",
            ]
          + direction       = "out"
          + port            = "6002"
          + protocol        = "tcp"
          + source_ips      = []
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
          + port            = "6002"
          + protocol        = "tcp"
          + source_ips      = [
              + "0.0.0.0/0",
              + "::/0",
            ]
            # (1 unchanged attribute hidden)
        }
    }

  # module.cluster.module.server.hcloud_server.server["controller"] will be created
  + resource "hcloud_server" "server" {
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
          + "type" = "controller"
        }
      + location                   = "fsn1"
      + name                       = "controller"
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

  # module.cluster.module.server.hcloud_server.server["worker-1"] will be created
  + resource "hcloud_server" "server" {
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

  # module.cluster.module.server.hcloud_server.server["worker-2"] will be created
  + resource "hcloud_server" "server" {
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

  # module.cluster.module.server.hcloud_server.server["worker-3"] will be created
  + resource "hcloud_server" "server" {
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

  # module.cluster.module.server.hcloud_server_network.subnet_controler["controller"] will be created
  + resource "hcloud_server_network" "subnet_controler" {
      + id          = (known after apply)
      + ip          = "10.0.1.1"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # module.cluster.module.server.hcloud_server_network.subnet_controler["worker-1"] will be created
  + resource "hcloud_server_network" "subnet_controler" {
      + id          = (known after apply)
      + ip          = "10.0.2.1"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # module.cluster.module.server.hcloud_server_network.subnet_controler["worker-2"] will be created
  + resource "hcloud_server_network" "subnet_controler" {
      + id          = (known after apply)
      + ip          = "10.0.2.2"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # module.cluster.module.server.hcloud_server_network.subnet_controler["worker-3"] will be created
  + resource "hcloud_server_network" "subnet_controler" {
      + id          = (known after apply)
      + ip          = "10.0.2.3"
      + mac_address = (known after apply)
      + server_id   = (known after apply)
      + subnet_id   = (known after apply)
    }

  # module.cluster.module.ssh_key.hcloud_ssh_key.default will be created
  + resource "hcloud_ssh_key" "default" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + labels      = {}
      + name        = "coolify_cluster_prod_key"
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

Plan: 29 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + server_status = {
      + controller = {
          + id       = (known after apply)
          + ip       = (known after apply)
          + location = "fsn1"
          + status   = (known after apply)
        }
      + worker-1   = {
          + id       = (known after apply)
          + ip       = (known after apply)
          + location = "nbg1"
          + status   = (known after apply)
        }
      + worker-2   = {
          + id       = (known after apply)
          + ip       = (known after apply)
          + location = "hel1"
          + status   = (known after apply)
        }
      + worker-3   = {
          + id       = (known after apply)
          + ip       = (known after apply)
          + location = "hel1"
          + status   = (known after apply)
        }
    }

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.cluster.module.ssh_key.tls_private_key.ssh_key: Creating...
module.network_config.hcloud_network.network: Creating...
module.cluster.module.firewall.hcloud_firewall.default["ui"]: Creating...
module.cluster.module.firewall.hcloud_firewall.default["websoc-term"]: Creating...
module.cluster.module.firewall.hcloud_firewall.default["default_firewall"]: Creating...
module.cluster.module.ssh_key.tls_private_key.ssh_key: Creation complete after 3s [id=97f2dedd118b8320d5dc81c71525d49a761ff6d2]
module.cluster.module.ssh_key.hcloud_ssh_key.default: Creating...
module.cluster.module.firewall.hcloud_firewall.default["ui"]: Creation complete after 3s [id=1707755]
module.cluster.module.ssh_key.hcloud_ssh_key.default: Provisioning with 'local-exec'...
module.cluster.module.ssh_key.hcloud_ssh_key.default (local-exec): (output suppressed due to sensitive value in config)
module.cluster.module.ssh_key.hcloud_ssh_key.default: Creation complete after 0s [id=24181160]
module.network_config.hcloud_network.network: Creation complete after 3s [id=10305011]
module.network_config.hcloud_network_subnet.deployment_subnet["subnet-2"]: Creating...
module.network_config.hcloud_network_subnet.deployment_subnet["subnet-1"]: Creating...
module.cluster.module.firewall.hcloud_firewall.default["websoc-term"]: Creation complete after 3s [id=1707756]
module.cluster.module.firewall.hcloud_firewall.default["default_firewall"]: Creation complete after 3s [id=1707757]
module.network_config.hcloud_network_subnet.deployment_subnet["subnet-2"]: Creation complete after 1s [id=10305011-10.0.2.0/24]
module.network_config.hcloud_network_subnet.deployment_subnet["subnet-1"]: Creation complete after 2s [id=10305011-10.0.1.0/24]
module.cluster.module.server.hcloud_server.server["worker-1"]: Creating...
module.cluster.module.server.hcloud_server.server["controller"]: Creating...
module.cluster.module.server.hcloud_server.server["worker-3"]: Creating...
module.cluster.module.server.hcloud_server.server["worker-2"]: Creating...
module.cluster.module.server.hcloud_server.server["worker-2"]: Still creating... [10s elapsed]
module.cluster.module.server.hcloud_server.server["controller"]: Still creating... [10s elapsed]
module.cluster.module.server.hcloud_server.server["worker-3"]: Still creating... [10s elapsed]
module.cluster.module.server.hcloud_server.server["worker-1"]: Still creating... [10s elapsed]
module.cluster.module.server.hcloud_server.server["worker-1"]: Creation complete after 15s [id=55099163]
module.cluster.module.server.hcloud_server.server["worker-3"]: Creation complete after 15s [id=55099164]
module.cluster.module.server.hcloud_server.server["worker-2"]: Creation complete after 16s [id=55099166]
module.cluster.module.server.hcloud_server.server["controller"]: Still creating... [20s elapsed]
module.cluster.module.server.hcloud_server.server["controller"]: Creation complete after 20s [id=55099165]
module.cluster.module.server.hcloud_server_network.subnet_controler["worker-1"]: Creating...
module.cluster.module.server.hcloud_server_network.subnet_controler["controller"]: Creating...
module.cluster.module.server.hcloud_server_network.subnet_controler["worker-2"]: Creating...
module.cluster.module.server.hcloud_server_network.subnet_controler["worker-3"]: Creating...
module.volumes.hcloud_volume.vol["volume-3"]: Creating...
module.volumes.hcloud_volume.vol["volume-1"]: Creating...
module.volumes.hcloud_volume.vol["volume-2"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["worker-3"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["coolify-ui"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["app-foo"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["worker-3"]: Creation complete after 2s [id=cf3ad5410f08bb0d216187fb4b1cb2aa]
module.cloudflare_record.cloudflare_record.domain_recorda["controler"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["coolify-ui"]: Creation complete after 2s [id=daaec8358acc37d41be703621e317b63]
module.cloudflare_record.cloudflare_record.domain_recorda["worker-2"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["app-foo"]: Creation complete after 3s [id=5c5711fd3f083a32b1d580b25406e96d]
module.cloudflare_record.cloudflare_record.domain_recorda["worker-1"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["controler"]: Creation complete after 2s [id=500bffdbe4442b27762fb9ff4137ccb5]
module.cloudflare_record.cloudflare_record.domain_recorda["app-bar"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["worker-2"]: Creation complete after 2s [id=397cc4b276e4e90d1ba58b894e498eb0]
module.cloudflare_record.cloudflare_record.domain_recorda["worker-1"]: Creation complete after 1s [id=9c62ee07972710566d9f13f24383f2e5]
module.cloudflare_record.cloudflare_record.domain_recorda["app-bar"]: Creation complete after 1s [id=6457ed10ae101654dcec20bcedf22264]
module.volumes.hcloud_volume.vol["volume-2"]: Creation complete after 7s [id=101545778]
module.volumes.hcloud_volume.vol["volume-1"]: Creation complete after 7s [id=101545777]
module.volumes.hcloud_volume.vol["volume-3"]: Creation complete after 7s [id=101545779]
module.volumes.hcloud_volume_attachment.vol_attachment["volume-2"]: Creating...
module.volumes.hcloud_volume_attachment.vol_attachment["volume-1"]: Creating...
module.volumes.hcloud_volume_attachment.vol_attachment["volume-3"]: Creating...
module.cluster.module.server.hcloud_server_network.subnet_controler["worker-2"]: Creation complete after 9s [id=55099166-10305011]
module.cluster.module.server.hcloud_server_network.subnet_controler["worker-3"]: Still creating... [10s elapsed]
module.cluster.module.server.hcloud_server_network.subnet_controler["controller"]: Still creating... [10s elapsed]
module.cluster.module.server.hcloud_server_network.subnet_controler["worker-1"]: Still creating... [10s elapsed]
module.cluster.module.server.hcloud_server_network.subnet_controler["controller"]: Creation complete after 13s [id=55099165-10305011]
module.volumes.hcloud_volume_attachment.vol_attachment["volume-1"]: Creation complete after 8s [id=101545777]
module.volumes.hcloud_volume_attachment.vol_attachment["volume-3"]: Creation complete after 8s [id=101545779]
module.volumes.hcloud_volume_attachment.vol_attachment["volume-2"]: Creation complete after 8s [id=101545778]
module.cluster.module.server.hcloud_server_network.subnet_controler["worker-3"]: Still creating... [20s elapsed]
module.cluster.module.server.hcloud_server_network.subnet_controler["worker-1"]: Still creating... [20s elapsed]
module.cluster.module.server.hcloud_server_network.subnet_controler["worker-1"]: Creation complete after 21s [id=55099163-10305011]
module.cluster.module.server.hcloud_server_network.subnet_controler["worker-3"]: Creation complete after 21s [id=55099164-10305011]

Apply complete! Resources: 29 added, 0 changed, 0 destroyed.

Outputs:

server_status = {
  "controller" = {
    "id" = "55099165"
    "ip" = "23.88.42.69"
    "location" = "fsn1"
    "status" = "running"
  }
  "worker-1" = {
    "id" = "55099163"
    "ip" = "78.47.239.33"
    "location" = "nbg1"
    "status" = "running"
  }
  "worker-2" = {
    "id" = "55099166"
    "ip" = "65.21.5.16"
    "location" = "hel1"
    "status" = "running"
  }
  "worker-3" = {
    "id" = "55099164"
    "ip" = "135.181.41.246"
    "location" = "hel1"
    "status" = "running"
  }
}
```

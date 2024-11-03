module "cluster" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/cluster?ref=v0.0.3"

  ssh_key_name = "coolify_cluster_prod_key"
  ssh_key_path = ".ssh" # create dir in root where terraform is executed

  server_config = {
    controller = {
      location     = "fsn1"
      server_type  = "cx22"
      labels       = "controller"
      ipv4_enabled = true
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-1.subnet_id
      subnet_ip    = "10.0.1.1"
    }
    worker-1 = {
      location     = "nbg1"
      server_type  = "cx22"
      labels       = "worker"
      ipv4_enabled = true
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-2.subnet_id
      subnet_ip    = "10.0.2.1"
    }
    worker-2 = {
      location     = "hel1"
      server_type  = "cx22"
      labels       = "worker"
      ipv4_enabled = true
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-2.subnet_id
      subnet_ip    = "10.0.2.2"
    }
    worker-3 = {
      location     = "hel1"
      server_type  = "cx22"
      labels       = "worker"
      ipv4_enabled = true
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-2.subnet_id
      subnet_ip    = "10.0.2.3"
    }
  }
  # Aditional firewall rules except the default ones (22, 80, 443)
  firewall_config = {
    ui = {
      labels = {
        type = "coolify-ui"
      }
      name = "coolify-ui"

      rules = [
        {
          direction = "in"
          port      = "8000"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "8000"
          protocol        = "tcp"
        },
      ]
    }
    websocet-terminal = {
      labels = {
        type = "websocket-terminal"
      }
      name = "websocket-terminal"

      rules = [
        {
          direction = "in"
          port      = "6001"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "6001"
          protocol        = "tcp"
        },
        {
          direction = "in"
          port      = "6002"
          protocol  = "tcp"
        },
        {
          destination_ips = ["0.0.0.0/0"]
          direction       = "out"
          port            = "6002"
          protocol        = "tcp"
        },
      ]
    }
  }
}

module "cloudflare_record" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/cloudflare_record?ref=v0.0.3"

  cloudflare_record = {
    controler = {
      zone_id = var.cloudflare_zone_id
      name    = "controler.coolify"
      content = module.cluster.server_status.controller.ip
      type    = "A"
      ttl     = 3600
      proxied = false
    }
    worker-1 = {
      zone_id = var.cloudflare_zone_id
      name    = "worker-1.coolify"
      content = module.cluster.server_status.worker-1.ip
      type    = "A"
      ttl     = 3600
      proxied = false
    }
    worker-2 = {
      zone_id = var.cloudflare_zone_id
      name    = "worker-2.coolify"
      content = module.cluster.server_status.worker-2.ip
      type    = "A"
      ttl     = 3600
      proxied = false
    }
    worker-3 = {
      zone_id = var.cloudflare_zone_id
      name    = "worker-3.coolify"
      content = module.cluster.server_status.worker-3.ip
      type    = "A"
      ttl     = 3600
      proxied = false
    }
    coolify-ui = {
      zone_id = var.cloudflare_zone_id
      name    = "coolify-ui"
      content = module.cluster.server_status.controller.ip
      type    = "A"
      ttl     = 3600
      proxied = false
    }
    app-foo = {
      zone_id = var.cloudflare_zone_id
      name    = "app-foo"
      content = module.cluster.server_status.worker-1.ip
      type    = "A"
      ttl     = 1
      proxied = true
    }
    app-bar = {
      zone_id = var.cloudflare_zone_id
      name    = "app-bar"
      content = module.cluster.server_status.worker-2.ip
      type    = "A"
      ttl     = 1
      proxied = true
    }
  }
}

module "volumes" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/volumes?ref=v0.0.3"

  volume_config = {
    volume-1 = {
      size      = 100
      location  = module.cluster.server_status.worker-1.location
      server_id = module.cluster.server_status.worker-1.id
    }
    volume-2 = {
      size      = 100
      location  = module.cluster.server_status.worker-2.location
      server_id = module.cluster.server_status.worker-2.id
    }
    volume-3 = {
      size      = 100
      location  = module.cluster.server_status.worker-3.location
      server_id = module.cluster.server_status.worker-3.id
    }
  }
}

module "network_config" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/vpc_subnet?ref=v0.0.3"

  vpc_config = {
    vpc_name     = "coolify"
    vpc_ip_range = "10.0.0.0/16"
  }

  subnet_config = {
    subnet-1 = {
      subnet_ip_range = "10.0.1.0/24"
    }
    subnet-2 = {
      subnet_ip_range = "10.0.2.0/24"
    }
  }

  network_type = "cloud"
  network_zone = "eu-central"
}

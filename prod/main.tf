module "cluster" {
  source = "../modules/modules/cluster/"

  ssh_key_name = "coolify_cluster_prod_key"
  ssh_key_path = ".ssh"

  controller_config = {
    controller-2 = {
      location    = "fsn1"
      server_type = "cx22"
      labels      = "controller"
      subnet_id   = module.network_config.subnet_id.subnet-1.subnet_id
      subnet_ip   = "10.0.1.2"
    }
  }

  worker_config = {
    worker-1 = {
      location     = "fsn1"
      server_type  = "cx22"
      labels       = "worker"
      ipv4_enabled = true
      ipv6_enabled = false
      subnet_id    = module.network_config.subnet_id.subnet-2.subnet_id
      subnet_ip    = "10.0.2.1"
    }
    worker-2 = {
      location     = "nbg1"
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
}

module "cloudflare_record" {
  source = "../modules/modules/network/cloudflare_record/"

  cloudflare_record = {
    cl-ui = {
      zone_id = var.cloudflare_zone_id
      name    = "uitest"
      value   = module.cluster.controller_status.controller-1.ip
      type    = "A"
      ttl     = 3600
      proxied = false
    }
    app-foo = {
      zone_id = var.cloudflare_zone_id
      name    = "app-foo"
      value   = module.cluster.worker_status.worker-1.ip
      type    = "A"
      ttl     = 3600
      proxied = false
    }
  }
}

module "network_config" {
  source = "../modules/modules/network/vpc_subnet/"

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

module "cluster" {
  source = "../../../modules/cluster_firewall/"

  ssh_key_name = "coolify_cluster_hetzner_key"
  ssh_key_path = ".ssh"

  controller_config = {
    controler-1 = {
      location    = "fsn1"
      server_type = "cx22"
      labels      = "controler"
      subnet_id   = module.network_config.subnet_id.subnet-1.subnet_id
      subnet_ip   = "10.0.1.1"
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

  #If the IP is pulled from the Terraform state, the best approach is to add the configuration
  #after the Hetzner infrastructure has been created
  cloudflare_record = {
    coolify_ui = {
      zone_id = var.cloudflare_zone_id
      name    = "coolify-ui"
      value   = data.terraform_remote_state.cluster.outputs.controller_status.controler-1.ip
      type    = "A"
      ttl     = 1
      proxied = true
    }
    app_foo = {
      zone_id = var.cloudflare_zone_id
      name    = "foo"
      value   = data.terraform_remote_state.cluster.outputs.worker_status.worker-1.ip
      type    = "A"
      ttl     = 1
      proxied = true
    }
    app_bar = {
      zone_id = var.cloudflare_zone_id
      name    = "bar"
      value   = data.terraform_remote_state.cluster.outputs.worker_status.worker-2.ip
      type    = "A"
      ttl     = 1
      proxied = true
    }
    app_buu = {
      zone_id = var.cloudflare_zone_id
      name    = "@"
      value   = data.terraform_remote_state.cluster.outputs.worker_status.worker-3.ip
      type    = "A"
      ttl     = 1
      proxied = true
    }
  }
}

module "network_config" {
  source = "../../../modules/network/vpc_subnet/"

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

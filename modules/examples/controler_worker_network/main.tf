module "ssh_key_test" {
  source = "../../modules/ssh_key/"

  ssh_key_name = "coolify_cluster_hetzner_key"
  ssh_key_path = ".ssh"
}

module "controler_test" {
  source = "../../modules/controler/"

  controler_config = {
    controler-1 = {
      location    = "fsn1"
      server_type = "cx22"
      labels      = "controler"
    }
  }

  hcloud_ssh_key_id = [module.ssh_key_test.hcloud_ssh_key_id]

  depends_on = [module.ssh_key_test]
}

module "workers_test" {
  source = "../../modules/worker/"

  worker_config = {
    worker-1 = {
      location     = "fsn1"
      server_type  = "cx22"
      labels       = "worker"
      ipv4_enabled = true
      ipv6_enabled = false
    }
    worker-2 = {
      location     = "nbg1"
      server_type  = "cx22"
      labels       = "worker"
      ipv4_enabled = true
      ipv6_enabled = false
    }
    worker-3 = {
      location     = "hel1"
      server_type  = "cx22"
      labels       = "worker"
      ipv4_enabled = true
      ipv6_enabled = false
    }
  }

  os_type = "ubuntu-22.04"

  hcloud_ssh_key_id = [module.ssh_key_test.hcloud_ssh_key_id]

  depends_on = [module.ssh_key_test]
}

module "vpc_subnets" {
  source = "../../modules/network/"

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

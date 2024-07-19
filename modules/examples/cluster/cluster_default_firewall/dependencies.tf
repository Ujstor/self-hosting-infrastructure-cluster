data "terraform_remote_state" "cluster" {
  backend = "local"

  config = {
    path = "./terraform.tfstate"
  }

  depends_on = [module.network_config]
}

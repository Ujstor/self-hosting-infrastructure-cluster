# Self hosting infrastructure cluster

Infra for utilizing Hetzner low-cost VPS and Docker containers, wrapped in [Coolify](https://coolify.io) as an all-in-one PaaS, to self-host your own applications, databases, or services.

![diagram](./public/01_infra_diagram.svg)

## Prerequisites

Before you begin, ensure you have the following:

- [Hetzner Cloud account](https://hetzner.cloud/?ref=Ix9xCKNxJriM) 
- [Terraform](https://www.terraform.io/downloads.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

Terraform modules have been moved to separate ***[repository](https://github.com/Ujstor/terraform-hetzner-modules)*** that contain Hetzner Cloud and Cloudflare resources, and they are referenced through source and release.

All infrastructure components, except for the server, are optional, and you can choose whether to use them.
Refrence [examples](https://github.com/Ujstor/terraform-hetzner-modules/tree/master/examples) in hetzner-terraform-modules repository.

## Note
If you want to use Terraform state backed on AWS and back up your SSH key to S3, you need an AWS account and must configure your AWS CLI. These configurations are optional and are placed in a global directory.s

Otherwise, remove the backend configuration from terraform.tf in the Coolify Hetzner infrastructure directory.

Managin DNS records with Cloudflare is also optional. If you want to use it, you need to create an account and configure your API key.

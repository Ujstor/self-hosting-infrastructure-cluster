# Self hosting infrastructure cluster

Infra for utilizing Hetzner low-cost VPS and Docker containers, wrapped in [Coolify](https://coolify.io) as an all-in-one PaaS, to self-host your own applications, databases, or services.

## Prerequisites

Before you begin, ensure you have the following:

- [Hetzner](https://hetzner.cloud/?ref=Ix9xCKNxJriM) Cloud account
- [Terraform](https://www.terraform.io/downloads.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
 
## Deployment Steps

### 1. Generate Hetzner API Token

Create new project in Hetzner [console](https://console.hetzner.cloud/projects)

Obtain API token from Hetzner console that will be used by Terraform to interact with the platform. 
Navigate to your project and click on SECURITY > API TOKENS > GENERATE API (give read/write access)

Paste API token in the  `.auto.tfvars`. This will overwrite default values in `variables.tf` file.

### 2. Configure infrastructure

Choose how many servers you want to have in your cluster. For a minimum, you can create and deploy on your controller, but this is not recommended. Read more about possible configurations and how to use Coolify in the official docs. There is also the possibility to use workers in swarm mode, and you can put a load balancer in front of your cluster. For now, you need to configure lb yourself, but in future Coolify releases, this will be automated. This can get complex as you want to be.

```shell
hcloud_token = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

location_list                 = ["fsn1", "nbg1", "hel1"]
instances_coolify_controler   = "1"
instances_coolify_worker      = "2"
server_type_coolify_controler = "cx22"
server_type_coolify_worker    = "cx22"
os_type                       = "debian-12"
public_net                    = true
```

### 3. Initialize and Apply Terraform

Initialize Terraform and apply the configuration:

```shell
cd hetzner-infra
terraform init --upgrade
terraform validate
terraform apply
```

### 4. Define hosts and run ansible playbook

In your `inventory/hosts` file, specify the IP addresses of your newly created servers obtained from Terraform output, or alternatively, verify them in the Hetzner Cloud console

```shell
[coolify-controler]
49.13.73.3

[coolify-worker]
91.107.208.20
128.140.0.112
```

Run playbook:
```shell
cd ansible
ansible-playbook playbooks/playbook_install_coolify.yml 
```
Ansible playbook automates the installation of Coolify on controller hosts. It configures common dependencies and enhances system security on both controller and workers hosts:

- Updates package lists and upgrades all packages to ensure the system is up to date.
- Installs necessary dependencies including UFW and Fail2Ban for enhancing system security.
- Sets up UFW to allow specific incoming traffic and enables it for added security.
- Configures Fail2Ban to prevent unauthorized access attempts by banning malicious IP addresses.
- Implements SSH hardening measures to secure remote access to the system.
- Installs Coolify on controller hosts and configures it to listen on specific ports.
- Configures worker hosts to allow incoming traffic on specified ports required for Coolify operation
.
### 5. Open UI:

When Ansible finishes, Coolify's UI will be available at: 

```shell
CONTROLER_SERVER_IP:8000
```

Now is the time to configure Coolify. Add your private key that Terraform created, use workers private IPs and add the workers to your cluster. Consult the [documentation](https://coolify.io/docs/) for futher steps. 

## 6. SSH into server

Terraform creates SSH private and public keys that are added to Hetzner and servers. They are also used by Ansible. Be careful with keys, you don't want to lose them.

If needed, you can ssh into the server with the following command:

```shell
ssh root@<server-ip> -i ~/.ssh/self_hosted_hetzner_key.pem
```

### 7. Destroy infrastructure

To destroy the infrastructure run the following command:

```shell
terraform destroy
```


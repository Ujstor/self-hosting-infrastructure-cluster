## 1. Generate Hetzner API Token

Create new project in Hetzner [console](https://console.hetzner.cloud/projects)

## 2. Configure infrastructure

Choose how many servers you want to have in your cluster, the network topology, the types of servers, domains etc... 

Example configurations are in the /modules/examples folder, and more detailed usage instructions are in the documentation

## 3. Initialize and Apply Terraform

Initialize Terraform and apply the configuration:

```shell
terraform init --upgrade
terraform validate
terraform apply
```

## 4. Define hosts and run ansible playbook

In your `inventory/hosts` file, specify the IP addresses of your newly created servers obtained from Terraform output, or alternatively, verify them in the Hetzner Cloud console. 
Check where you saved the created SSH keys. If the name is changed from the default value inside the Terraform configuration,
update the ansible/ansible.cfg file accordingly.


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


## 5. Open UI:

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

## 7. Destroy infrastructure

To destroy the infrastructure run the following command:

```shell
terraform destroy
```

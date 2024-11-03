## 1. Generate Hetzner API Token

Create a new project in the Hetzner [console](https://console.hetzner.cloud/projects) to obtain an API token.

## 2. Configure Infrastructure

Determine the specifications of your cluster, such as the number of servers, network topology, server types, and domains.

You can find example configurations in the [/modules/examples directory](https://github.com/Ujstor/terraform-hetzner-modules/tree/master/examples), and additional usage instructions are provided in the documentation.

## 3. Initialize and Apply Terraform

Initialize and apply the Terraform configuration:

```shell
terraform init --upgrade
terraform validate
terraform apply
```

## 4. Define Hosts and Run Ansible Playbook

In the `inventory/inventory.yml` file, specify the IP addresses or DNS of the servers you created. You can find these in the Terraform output or verify them in the Hetzner Cloud console.

Ensure that you know the location of the SSH keys you created. If the key names differ from the default values in the Terraform configuration, update the paths in `ansible/ansible.cfg` as needed.

### Inventory File Example

```yaml
servers:
  children:
    controller:
      hosts:
        controller.coolify.ujstor.com:
    worker:
      hosts:
        worker-1.coolify.ujstor.com:
        worker-2.coolify.ujstor.com:
        worker-3.coolify.ujstor.com:
```

### Run Ansible in a Docker Container

You can run Ansible in a Docker container or locally. If ansible running locally, check the inventory and SSH key paths in `ansible.cfg`.

```shell
cd ansible
docker build -t ansible-coolify .

docker run -it --rm \
  -v ./inventory/inventory.yml:/config/inventory.yml \
  -v /path/to/.ssh/coolify_cluster_prod_key:/secrets/ssh_key \
  -v /path/to/.ssh/coolify_cluster_prod_key.pub:/secrets/ssh_key.pub \
  ansible-coolify
```

You can also use a prebuilt image from the GitHub Actions pipeline, such as `ansible-coolify-deploy:0.0.1`.

### Run the Ansible Playbook

To deploy Coolify, run the Ansible playbook:

```shell
ansible-playbook playbooks/playbook_install_coolify.yml
```

The Ansible playbook automates the installation of Coolify on the controller hosts. It also configures key dependencies and strengthens system security across both the controller and worker hosts by performing the following actions:

- Updates and upgrades all packages.
- Installs necessary dependencies, including UFW and Fail2Ban, for enhanced system security.
- Sets up UFW to allow specific incoming traffic, and enables it.
- Configures Fail2Ban to block unauthorized access attempts.
- Implements SSH hardening measures for secure remote access.
- Installs and configures Coolify on controller hosts to listen on specified ports.
- Sets up worker hosts to allow incoming traffic on the ports required for Coolify.

## 5. Open the Coolify UI

After Ansible completes, you can access Coolify's UI at:

```shell
CONTROLLER_SERVER_IP:8000
```

Follow the prompts to configure Coolify. Use the private key created by Terraform, enter the private IPs of your worker nodes, and add them to your cluster. Refer to the [Coolify documentation](https://coolify.io/docs/) for further steps.

## 6. SSH into the Server

Terraform generates the SSH keys, which are added to Hetzner and the servers, and are also used by Ansible. Keep these keys secure, as losing them could prevent access to the servers.

To SSH into a server, use the following command:

```shell
ssh root@<server-ip> -i /path/to/.ssh/coolify_cluster_prod_key
```

## 7. Destroy Infrastructure

To delete the infrastructure, run the following command:

```shell
terraform destroy
```

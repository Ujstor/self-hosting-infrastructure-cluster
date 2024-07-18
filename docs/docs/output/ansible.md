```bash
ansible-playbook playbooks/playbook_install_coolify.yml
[WARNING]: Invalid characters were found in group names but not replaced, use -vvvv to see details

PLAY [Install Coolify on controler host] *************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************
ok: [168.119.50.26]

TASK [common : Update package lists] *****************************************************************************************************************************************
ok: [168.119.50.26]

TASK [common : Upgrade all packages] *****************************************************************************************************************************************
changed: [168.119.50.26]

TASK [common : Install public AuthorizedKeysFile] ****************************************************************************************************************************
changed: [168.119.50.26]

TASK [common : Install required packages] ************************************************************************************************************************************
changed: [168.119.50.26]

TASK [common : Allow everything and enable UFW] ******************************************************************************************************************************
changed: [168.119.50.26]

TASK [common : Allow incoming traffic on specified ports] ********************************************************************************************************************
changed: [168.119.50.26] => (item=22)

TASK [common : Configure Fail2Ban] *******************************************************************************************************************************************
changed: [168.119.50.26]

TASK [common : Restart fail2ban] *********************************************************************************************************************************************
changed: [168.119.50.26]

TASK [common : Ensure no conflicting PermitRootLogin in sshd_config] *********************************************************************************************************
changed: [168.119.50.26]

TASK [common : SSH Hardening for root user] **********************************************************************************************************************************
changed: [168.119.50.26]

TASK [common : Restart sshd] *************************************************************************************************************************************************
changed: [168.119.50.26]

TASK [Allow incoming UI Port] ************************************************************************************************************************************************
changed: [168.119.50.26] => (item=6001)
changed: [168.119.50.26] => (item=8000)
changed: [168.119.50.26] => (item=80)
changed: [168.119.50.26] => (item=443)

TASK [Download Coolify installation script] **********************************************************************************************************************************
changed: [168.119.50.26]

TASK [Execute Coolify installation script] ***********************************************************************************************************************************
ok: [168.119.50.26]

TASK [Debug installation script output] **************************************************************************************************************************************
ok: [168.119.50.26] => {
    "install_result.stdout_lines": [
        "-------------",
        "Welcome to Coolify v4 beta installer!",
        "This script will install everything for you.",
        "(Source code: https://github.com/coollabsio/coolify/blob/main/scripts/install.sh )",
        "",
        "-------------",
        "OS: debian 12",
        "Coolify version: 4.0.0-beta.315",
        "-------------",
        "Installing required packages...",
        "OpenSSH server is installed.",
        "OpenSSH server is installed.",
        "PermitRootLogin is enabled.",
        "Docker is not installed. Installing Docker.",
        "# Executing docker install script, commit: e5543d473431b782227f8908005543bb4389b8de",
        "INFO: Searching repository for VERSION '26.0.2'",
        "INFO: apt-cache madison docker-ce | grep '26.0.2' | head -1 | awk '{$1=$1};1' | cut -d' ' -f 3",
        "INFO: apt-cache madison docker-ce-cli | grep '26.0.2' | head -1 | awk '{$1=$1};1' | cut -d' ' -f 3",
        "Client: Docker Engine - Community",
        " Version:           26.0.2",
        " API version:       1.45",
        " Go version:        go1.21.9",
        " Git commit:        3c863ff",
        " Built:             Thu Apr 18 16:27:49 2024",
        " OS/Arch:           linux/amd64",
        " Context:           default",
        "",
        "Server: Docker Engine - Community",
        " Engine:",
        "  Version:          26.0.2",
        "  API version:      1.45 (minimum version 1.24)",
        "  Go version:       go1.21.9",
        "  Git commit:       7cef0d9",
        "  Built:            Thu Apr 18 16:27:49 2024",
        "  OS/Arch:          linux/amd64",
        "  Experimental:     false",
        " containerd:",
        "  Version:          1.7.19",
        "  GitCommit:        2bf793ef6dc9a18e00cb12efb64355c2c9d5eb41",
        " runc:",
        "  Version:          1.7.19",
        "  GitCommit:        v1.1.13-0-g58aa920",
        " docker-init:",
        "  Version:          0.19.0",
        "  GitCommit:        de40ad0",
        "",
        "================================================================================",
        "",
        "To run Docker as a non-privileged user, consider setting up the",
        "Docker daemon in rootless mode for your user:",
        "",
        "    dockerd-rootless-setuptool.sh install",
        "",
        "Visit https://docs.docker.com/go/rootless/ to learn about rootless mode.",
        "",
        "",
        "To run the Docker daemon as a fully privileged service, but granting non-root",
        "users access, refer to https://docs.docker.com/go/daemon-access/",
        "",
        "WARNING: Access to the remote API on a privileged Docker daemon is equivalent",
        "         to root access on the host. Refer to the 'Docker daemon attack surface'",
        "         documentation for details: https://docs.docker.com/go/attack-surface/",
        "",
        "================================================================================",
        "",
        "Docker installed successfully.",
        "-------------",
        "Check Docker Configuration...",
        "Docker configuration updated, restart docker daemon...",
        "-------------",
        "Downloading required files from CDN...",
        "d8a5e0afc85ffff03aee6c7f5b8f2ece1bbcd57f9b459535548b436fc9e19f1c",
        "",
        "Congratulations! Your Coolify instance is ready to use.",
        "",
        "Please visit http://168.119.50.26:8000 to get started."
    ]
}

PLAY [Worker configuration] **************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************
ok: [49.12.97.239]
ok: [195.201.34.199]
ok: [37.27.11.186]

TASK [common : Update package lists] *****************************************************************************************************************************************
changed: [195.201.34.199]
changed: [37.27.11.186]
changed: [49.12.97.239]

TASK [common : Upgrade all packages] *****************************************************************************************************************************************
changed: [195.201.34.199]
changed: [37.27.11.186]
changed: [49.12.97.239]

TASK [common : Install public AuthorizedKeysFile] ****************************************************************************************************************************
changed: [195.201.34.199]
changed: [49.12.97.239]
changed: [37.27.11.186]

TASK [common : Install required packages] ************************************************************************************************************************************
changed: [195.201.34.199]
changed: [37.27.11.186]
changed: [49.12.97.239]

TASK [common : Allow everything and enable UFW] ******************************************************************************************************************************
changed: [49.12.97.239]
changed: [195.201.34.199]
changed: [37.27.11.186]

TASK [common : Allow incoming traffic on specified ports] ********************************************************************************************************************
changed: [195.201.34.199] => (item=22)
changed: [49.12.97.239] => (item=22)
changed: [37.27.11.186] => (item=22)

TASK [common : Configure Fail2Ban] *******************************************************************************************************************************************
changed: [195.201.34.199]
changed: [49.12.97.239]
changed: [37.27.11.186]

TASK [common : Restart fail2ban] *********************************************************************************************************************************************
changed: [195.201.34.199]
changed: [49.12.97.239]
changed: [37.27.11.186]

TASK [common : Ensure no conflicting PermitRootLogin in sshd_config] *********************************************************************************************************
changed: [195.201.34.199]
changed: [49.12.97.239]
changed: [37.27.11.186]

TASK [common : SSH Hardening for root user] **********************************************************************************************************************************
changed: [195.201.34.199]
changed: [49.12.97.239]
changed: [37.27.11.186]

TASK [common : Restart sshd] *************************************************************************************************************************************************
changed: [195.201.34.199]
changed: [49.12.97.239]
changed: [37.27.11.186]

TASK [Allow incoming traffic on specified ports] *****************************************************************************************************************************
changed: [195.201.34.199] => (item=6001)
changed: [49.12.97.239] => (item=6001)
changed: [37.27.11.186] => (item=6001)

PLAY RECAP *******************************************************************************************************************************************************************
168.119.50.26              : ok=16   changed=12   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
195.201.34.199             : ok=13   changed=12   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
37.27.11.186               : ok=13   changed=12   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
49.12.97.239               : ok=13   changed=12   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

```markdown
# Objective 0: Build the Lab Environment (Revised)

This objective creates a **fully reproducible Linux training lab** using:

| Layer           | Tool      |
| --------------- | --------- |
| Infrastructure  | Terraform |
| OS Installation | Kickstart |
| Configuration   | Ansible   |

The environment supports **CompTIA Linux+ XK0-006 training** and is designed to emphasize:

- Infrastructure as Code
- Configuration as Code
- Repeatable lab deployments
- Automation-driven system administration

---

# Lab Architecture

```

```
          Internet
             |
            NAT
             |
 --------------------------------
 |              |               |
```

controller       server1         server2
192.168.56.10   192.168.56.11   192.168.56.12

```

---

# Network Design

Network:

```

192.168.56.0/24

```

| Host       | Address       |
| ---------- | ------------- |
| controller | 192.168.56.10 |
| server1    | 192.168.56.11 |
| server2    | 192.168.56.12 |

Gateway:

```

none (host-only network)

```

DNS:

```

1.1.1.1
8.8.8.8

```

Each VM uses **two adapters**:

| Adapter   | Mode      | Purpose         |
| --------- | --------- | --------------- |
| Adapter 1 | NAT       | Internet access |
| Adapter 2 | Host-Only | Lab network     |

---

# Repository Structure

All work occurs inside the GitHub repository:

```

[https://github.com/TheSubtleArtist/myLinuxTraining](https://github.com/TheSubtleArtist/myLinuxTraining)

```

Repository layout:

```

myLinuxTraining/
│
├── automation/
│   ├── terraform/
│   ├── ansible/
│   └── kickstart/
│
├── exercises/
│
├── docs/
│
├── .gitignore
└── README.md

````

---

# Task 1 — Install Required Host Software

Verify the following versions are installed on the Windows 11 laptop.

| Tool           | Required Version |
| -------------- | ---------------- |
| Git            | ≥ 2.40           |
| Terraform      | 1.6.x            |
| VirtualBox     | 7.0.x            |
| OpenSSH Client | Windows built-in |

---

## Verify Git

```powershell
git --version
````

Expected:

```
git version 2.40 or later
```

Install if needed:

```
https://git-scm.com/download/win
```

---

## Verify Terraform

```powershell
terraform version
```

Expected:

```
Terraform v1.6.x
```

Download:

```
https://developer.hashicorp.com/terraform/downloads
```

---

## Verify VirtualBox

```powershell
"C:\Program Files\VirtualBox\VBoxManage.exe" --version
```

Expected:

```
7.x.x
```

Install from:

```
https://www.virtualbox.org/wiki/Downloads
```

Install the **Extension Pack** as well.

---

## Verify OpenSSH Client

```powershell
ssh -V
```

Expected:

```
OpenSSH_for_Windows
```

Install via:

```
Windows Settings → Optional Features → OpenSSH Client
```

---

# Task 2 — Clone the Training Repository

```bash
git clone https://github.com/TheSubtleArtist/myLinuxTraining
cd myLinuxTraining
```

---

# Task 3 — Create Repository Structure

Create directories:

```bash
mkdir automation
mkdir automation/terraform
mkdir automation/ansible
mkdir automation/kickstart

mkdir exercises
mkdir docs
```

---

# Task 4 — Create `.gitignore`

Create file:

```
.gitignore
```

Contents:

```gitignore
# Terraform state
*.tfstate
*.tfstate.*
.terraform/

# VirtualBox
*.vdi
*.vbox
*.log

# OS artifacts
*.iso

# Ansible retry files
*.retry

# Python
__pycache__/

# OS files
.DS_Store
Thumbs.db
```

Commit:

```bash
git add .
git commit -m "Initialize repository structure"
git push
```

---

# Task 5 — Configure VirtualBox PATH

Terraform provider relies on **VBoxManage**.

Ensure the VirtualBox directory is in your PATH.

Location:

```
C:\Program Files\VirtualBox\VBoxManage.exe
```

Add to Windows PATH:

```
C:\Program Files\VirtualBox
```

Verify:

```powershell
VBoxManage --version
```

---

# Task 6 — Download Rocky Linux ISO

Download:

```
Rocky-9.7-x86_64-minimal.iso
```

From:

```
https://rockylinux.org/download
```

Create directory:

```bash
mkdir automation/terraform/iso
```

Move the ISO into:

```
automation/terraform/iso/
```

---

# Task 7 — Configure VirtualBox Host-Only Network

Open:

```
VirtualBox → Tools → Network Manager
```

Create Host-Only Network.

Configure:

```
Adapter Name: vboxnet0
IPv4 Address: 192.168.56.1
Mask: 255.255.255.0
DHCP: Disabled
```

---

# Task 8 — Terraform Infrastructure

Navigate to:

```
automation/terraform
```

---

## Create `main.tf`

```hcl
terraform {

  required_version = "~> 1.6"

  required_providers {

    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2"
    }

  }

}

provider "virtualbox" {}
```

---

## Create `variables.tf`

```hcl
variable "vm_names" {

  type = list(string)

  default = [
    "controller",
    "server1",
    "server2"
  ]

}
```

---

## Create `vms.tf`

```hcl
resource "virtualbox_vm" "lab_vms" {

  count = length(var.vm_names)

  name = var.vm_names[count.index]

  cpus   = count.index == 0 ? 2 : 1
  memory = count.index == 0 ? "4096 mib" : "2048 mib"

  network_adapter {
    type = "nat"
  }

  network_adapter {
    type           = "hostonly"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }

}
```

---

# Task 9 — Initialize Terraform

```bash
cd automation/terraform
terraform init
```

---

# Task 10 — Create Virtual Machines

Plan:

```bash
terraform plan
```

Deploy:

```bash
terraform apply
```

Confirm:

```
yes
```

---

# Task 11 — Semi-Automated Installation of Controller VM

Start VM:

```
controller
```

Install Rocky Linux manually.

Use these settings.

Hostname:

```
controller
```

User:

```
student
```

Password:

```
student
```

Enable:

```
SSH server
```

---

# Task 12 — Configure Controller Network

Set static address.

Edit connection:

```bash
sudo nmtui
```

Set:

```
IP: 192.168.56.10
Mask: 255.255.255.0
Gateway: none
DNS: 1.1.1.1 8.8.8.8
```

Restart networking:

```bash
sudo systemctl restart NetworkManager
```

Verify:

```bash
ip a
```

---

# Task 13 — Enable Required Repositories

Install repositories.

```bash
sudo dnf config-manager --set-enabled crb
```

Install EPEL:

```bash
sudo dnf install -y epel-release
```

Verify repositories:

```bash
dnf repolist
```

Expected:

```
BaseOS
AppStream
CRB
EPEL
```

---

# Task 14 — Install Controller Tools

```bash
sudo dnf update -y
```

Install required packages:

```bash
sudo dnf install -y \
ansible-core \
git \
httpd \
python3-pip
```

---

Enable HTTP server:

```bash
sudo systemctl enable --now httpd
```

---

# Task 15 — Prepare Kickstart Web Server

Create directory:

```bash
sudo mkdir /var/www/html/kickstart
```

Set permissions:

```bash
sudo chmod -R 755 /var/www/html
```

---

Repository location:

```
automation/kickstart/
```

Kickstart files will later be copied to:

```
/var/www/html/kickstart
```

---

# Task 16 — Prepare Ansible Control Environment

Create directory:

```
automation/ansible
```

---

## Create Inventory

File:

```
automation/ansible/inventory.ini
```

Contents:

```ini
[servers]

server1 ansible_host=192.168.56.11
server2 ansible_host=192.168.56.12

[servers:vars]

ansible_user=student
```

---

# Task 17 — Initial Authentication Method

Bootstrap uses **password authentication**.

Steps:

1. Ansible connects using password
2. SSH keys are installed
3. Password authentication is later disabled

---

# Task 18 — Generate SSH Keys on Controller

Run on controller:

```bash
ssh-keygen
```

Accept defaults.

Keys generated:

```
~/.ssh/id_rsa
~/.ssh/id_rsa.pub
```

---

# Task 19 — Create Ansible Playbook to Distribute Keys

File:

```
automation/ansible/distribute_keys.yml
```

```yaml
---

- hosts: servers

  tasks:

  - name: Install SSH public key
    authorized_key:
      user: student
      state: present
      key: "{{ lookup('file', '~/.ssh/id_rsa.pub') }}"
```

---

Run playbook:

```bash
ansible-playbook \
-i inventory.ini \
distribute_keys.yml \
--ask-pass
```

---

# Task 20 — Verify SSH Login

Test:

```bash
ssh student@192.168.56.11
```

Login should occur **without password**.

---

# Task 21 — Disable Password SSH Authentication (Later Hardening)

Edit:

```
/etc/ssh/sshd_config
```

Set:

```
PasswordAuthentication no
```

Restart SSH:

```bash
sudo systemctl restart sshd
```

---

# Task 22 — Kickstart Installation for Server VMs

Once controller is running HTTP server:

Kickstart URL:

```
http://192.168.56.10/kickstart/server.ks
```

Boot options during installation:

```
inst.ks=http://192.168.56.10/kickstart/server.ks
```

This allows **fully automated installs** for:

```
server1
server2
```

---

# Result

Final environment contains:

```
1 Ansible control node
2 managed servers
```

Automation stack:

```
Terraform → Infrastructure
Kickstart → OS Deployment
Ansible → Configuration
```

This lab now supports **all Linux+ training exercises** and future automation exercises.

```
```

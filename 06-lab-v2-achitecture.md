# Linux+ XK0-006 Training Program - Section 2 — Lab Environment Architecture

- [Linux+ XK0-006 Training Program - Section 2 — Lab Environment Architecture](#linux-xk0-006-training-program---section-2--lab-environment-architecture)
  - [2.1 Design Goals](#21-design-goals)
  - [2.2 Lab Architecture Diagram](#22-lab-architecture-diagram)
  - [2.3 VM Design](#23-vm-design)
  - [2.4 Network Topology](#24-network-topology)
  - [2.5 Repository Structure](#25-repository-structure)
  - [2.6 Required Host Tools](#26-required-host-tools)
  - [2.7 Base Installation Steps](#27-base-installation-steps)
  - [2.8 Terraform Infrastructure Baseline](#28-terraform-infrastructure-baseline)
  - [2.9 Kickstart Workflow](#29-kickstart-workflow)
  - [2.10 Ansible Workflow](#210-ansible-workflow)
  - [2.11 Automation Workflow](#211-automation-workflow)
  - [2.12 Baseline Validation Checklist](#212-baseline-validation-checklist)

## 2.1 Design Goals

The lab environment supports full Linux+ XK0-006 coverage with repeatable provisioning and automation-first administration.

### Design Principles

* reproducible deployments
* infrastructure as code
* configuration as code
* isolated practice network
* low-cost desktop virtualization
* safe rollback and rebuild
* support for beginner and advanced labs
* support for multi-node service, security, and troubleshooting scenarios

---

## 2.2 Lab Architecture Diagram

```text
                              Internet
                                 |
                                NAT
                                 |
                -----------------------------------------
                |                    |                  |
           controller             server1            server2
         192.168.56.10         192.168.56.11      192.168.56.12
                |                    |                  |
                -----------------------------------------
                         Host-Only Network: 192.168.56.0/24
                             VirtualBox Host-Only: vboxnet0
```

---

## 2.3 VM Design

### Node Roles

| VM         | Primary Role         | Secondary Role                                           |
| ---------- | -------------------- | -------------------------------------------------------- |
| controller | Ansible control node | web server for Kickstart, Git workspace, package testing |
| server1    | managed server       | storage, service, container, security lab target         |
| server2    | managed server       | network, troubleshooting, cluster, backup lab target     |

### Minimum Resource Profile

| VM         | vCPU | RAM  | Disk                      | Notes                                          |
| ---------- | ---- | ---- | ------------------------- | ---------------------------------------------- |
| controller | 2    | 4 GB | 40 GB                     | automation tooling, HTTP server, Git workspace |
| server1    | 2    | 3 GB | 30 GB + optional lab disk | storage, container, security labs              |
| server2    | 2    | 3 GB | 30 GB + optional lab disk | service, network, troubleshooting labs         |

### Recommended Enhancements

| Enhancement                                          | Purpose                                          |
| ---------------------------------------------------- | ------------------------------------------------ |
| additional virtual disk on server1 and server2       | LVM, RAID, filesystem repair, mount labs         |
| snapshot baseline after initial build                | rapid rollback before destructive exercises      |
| optional fourth VM `client1`                         | NFS/SMB, LDAP, Kerberos, web access validation   |
| optional nested virtualization support on controller | KVM/libvirt labs                                 |
| optional internal DNS alias entries                  | local name resolution and service discovery labs |

---

## 2.4 Network Topology

### Address Plan

| Host       | Host-Only Address | NAT                  | Notes                            |
| ---------- | ----------------- | -------------------- | -------------------------------- |
| controller | 192.168.56.10/24  | DHCP via NAT adapter | management and provisioning node |
| server1    | 192.168.56.11/24  | DHCP via NAT adapter | managed target                   |
| server2    | 192.168.56.12/24  | DHCP via NAT adapter | managed target                   |

### Network Characteristics

| Component                    | Value                |
| ---------------------------- | -------------------- |
| Lab subnet                   | `192.168.56.0/24`    |
| Gateway on host-only network | none                 |
| DNS                          | `1.1.1.1`, `8.8.8.8` |
| Adapter 1                    | NAT                  |
| Adapter 2                    | Host-only            |
| DHCP on host-only            | disabled             |

### Host-Only Network Configuration

```text
Adapter Name: vboxnet0
IPv4 Address: 192.168.56.1
Mask: 255.255.255.0
DHCP: Disabled
```

---

## 2.5 Repository Structure

```text
myLinuxTraining/
│
├── automation/
│   ├── terraform/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── provider.tf
│   │   ├── network.tf
│   │   ├── vms.tf
│   │   └── iso/
│   │       └── Rocky-9.7-x86_64-minimal.iso
│   │
│   ├── kickstart/
│   │   ├── controller.ks
│   │   ├── server.ks
│   │   ├── post-install/
│   │   └── templates/
│   │
│   ├── ansible/
│   │   ├── inventory.ini
│   │   ├── ansible.cfg
│   │   ├── group_vars/
│   │   ├── host_vars/
│   │   ├── roles/
│   │   │   ├── common/
│   │   │   ├── ssh_hardening/
│   │   │   ├── storage_lab/
│   │   │   ├── webserver/
│   │   │   └── monitoring/
│   │   ├── playbooks/
│   │   │   ├── bootstrap.yml
│   │   │   ├── distribute_keys.yml
│   │   │   ├── install_tools.yml
│   │   │   └── baseline_hardening.yml
│   │   └── files/
│   │
├── exercises/
│   ├── module-01-foundations/
│   ├── module-02-boot-kernel-devices/
│   ├── module-03-storage-backup/
│   ├── module-04-networking/
│   ├── module-05-users-files-processes/
│   ├── module-06-software-services-systemd/
│   ├── module-07-security/
│   ├── module-08-containers-virtualization/
│   ├── module-09-automation-git-python/
│   ├── module-10-monitoring-troubleshooting/
│   ├── gap-coverage/
│   └── capstones/
│
├── docs/
│   ├── lab-build-guide.md
│   ├── instructor-notes.md
│   ├── troubleshooting-methodology.md
│   └── objective-crosswalk.md
│
├── .gitignore
├── README.md
└── LICENSE
```

---

## 2.6 Required Host Tools

| Tool                      | Version Guidance    | Purpose                             |
| ------------------------- | ------------------- | ----------------------------------- |
| Git                       | `>= 2.40`           | repository cloning and workflow     |
| Terraform                 | `1.6.x`             | VM provisioning                     |
| VirtualBox                | `7.0.x`             | desktop virtualization              |
| VirtualBox Extension Pack | matching VirtualBox | improved VirtualBox feature support |
| OpenSSH Client            | Windows built-in    | remote administration               |
| Optional: VS Code         | current stable      | editing YAML, shell, Terraform      |
| Optional: Python 3        | current stable      | tooling and scripting validation    |

### Verification Commands

```powershell
git --version
terraform version
"C:\Program Files\VirtualBox\VBoxManage.exe" --version
ssh -V
```

---

## 2.7 Base Installation Steps

### 2.7.1. Clone the Repository

```bash
git clone https://github.com/TheSubtleArtist/myLinuxTraining
cd myLinuxTraining
```

### 2.7.2. Create Required Directories

```bash
mkdir -p automation/terraform
mkdir -p automation/ansible
mkdir -p automation/kickstart
mkdir -p exercises
mkdir -p docs
```

### 2.7.3. Create `.gitignore`

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
.venv/

# OS files
.DS_Store
Thumbs.db
```

### 2.7.4. Add VirtualBox to PATH

```powershell
$env:Path += ";C:\Program Files\VirtualBox"
VBoxManage --version
```

### 2.7.5. Download Rocky Linux ISO

Place the image at:

```text
automation/terraform/iso/Rocky-9.7-x86_64-minimal.iso
```

### 2.7.6. Create Host-Only Network

Use VirtualBox Network Manager:

```text
Name: vboxnet0
IPv4: 192.168.56.1
Mask: 255.255.255.0
DHCP: Disabled
```

---

## 2.8 Terraform Infrastructure Baseline

### `provider.tf`

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

### `variables.tf`

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

### `vms.tf`

```hcl
resource "virtualbox_vm" "lab_vms" {
  count = length(var.vm_names)

  name   = var.vm_names[count.index]
  cpus   = count.index == 0 ? 2 : 2
  memory = count.index == 0 ? "4096 mib" : "3072 mib"

  network_adapter {
    type = "nat"
  }

  network_adapter {
    type           = "hostonly"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}
```

### Terraform Workflow

```bash
cd automation/terraform
terraform init
terraform plan
terraform apply
```

---

## 2.9 Kickstart Workflow

### Controller Preparation

Install required tooling on `controller`:

```bash
sudo dnf update -y
sudo dnf config-manager --set-enabled crb
sudo dnf install -y epel-release
sudo dnf install -y ansible-core git httpd python3-pip
sudo systemctl enable --now httpd
sudo mkdir -p /var/www/html/kickstart
sudo chmod -R 755 /var/www/html
```

### Kickstart Delivery

Copy Kickstart files to the web root:

```bash
sudo cp automation/kickstart/*.ks /var/www/html/kickstart/
```

### Automated Server Installation

Boot `server1` and `server2` with:

```text
inst.ks=http://192.168.56.10/kickstart/server.ks
```

---

## 2.10 Ansible Workflow

### Inventory

```ini
[controller]
controller ansible_host=192.168.56.10

[servers]
server1 ansible_host=192.168.56.11
server2 ansible_host=192.168.56.12

[all:vars]
ansible_user=student
```

### SSH Key Bootstrap

Generate keys on `controller`:

```bash
ssh-keygen
```

### Playbook to Distribute Keys

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

Run the playbook:

```bash
ansible-playbook -i inventory.ini distribute_keys.yml --ask-pass
```

---

## 2.11 Automation Workflow

```text
Terraform
  -> creates VM infrastructure
Kickstart
  -> installs Rocky Linux with predefined settings
Ansible
  -> configures users, keys, packages, services, and lab roles
Git
  -> tracks all infrastructure, playbooks, exercises, and documentation
```

### Workflow Stages

| Stage     | Tool         | Output                                 |
| --------- | ------------ | -------------------------------------- |
| provision | Terraform    | three-node VM topology                 |
| install   | Kickstart    | repeatable Rocky Linux installations   |
| configure | Ansible      | baseline packages, SSH keys, lab roles |
| validate  | Bash/Ansible | host reachability and service checks   |
| iterate   | Git          | versioned infrastructure and content   |

---

## 2.12 Baseline Validation Checklist

```bash
hostnamectl
ip a
ip route
ping -c 2 192.168.56.11
ping -c 2 192.168.56.12
ping -c 2 8.8.8.8
ssh student@192.168.56.11
ansible -i automation/ansible/inventory.ini servers -m ping
```

---
# Linux+ XK0-006 Training Program - Section 2 — Lab Environment Architecture

- [Linux+ XK0-006 Training Program - Section 2 — Lab Environment Architecture](#linux-xk0-006-training-program---section-2--lab-environment-architecture)
  - [2.1 Design Goals](#21-design-goals)
  - [2.2 Lab Architecture Diagram](#22-lab-architecture-diagram)
  - [2.3 VM Design](#23-vm-design)
  - [2.4 Network Topology](#24-network-topology)
  - [2.5 Repository Structure](#25-repository-structure)
  - [2.6 Required Host Tools](#26-required-host-tools)
  - [2.7 Base Installation Steps](#27-base-installation-steps)
  - [2.8 Vagrant Provisioning Baseline](#28-vagrant-provisioning-baseline)
  - [2.10 Ansible Workflow](#210-ansible-workflow)
  - [2.12 Baseline Validation Checklist](#212-baseline-validation-checklist)

## 2.1 Design Goals

### Design Principles

- reproducible deployments
- version-controlled infrastructure provisioning
- configuration as code
- isolated practice network
- low-cost desktop virtualization
- safe rollback and rebuild
- support for beginner and advanced labs
- support for multi-node service, security, and troubleshooting scenarios

### Standard Lifecycle Vocabulary

Use the following lifecycle terminology consistently throughout the lab architecture, build guide, exercises, and instructor notes:

```text
prepare -> provision -> install -> configure -> validate -> snapshot -> rebuild
````

This lifecycle defines the standard vocabulary for the lab:

  * **prepare** — verify tools, create directories, place installation media, and confirm host networking
  * **provision** — define and start VMs with Vagrant and the VirtualBox provider
  * **install** — complete the controller install flow, then install remaining nodes through Kickstart
  * **configure** — apply baseline settings and automation with Ansible
  * **validate** — confirm connectivity, service state, access, and automation readiness
  * **snapshot** — create a stable rollback point in the VirtualBox GUI
  * **rebuild** — reprovision, reinstall, reconfigure, and revalidate a node after failure or break/fix work

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
```

The architecture uses a three-node Rocky Linux lab on VirtualBox. Vagrant manages VM definition and startup with the VirtualBox provider. The `controller` node serves as the Ansible control node and the Kickstart web server. `server1` and `server2` act as managed targets for storage, networking, security, services, monitoring, and troubleshooting exercises.

Capstone scenarios occur after the module sequence and use this same environment for fault injection, recovery, validation, and rebuild workflows.

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

| Enhancement                                          | Purpose                                             |
| ---------------------------------------------------- | --------------------------------------------------- |
| additional virtual disk on server1 and server2       | LVM, RAID, filesystem repair, mount labs            |
| snapshot baseline after initial build                | rapid rollback before destructive exercises         |
| optional fourth VM `client1`                         | NFS/SMB, LDAP, Kerberos, web access validation labs |
| optional nested virtualization support on controller | KVM/libvirt labs in advanced extension work         |
| optional internal DNS alias entries                  | local name resolution and service discovery labs    |

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

### Host-Only Network Configuration Standard

Use the following instruction wherever the lab refers to the host-only network:

```text
Select the VirtualBox host-only adapter that is configured with IPv4 192.168.56.1/24 and DHCP disabled.
Do not rely on the adapter display number alone.
```

### Host-Only Network Validation Criteria

```text
IPv4 Address: 192.168.56.1
Mask: 255.255.255.0
DHCP: Disabled
Purpose: lab host-only segment for 192.168.56.0/24
```
---

## 2.5 Repository Structure

```text
myLinuxTraining/
│
├── automation/
│   ├── vagrant/
│   │   ├── Vagrantfile
│   │   ├── variables.env
│   │   ├── provisioning-hooks/
│   │   ├── synced-folders.md
│   │   └── README.md
│   │
│   ├── iso/
│   │   └── Rocky-9.7-x86_64-minimal.iso
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
│   ├── module-11-advanced-platform-storage/
│   ├── module-12-advanced-network-identity-security/
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

### Fixed Local ISO Path Standard



```text
myLinuxTraining/automation/iso/Rocky-9.7-x86_64-minimal.iso
```

---

## 2.6 Required Host Tools

| Tool                      | Version Guidance    | Purpose                                         |
| ------------------------- | ------------------- | ----------------------------------------------- |
| Git                       | `>= 2.40`           | repository cloning and workflow                 |
| Vagrant                   | current stable      | primary VM provisioning and startup             |
| VirtualBox                | `7.0.x` or later    | desktop virtualization platform                 |
| VirtualBox Extension Pack | matching VirtualBox | feature compatibility                           |
| OpenSSH Client            | Windows built-in    | remote administration                           |
| VS Code                   | current stable      | editing Markdown, YAML, shell, and config files |
| Python 3                  | current stable      | tooling, helper scripts, and validation support |
| Git Bash                  | current stable      | host shell environment                          |

### Verification Commands

```powershell
git --version
vagrant --version
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" --version
ssh -V
python --version
bash --version
code --version
```

### Tooling Expectations

The host environment must support:

* Vagrant with the VirtualBox provider
* a working VirtualBox GUI for snapshot management
* a fixed local path for the Rocky Linux ISO
* Git-based version tracking for provisioning and automation content

The accepted tool stack for the program is consistent throughout the document set:

* VirtualBox
* Vagrant
* Kickstart
* Ansible
* Git

---

## 2.7 Base Installation Steps

### 2.7.1 Clone the Repository

### 2.7.2 Create Required Directories

### 2.7.3 Create `.gitignore`

```gitignore
# Vagrant
.vagrant/

# VirtualBox
*.vdi
*.vbox
*.vbox-prev
*.log

# ISO
*.iso

# Ansible retry files
*.retry

# Python
__pycache__/
.venv/

# Temporary files
*.tmp
*.out

# OS files
.DS_Store
Thumbs.db
```

### 2.7.4 Place the Rocky Linux ISO

Copy the Rocky Linux 9.7 installation media to:

```text
automation/iso/Rocky-9.7-x86_64-minimal.iso
```

### 2.7.5 Verify the Host-Only Adapter

Confirm that the selected VirtualBox host-only adapter matches the accepted lab standard:

```text
IPv4 Address: 192.168.56.1
Mask: 255.255.255.0
DHCP: Disabled
```

### 2.7.6 Verify Vagrant and VirtualBox Integration

From the repository root, confirm that Vagrant and VirtualBox are available and compatible before defining the lab.

---

## 2.8 Vagrant Provisioning Baseline

The lab uses **Vagrant with the VirtualBox provider** as the only provisioning path. Vagrant is responsible for:

* VM definition and startup
* network declarations
* synced folders
* shell provisioning hooks

Kickstart remains responsible for installation automation, and Ansible remains responsible for configuration automation.

### Provisioning Goals

* create a repeatable three-node topology
* keep VM definitions under version control
* separate VM provisioning from guest configuration
* preserve rebuild and rollback capability
* support repeatable baseline creation before destructive labs

### Single `Vagrantfile` Standard

Use one `Vagrantfile` defining:

* `controller`
* `server1`
* `server2`

### Example Variable File

```bash
ISO_PATH="./automation/iso/Rocky-9.7-x86_64-minimal.iso"
HOSTONLY_IP="192.168.56.1"
CONTROLLER_NAME="controller"
SERVER1_NAME="server1"
SERVER2_NAME="server2"
CONTROLLER_RAM=4096
SERVER_RAM=3072
CPU_COUNT=2
CONTROLLER_DISK_MB=40960
SERVER_DISK_MB=30720
SYNCED_FOLDER_HOST="./"
SYNCED_FOLDER_GUEST="/vagrant"
```

### Example `Vagrantfile` Structure

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "generic/rocky9"
  config.vm.synced_folder ".", "/vagrant", disabled: false

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 2
  end

  config.vm.define "controller" do |controller|
    controller.vm.hostname = "controller"
    controller.vm.network "private_network", ip: "192.168.56.10"
    controller.vm.network "public_network", bridge: nil
    controller.vm.provider "virtualbox" do |vb|
      vb.name = "controller"
      vb.memory = 4096
    end
    controller.vm.provision "shell", inline: <<-SHELL
      echo "Controller shell provisioning hook executed."
    SHELL
  end

  config.vm.define "server1" do |server1|
    server1.vm.hostname = "server1"
    server1.vm.network "private_network", ip: "192.168.56.11"
    server1.vm.network "public_network", bridge: nil
    server1.vm.provider "virtualbox" do |vb|
      vb.name = "server1"
      vb.memory = 3072
    end
    server1.vm.provision "shell", inline: <<-SHELL
      echo "Server1 shell provisioning hook executed."
    SHELL
  end

  config.vm.define "server2" do |server2|
    server2.vm.hostname = "server2"
    server2.vm.network "private_network", ip: "192.168.56.12"
    server2.vm.network "public_network", bridge: nil
    server2.vm.provider "virtualbox" do |vb|
      vb.name = "server2"
      vb.memory = 3072
    end
    server2.vm.provision "shell", inline: <<-SHELL
      echo "Server2 shell provisioning hook executed."
    SHELL
  end
end
```

### Provisioning Workflow

```bash
cd automation/vagrant
vagrant up
vagrant status
```

### Provisioning Responsibilities

* Vagrant defines the VM topology and starts the nodes
* VirtualBox provides the hypervisor platform and GUI snapshot support
* the controller installation establishes the first usable automation node
* the remaining nodes are installed through the accepted Kickstart workflow
* configuration and state convergence are handled by Ansible after installation

### Controller Installation Standard

The curriculum assumes a generic Rocky Linux base box, followed by a manual installer flow for `controller`. After `controller` is established, it serves Kickstart content for `server1` and `server2`.

This preserves the controller-first build strategy:

1. define the VMs with Vagrant
2. establish the controller node
3. serve Kickstart from controller
4. install remaining nodes
5. configure all nodes with Ansible

---

## 2.10 Ansible Workflow



### Configuration Scope

Ansible is responsible for:

* SSH key generation and distribution
* baseline package installation
* service enablement
* host configuration standardization
* repeatable role-driven configuration
* post-rebuild recovery

---

[Inventory Playbook]()

```

## 2.11 Automation Workflow

```text
Vagrant
  -> defines and starts VM infrastructure through the VirtualBox provider
Kickstart
  -> installs Rocky Linux with predefined settings
Ansible
  -> configures users, keys, packages, services, and lab roles
Git
  -> tracks all provisioning files, playbooks, exercises, and documentation
```

### Workflow Stages

| Stage     | Tool                      | Output                                  |
| --------- | ------------------------- | --------------------------------------- |
| prepare   | Git, host tools           | repository, ISO, verified prerequisites |
| provision | Vagrant                   | three-node VM topology                  |
| install   | Kickstart                 | repeatable Rocky Linux installations    |
| configure | Ansible                   | baseline packages, SSH keys, lab roles  |
| validate  | Bash/Ansible              | host reachability and service checks    |
| snapshot  | VirtualBox GUI            | stable rollback point                   |
| rebuild   | Vagrant/Kickstart/Ansible | recovered and revalidated node          |

### Operational Expectations

* provisioning changes are tracked in Git
* installation changes are captured in Kickstart files
* configuration changes are captured in Ansible roles and playbooks
* rollback is performed through VirtualBox GUI snapshots
* rebuilds must follow the full lifecycle instead of ad hoc recovery

The accepted automation tool stack is identical throughout the program:

* VirtualBox
* Vagrant
* Kickstart
* Ansible
* Git

---

## 2.12 Baseline Validation Checklist

Run the following checks after provisioning, installation, and configuration:

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

### Validation Objectives

Confirm that:

* each host has the expected identity and address
* host-only connectivity works across nodes
* NAT-based outbound access functions
* SSH access is operational
* Ansible can reach managed nodes
* the environment is ready for module exercises

### Snapshot Standard

After baseline validation is complete, create a VirtualBox GUI snapshot for each node. Use snapshots before destructive exercises and preserve at least one known-good baseline for rebuild and incident recovery work.

### Capstone Support Statement

After the module sequence is complete, capstone scenarios use the same validated environment for service restoration, troubleshooting, security review, and rebuild exercises. This preserves a single source-of-truth lab architecture across the full 12-module program and the capstone phase.

```



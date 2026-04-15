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
  - [2.11 Controller Bootstrap Model](#211-controller-bootstrap-model)
  - [2.12 SSH Trust and Access Model](#212-ssh-trust-and-access-model)
  - [2.13 Baseline Validation Checklist](#213-baseline-validation-checklist)

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

The architecture uses a three-node Rocky Linux lab on VirtualBox. Vagrant manages VM definition and startup with the VirtualBox provider. The `controller` node also serves as the Ansible control node. Hosts `server1` and `server2` act as managed targets for storage, networking, security, services, monitoring, and troubleshooting exercises.

Capstone scenarios occur after the module sequence and use this same environment for fault injection, recovery, validation, and rebuild workflows.

---

## 2.3 VM Design

### Node Roles

| VM         | Primary Role         | Secondary Role                                           |
| ---------- | -------------------- | -------------------------------------------------------- |
| controller | Ansible control node | Git workspace, package testing                           |
| server1    | managed server       | storage, service, container, security lab target         |
| server2    | managed server       | network, troubleshooting, cluster, backup lab target     |

### Minimum Resource Profile

| VM         | vCPU | RAM  | Disk                      | Notes                                          |
| ---------- | ---- | ---- | ------------------------- | ---------------------------------------------- |
| controller | 2    | 4 GB | 40 GB                     | automation tooling, Git workspace              |
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

### 2.7.5 Verify the Host-Only Adapter

Confirm that the selected VirtualBox host-only adapter matches the accepted lab standard:

```text
IPv4 Address: 192.168.56.1
Mask: 255.255.255.0
DHCP: Disabled
```

---

## 2.8 Vagrant Provisioning Baseline

The lab uses **Vagrant with the VirtualBox provider** as the only provisioning path. Vagrant is responsible for:

* VM definition and startup
* network declarations
* synced folders
* shell provisioning hooks

### Provisioning Goals

* create a repeatable three-node topology
* keep VM definitions under version control
* separate VM provisioning from guest configuration
* preserve rebuild and rollback capability
* support repeatable baseline creation before destructive labs

### Provisioning Responsibilities

* Vagrant defines the VM topology and starts the nodes
* VirtualBox provides the hypervisor platform and GUI snapshot support
* the controller installation establishes the first usable automation node
* the remaining nodes are installed through the accepted Kickstart workflow
* configuration and state convergence are handled by Ansible after installation

### Single `Vagrantfile` Standard

Use one `Vagrantfile` defining:

* `controller`
* `server1`
* `server2`

View the [Vagrant File](https://github.com/TheSubtleArtist/myLinuxTraining/blob/main/automation/vagrant/Vagrantfile)

---

Below is a git-ready Markdown replacement for the affected architecture sections. It updates the execution model, clarifies bootstrap versus steady-state operations, and makes the SSH trust model explicit. It is written to align with the architecture you originally intended, while correcting the ambiguity that led to the later implementation issues.

````markdown
## 2.10 Ansible Workflow

### Configuration Scope

Ansible is responsible for:

* controller bootstrap and control-node preparation
* SSH key generation and distribution
* baseline package installation
* service enablement
* host configuration standardization
* repeatable role-driven configuration
* post-rebuild recovery
* validation of managed host readiness

---

### Control Node and Automation Execution Model

The lab uses a **split control model**:

* the **Windows host** is responsible for infrastructure provisioning and VM lifecycle management
* the **controller VM** is responsible for guest configuration and ongoing automation

This means the Windows host runs:

* Vagrant
* VirtualBox
* Git
* VS Code
* supporting host-side tooling

This also means the controller VM runs:

* Ansible
* inventory and playbooks
* SSH client operations for in-lab automation
* configuration and validation workflows against managed nodes

Under normal lab operation, **Ansible playbooks are executed from within the controller VM**. The Windows host does **not** serve as the steady-state Ansible control node.

---

### Automation Workflow

```text
Windows Host
  -> uses Vagrant and VirtualBox to define, start, stop, destroy, and recover lab infrastructure

controller VM
  -> serves as the Ansible control node
  -> executes playbooks locally and against managed hosts
  -> stores the private SSH key used for in-lab automation

server1 / server2
  -> act as managed nodes
  -> trust the controller through the installed public key
````

---

### Workflow Stages

| Stage     | Tool                      | Output                                                 |
| --------- | ------------------------- | ------------------------------------------------------ |
| prepare   | Git, host tools           | repository, ISO, verified prerequisites                |
| provision | Vagrant                   | three-node VM topology                                 |
| install   | Rocky Linux / Kickstart   | installed controller and managed nodes                 |
| configure | Ansible                   | controller bootstrap, users, keys, packages, baseline  |
| validate  | Ansible / Bash            | reachability, SSH trust, package state, host readiness |
| snapshot  | VirtualBox GUI            | stable rollback point                                  |
| rebuild   | Vagrant/Kickstart/Ansible | recovered and revalidated node                         |

---

### Playbook Execution Model

The Ansible workflow is intentionally separated into distinct playbooks so that bootstrap, configuration, and validation remain clear and maintainable.

Recommended playbook sequence:

| Playbook                      | Purpose                                                                                                           |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `bootstrap_controller.yml`    | prepares the controller to act as the Ansible control node                                                        |
| `configure_managed_hosts.yml` | creates users, prepares SSH directories, distributes public keys, and installs baseline packages on managed nodes |
| `validate_managed_hosts.yml`  | verifies that managed nodes meet the expected baseline state                                                      |

This split prevents circular dependencies and keeps local controller preparation separate from remote host configuration.

---

### Inventory Design Standard

The steady-state Ansible inventory is written for **controller-based execution**.

This means:

* the inventory defines the managed hosts that the controller will reach over SSH
* the inventory does not use Windows host paths for SSH private keys
* the inventory does not rely on Vagrant bootstrap credentials for normal automation
* the controller is not treated as a normal remote SSH target during steady-state operations

For controller-local tasks, Ansible should use `connection: local` instead of SSHing back into the controller.

---

### Operational Expectations

* provisioning changes are tracked in Git
* installation changes are captured in Kickstart files
* controller bootstrap changes are captured in Ansible bootstrap playbooks
* managed host changes are captured in Ansible configuration playbooks and roles
* validation changes are captured in dedicated validation playbooks
* rollback is performed through VirtualBox GUI snapshots
* rebuilds must follow the full lifecycle instead of ad hoc recovery

The accepted automation tool stack is identical throughout the program:

* VirtualBox
* Vagrant
* Ansible
* Git

---

## 2.11 Controller Bootstrap Model

The `controller` VM is the permanent Ansible control node for the lab. Before it can manage `server1` and `server2`, it must be prepared locally.

This preparation is called **controller bootstrap**.

Controller bootstrap is performed by running a dedicated playbook locally on the controller VM. The purpose of this playbook is to convert a newly provisioned Linux VM into a usable automation node.

### Controller Bootstrap Responsibilities

A controller bootstrap playbook is responsible for tasks such as:

* creating the automation user identities required for the lab
* generating the SSH keypair used for controller-to-managed-host access
* setting correct ownership and permissions on SSH material
* installing Ansible and required supporting packages
* preparing the controller for later inventory- and role-based automation

### Controller Bootstrap Execution Rule

Run the controller bootstrap playbook:

* from within the `controller` VM
* using `connection: local`
* before attempting to configure managed hosts

This prevents Ansible from attempting to SSH into the controller using external Vagrant credentials during steady-state operation.

### Controller Bootstrap Outcome

After successful bootstrap:

* the controller contains the automation private key
* the controller can execute Ansible playbooks locally
* the controller is ready to distribute its public key to managed hosts
* the lab is ready to proceed to managed-host configuration

---

## 2.12 SSH Trust and Access Model

The lab uses two distinct SSH access models:

1. **bootstrap access**
2. **steady-state automation access**

These must not be confused.

### Bootstrap Access

Bootstrap access is the temporary access path used to reach the VMs immediately after Vagrant provisioning.

Bootstrap access characteristics:

* originates from the Windows host
* uses Vagrant-managed SSH settings and keys
* exists to allow the operator to reach the controller for initial setup
* is not the long-term automation trust model for the lab

### Steady-State Automation Access

Steady-state automation access is the long-term SSH trust relationship used inside the lab after the controller has been bootstrapped.

Steady-state access characteristics:

* originates from the `controller` VM
* uses the controller's locally stored private key
* targets `server1` and `server2`
* is the normal trust model for Ansible-managed operations

### SSH Trust Model Standard

The accepted SSH trust model for the lab is:

* the controller generates the automation SSH keypair
* the **private key remains on the controller**
* the **public key is distributed to managed hosts**
* managed hosts accept controller-initiated SSH connections using that public key

The private key must **not** be copied to managed hosts.

### Trust Establishment Sequence

```text
Windows host
  -> provisions VMs with Vagrant
  -> connects to controller for initial access

controller
  -> bootstraps itself locally
  -> generates automation SSH keypair
  -> distributes public key to managed hosts

server1 / server2
  -> receive the controller public key
  -> allow SSH access from the controller
```

### Security and Operational Expectations

* Vagrant bootstrap keys are used only for initial VM access
* Vagrant bootstrap keys are not used as the normal steady-state automation credential
* the controller private key is treated as control-node authentication material
* managed hosts store only the public key in `authorized_keys`
* private key permissions on the controller must remain restricted

This model preserves a clear trust boundary between the host provisioning layer and the in-lab automation layer.

---

## 2.13 Baseline Validation Checklist

Run the following checks after controller bootstrap and managed-host configuration:

```bash
hostnamectl
ip a
ip route
ping -c 2 192.168.56.11
ping -c 2 192.168.56.12
ping -c 2 8.8.8.8
ssh student@192.168.56.11
ansible -i inventory.yml servers -m ping
ansible-playbook -i inventory.yml validate_managed_hosts.yml
```

### Validation Objectives

Confirm that:

* each host has the expected identity and address
* host-only connectivity works across nodes
* NAT-based outbound access functions
* the controller can SSH to managed hosts using the intended automation identity
* Ansible can reach managed hosts from the controller
* managed hosts have the expected baseline users, SSH trust, and package state
* the environment is ready for module exercises

### Snapshot Standard

After baseline validation is complete, create a VirtualBox GUI snapshot for each node. Use snapshots before destructive exercises and preserve at least one known-good baseline for rebuild and incident recovery work.

### Capstone Support Statement

After the module sequence is complete, capstone scenarios use the same validated environment for service restoration, troubleshooting, security review, and rebuild exercises. This preserves a single source-of-truth lab architecture across the full 12-module program and the capstone phase.

```

The next update I would make after this is the repository structure section, so it explicitly includes `bootstrap_controller.yml`, `configure_managed_hosts.yml`, and `validate_managed_hosts.yml`.
```

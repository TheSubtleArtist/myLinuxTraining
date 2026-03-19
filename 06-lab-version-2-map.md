# Linux+ XK0-006 Training Program - Course Map

## Repository Purpose

This document defines a complete, hands-on Linux+ XK0-006 training curriculum for junior Linux administrators. It is structured for direct inclusion in a GitHub repository and is designed to support:

* certification preparation
* enterprise Linux administration practice
* automation-first operations
* security-first administration
* reproducible lab delivery
* progressive troubleshooting skill development

---

# Section 1 — Refined Linux+ Objective Map

## Training Module Overview

| Module | Module Name                                             | Primary Linux+ Domains       |
| ------ | ------------------------------------------------------- | ---------------------------- |
| 1      | Linux Foundations and System Architecture               | 1.1, 1.5                     |
| 2      | Device, Boot, and Kernel Management                     | 1.1, 1.2, 2.5                |
| 3      | Storage, Filesystems, and Data Protection               | 1.3, 1.6                     |
| 4      | Networking and Host Connectivity                        | 1.4                          |
| 5      | Files, Users, Permissions, and Process Control          | 2.1, 2.2, 2.3                |
| 6      | Software, Services, and systemd Operations              | 2.4, 2.5                     |
| 7      | Security, Identity, and Compliance                      | 3.1, 3.2, 3.3, 3.4, 3.5, 3.6 |
| 8      | Containers and Virtualization                           | 1.7, 2.6                     |
| 9      | Automation, Git, Python, and AI-Assisted Administration | 4.1, 4.2, 4.3, 4.4, 4.5      |
| 10     | Monitoring, Performance, and Troubleshooting            | 5.1, 5.2, 5.3, 5.4, 5.5      |

---

## Module 1 — Linux Foundations and System Architecture

### Module Description

Introduces Linux operating concepts, shell usage, distribution families, filesystem hierarchy, licensing, shell environments, and common command-line utilities. Establishes the baseline required for all later modules.

### Covered Linux+ Exam Objectives

* **1.1** Explain Basic Linux Concepts

  * boot process overview
  * FHS
  * server architectures
  * distributions
  * GUI stack concepts
  * licensing
* **1.5** Manage a Linux system using common shell operations

  * environment variables
  * shell startup files
  * paths
  * redirection and pipelines
  * common text processing tools
  * text editors

### Key Skills Developed

* identify platform and distribution details
* navigate the Linux filesystem confidently
* interpret shell environments and profile files
* process text from system files and command output
* use shell history, aliases, variables, and redirection
* edit configuration files with terminal editors

---

## Module 2 — Device, Boot, and Kernel Management

### Module Description

Covers Linux boot concepts, initrd/initramfs handling, kernel modules, system hardware discovery, boot-time troubleshooting, and system initialization analysis.

### Covered Linux+ Exam Objectives

* **1.1** Basic boot process

  * bootloader
  * configuration files
  * kernel parameters
  * initrd
  * PXE
* **1.2** Device management concepts and tools

  * kernel modules
  * hardware discovery tools
  * initrd management
  * custom hardware use cases
* **2.5** systemd utilities

  * `systemd-analyze`
  * `systemd-blame`
  * `sysctl`

### Key Skills Developed

* explain Linux boot stages and related artifacts
* inspect and tune kernel parameters
* manage modules with `modprobe`, `insmod`, `rmmod`, and `depmod`
* inspect CPU, memory, PCI, USB, and platform details
* analyze boot performance and kernel logs
* understand device initialization and driver loading

---

## Module 3 — Storage, Filesystems, and Data Protection

### Module Description

Builds practical skill in partitioning, filesystems, mount management, LVM, RAID, filesystem repair, archiving, compression, backup, restore, and storage troubleshooting.

### Covered Linux+ Exam Objectives

* **1.3** Manage storage in a Linux system

  * partitions
  * filesystems
  * RAID
  * LVM
  * mounted storage
  * network mounts
  * inode concepts
* **1.6** Backup and restore operations

  * archiving
  * compression
  * `dd`, `ddrescue`, `rsync`, `unzip`
  * compressed-file inspection tools

### Key Skills Developed

* inspect disks, partitions, UUIDs, and filesystems
* create and manage LVM resources
* build and inspect software RAID
* mount local and network storage safely
* repair and resize ext4 and XFS filesystems
* create and restore archives and synchronized backups

---

## Module 4 — Networking and Host Connectivity

### Module Description

Covers interface configuration, name resolution, routing, network diagnostics, packet analysis, NetworkManager, Netplan awareness, and service reachability validation.

### Covered Linux+ Exam Objectives

* **1.4** Manage network services and configurations

  * `/etc/hosts`, `/etc/resolv.conf`, `/etc/nsswitch.conf`
  * NetworkManager
  * Netplan
  * network troubleshooting utilities

### Key Skills Developed

* inspect and configure interfaces and routes
* validate DNS and host resolution order
* use `nmcli` and configuration files for persistent network changes
* capture and interpret traffic with `tcpdump`
* test reachability, ports, throughput, and path quality
* diagnose routing, MTU, DNS, DHCP, and firewall-related issues

---

## Module 5 — Files, Users, Permissions, and Process Control

### Module Description

Focuses on day-to-day Linux administration for files, directories, accounts, groups, permissions, ACLs, jobs, scheduling, process inspection, and resource management.

### Covered Linux+ Exam Objectives

* **2.1** Manage files and directories
* **2.2** Perform local account management
* **2.3** Manage processes and jobs

### Key Skills Developed

* manipulate files, directories, and links
* create and manage users, groups, shells, and account aging
* interpret `/etc/passwd`, `/etc/shadow`, and `/etc/group`
* control process life cycle and priorities
* use job control and scheduling utilities
* inspect `/proc`, open files, and resource consumers

---

## Module 6 — Software, Services, and systemd Operations

### Module Description

Covers package management, repositories, service deployment, unit management, logging, timers, target control, and common infrastructure services.

### Covered Linux+ Exam Objectives

* **2.4** Configure and manage software

  * package operations
  * repositories
  * third-party repositories
  * signatures
  * language package managers
  * sandboxed apps
  * common services
* **2.5** Manage Linux using systemd

  * units
  * utilities
  * state management

### Key Skills Developed

* install, update, verify, and remove software
* manage repositories and GPG trust
* administer services with `systemctl`
* create and troubleshoot systemd units and timers
* inspect service logs and boot targets
* deploy common network services safely

---

## Module 7 — Security, Identity, and Compliance

### Module Description

Provides a security-first administration path across AAA, PAM, firewalls, hardening, SSH, SELinux, sudo, encryption, auditing, vulnerability management, and compliance tooling.

### Covered Linux+ Exam Objectives

* **3.1** Authorization, authentication, accounting
* **3.2** Firewalls
* **3.3** OS hardening
* **3.4** Account hardening
* **3.5** Cryptographic concepts and technologies
* **3.6** Compliance and audit procedures

### Key Skills Developed

* manage sudo, SSH, PAM, and identity integrations
* enforce host firewall policy with `firewalld`, `ufw`, and `nftables`
* apply SELinux labels, booleans, and policy troubleshooting
* harden accounts, services, and remote access
* use GPG, OpenSSL, WireGuard, and LUKS concepts
* validate package/file integrity and compliance posture

---

## Module 8 — Containers and Virtualization

### Module Description

Introduces virtualization and container administration, including KVM/libvirt tooling, disk images, snapshots, Podman/Docker operations, images, networks, volumes, and security boundaries.

### Covered Linux+ Exam Objectives

* **1.7** Summarize virtualization on Linux systems
* **2.6** Manage containers on Linux

### Key Skills Developed

* understand hypervisor and VM deployment models
* work with `virsh`, libvirt, image formats, and snapshots
* run and inspect containers
* build images with Dockerfiles/Containerfiles
* manage container networks and volumes
* distinguish privileged and unprivileged container behavior

---

## Module 9 — Automation, Git, Python, and AI-Assisted Administration

### Module Description

Builds automation fluency through shell scripting, Ansible, Terraform concepts, cloud-init, Git workflows, Python basics, and responsible AI-assisted operations.

### Covered Linux+ Exam Objectives

* **4.1** Automation and orchestration
* **4.2** Shell scripting
* **4.3** Python basics
* **4.4** Git
* **4.5** AI best practices

### Key Skills Developed

* automate recurring administration tasks
* manage infrastructure and configuration as code
* write maintainable shell scripts
* use Python virtual environments and dependencies
* use Git for branching, merging, and release tagging
* apply human-reviewed AI-assisted workflows safely

---

## Module 10 — Monitoring, Performance, and Troubleshooting

### Module Description

Applies monitoring concepts and systematic troubleshooting across hardware, storage, networking, security, and performance scenarios.

### Covered Linux+ Exam Objectives

* **5.1** Monitoring concepts and configurations
* **5.2** Troubleshoot hardware, storage, and OS issues
* **5.3** Troubleshoot networking issues
* **5.4** Troubleshoot security issues
* **5.5** Troubleshoot performance issues

### Key Skills Developed

* interpret logs, metrics, and baselines
* diagnose service, storage, and boot failures
* isolate network and firewall problems
* identify SELinux, ACL, and certificate issues
* analyze CPU, memory, I/O, and latency symptoms
* use evidence-driven remediation workflows

---
# Prompt 

## Role

You are a linux system engineer with subject matter expertise level knowledge and experience. Among your duties is the mentorship of junior linux system administrators as they progress.  

## Context

A peer has request you review their recent work. Your team has on-boarded a number of new system administrators who require certification. your peer has built a set of exercises to support the training and certification of these new team members.

## General Expectations

Render all output in raw markdown, enabling that output to be copied and pasted into a github document.  

## Input 1: CompTia Linux+ Exam Objectives

1.0 System Management
1.1 Explain Basic Linux Concepts
Basic Boot Process
 • Bootloader
 • Configuration files
 • Kernel parameters
 • Initial RAM disk (initrd)
 • Preboot Execution Environment (PXE)
Filesystem Hierarchy Standard (FHS)
 • /
 • /bin
 • /boot
 • /dev
 • /etc
 • /home
 • /lib
 • /proc
 • /sbin
 • /tmp
 • /usr
 • /var
Server Architectures
 • AArch64
 • RISC-V
 • x86
 • x86_64 / AMD64
Linux Distributions
 • RPM-based
 • dpkg-based
Graphical User Interface (GUI)
 • Display managers
 • Window managers
 • X Server
 • Wayland
Software Licensing
 • Open-source software
 • Free software
 • Proprietary software
 • Copyleft
1.2 Summarize Linux Device Management Concepts and Tools
Kernel Modules
 • depmod
 • insmod
 • lsmod
 • modinfo
 • modprobe
 • rmmod
Device Management
 • dmesg
 • dmidecode
 • ipmitool
 • lm_sensors
 • lscpu
 • lshw
 • lsmem
 • lspci
 • lsusb
initrd Management
 • dracut
 • mkinitrd
Custom Hardware
 • Embedded systems
 • GPU use cases
 • nvtop
1.3 Given a Scenario, Manage Storage in a Linux System
Logical Volume Manager (LVM)
Logical Volumes
 • lvchange
 • lvcreate
 • lvdisplay
 • lvremove
 • lvresize
 • lvextend
 • lvs
Volume Groups
 • vgchange
 • vgcreate
 • vgdisplay
 • vgexport
 • vgextend
 • vgimport
 • vgremove
 • vgs
 • vgscan
Physical Volumes
 • pvcreate
 • pvdisplay
 • pvmove
 • pvremove
 • pvresize
 • pvs
 • pvscan
Partitions
 • blkid
 • fdisk
 • gdisk
 • growpart
 • lsblk
 • parted
Filesystems
Formats
 • xfs
 • ext4
 • btrfs
 • tmpfs
Utilities
 • df
 • du
 • fio
 • fsck
 • mkfs
 • resize2fs
 • xfs_growfs
 • xfs_repair
RAID
 • /proc/mdstat
 • mdadm
Mounted Storage
Mounting
 • /etc/fstab
 • /etc/mtab
 • /proc/mounts
 • autofs
 • mount
 • umount
Mount Options
 • noatime
 • nodev
 • nodiratime
 • noexec
 • nofail
 • nosuid
 • remount
 • ro
 • rw
Network Mounts
 • NFS
 • SMB / Samba
Concepts
 • Inodes
1.4 Given a Scenario, Manage Network Services and Configurations
Network Configuration Files
 • /etc/hosts
 • /etc/resolv.conf
 • /etc/nsswitch.conf
NetworkManager
 • nmcli
 • nmconnect
Netplan
Commands
 • netplan apply
 • netplan status
 • netplan try
Configuration
 • /etc/netplan
Common Network Tools
 • arp
 • curl
 • dig
 • ethtool
 • hostname
 • ip
 • ip address
 • ip link
 • ip route
 • iperf3
 • mtr
 • nc
 • nmap
 • nslookup
 • ping
 • ping6
 • ss
 • tcpdump
 • tracepath
 • traceroute
1.5 Given a Scenario, Manage a Linux System Using Common Shell Operations
Common Environment Variables
 • DISPLAY
 • HOME
 • PATH
 • PS1
 • SHELL
 • USER
Paths
Absolute
 • ~
 • /
Relative
 • .
 • ..
Shell Environment Configuration
 • .bashrc
 • .bash_profile
 • .profile
Channel Redirection
 • <
 • <<
 • |
 • Standard output
 • Standard error
 • Standard input
 • Here docs (<<<)
Basic Shell Utilities
 • !
 • !!
 • alias
 • awk
 • bc
 • cat
 • cut
 • echo
 • grep
 • head
 • history
 • less
 • more
 • printf
 • sed
 • sort
 • source
 • tail
 • tee
 • tr
 • uname
 • uniq
 • wc
 • xargs
Text Editors
 • vi
 • vim
 • nano
1.6 Given a Scenario, Perform Backup and Restore Operations
Archiving
 • cpio
 • tar
Compression Tools
 • 7zip
 • bzip2
 • gzip
 • xz
Other Tools
 • dd
 • ddrescue
 • rsync
 • zcat
 • zgrep
 • zless
 • unzip
1.7 Summarize Virtualization on Linux Systems
Hypervisors
 • QEMU
 • KVM
Virtual Machine Concepts
 • Paravirtualized drivers
 • VirtIO
 • Disk image operations
  ○ Convert
  ○ Resize
  ○ Image properties
 • VM states
 • Nested virtualization
VM Operations
Resources
 • Storage
 • RAM
 • CPU
 • Network
Operations
 • Baseline image templates
 • Cloning
 • Migrations
 • Snapshots
Deployment Types
 • Bare metal
 • Virtual machines
Network Types
 • Bridged
 • NAT
 • Host-only / isolated
 • Routed
 • Open
VM Tools
 • libvirt
 • virsh
 • virt-manager
2.0 Services and User Management
2.1 Given a Scenario, Manage Files and Directories
Utilities
 • cd
 • cp
 • diff
 • file
 • find
 • ln
 • locate
 • ls
 • lsof
 • mkdir
 • mv
 • pwd
 • rm
 • rmdir
 • sdiff
 • stat
 • touch
Links
 • Symbolic links
 • Hard links
Device Types in /dev
 • Block devices
 • Character devices
 • Special character devices
2.2 Given a Scenario, Perform Local Account Management
Add
 • adduser
 • groupadd
 • useradd
Delete
 • deluser
 • groupdel
 • userdel
Modify
 • chsh
 • groupmod
 • passwd
 • usermod
Lock
 • chage
 • passwd
 • usermod
Expiration
 • configuration files
 • chage
List
 • getent passwd
 • groups
 • id
 • last
 • lastlog
 • w
 • who
 • whoami
User Profile Templates
 • /etc/profile
 • /etc/skel
Account Files
 • /etc/group
 • /etc/passwd
 • /etc/shadow
Attributes
 • UID
 • GID
 • EUID
 • EGID
Account Types
 • User accounts
 • System accounts
 • Service accounts
2.3 Given a Scenario, Manage Processes and Jobs
Process Verification
 • /proc/
 • atop
 • htop
 • lsof
 • mpstat
 • pidstat
 • ps
 • pstree
 • strace
 • top
Process Identifiers
 • PID
 • PPID
Process States
 • Running
 • Blocked
 • Sleeping
 • Stopped
 • Zombie
Priority
 • nice
 • renice
Job and Process Management
 • &
 • bg
 • Ctrl + C
 • Ctrl + D
 • Ctrl + Z
 • exec
 • fg
 • jobs
 • kill
 • killall
 • nohup
 • pkill
Signals
 • 1 HUP
 • 9 KILL
 • 15 TERM
Scheduling
 • anacron
 • at
 • crontab
2.4 Given a Scenario, Configure and Manage Software
Installation, Update, Removal
 • Repository
 • Source
 • Package dependencies
 • Package conflicts
Package Managers
 • pip
 • cargo
 • npm
Repository Management
 • Enabling / disabling
 • Third-party repositories
 • GPG signatures
Other Topics
 • Package exclusions
 • Update alternatives
 • Sandboxed applications
Common Services
 • DNS
 • NTP / PTP
 • DHCP
 • HTTP (Apache, Nginx)
 • SMTP
 • IMAP4
2.5 Given a Scenario, Manage Linux Using systemd
Systemd Units
 • Services
 • Timers
 • Mounts
 • Targets
Utilities
 • hostnamectl
 • resolvectl
 • sysctl
 • systemctl
 • systemd-analyze
 • systemd-blame
 • systemd-resolved
 • timedatectl
Unit State Management
 • daemon-reload
 • disable
 • edit
 • enable
 • mask
 • reload
 • restart
 • start
 • status
 • stop
 • unmask
2.6 Given a Scenario, Manage Containers on Linux
Runtimes
 • runC
 • Podman
 • containerd
 • Docker
Image Operations
 • Pull images
 • Build images
 • Dockerfile
 • ENTRYPOINT
 • CMD
 • USER
 • FROM
 • Tags
 • Layers
 • Pruning
Container Operations
 • Run
 • Start containers
 • Stop containers
 • Inspect containers
 • Delete containers
 • Exec
 • Logs
 • Environment variables
Volume Operations
 • Create volume
 • Map volume
 • Pruning
 • SELinux context
 • Overlay
Container Networks
 • macvlan
 • ipvlan
 • host
 • bridge
 • overlay
 • none
Concepts
 • Port mapping
 • Privileged vs unprivileged
3.0 Security
3.1 Summarize Authorization, Authentication, and Accounting Methods
Authentication and Authorization Technologies
 • Polkit
 • Pluggable Authentication Modules (PAM)
 • System Security Services Daemon (SSSD)
 • Lightweight Directory Access Protocol (LDAP)
 • Kerberos
 • Samba
 • Winbind
 • realm
Logging
 • journalctl
 • rsyslog
 • logrotate
 • /var/log
System Audit
 • audit.rules
 • auditd
3.2 Given a Scenario, Configure and Implement Firewalls on a Linux System
firewalld
 • firewall-cmd
 • Runtime vs permanent configuration
 • Rich rules
 • Zones
 • Ports vs services
Uncomplicated Firewall (ufw)
 • Ports vs services
Other Firewall Technologies
 • nftables
 • iptables
 • ipset
 • Netfilter module
Address Translation
 • NAT
 • Port Address Translation (PAT)
 • Destination NAT (DNAT)
 • Source NAT (SNAT)
Firewall Concepts
 • Stateful vs stateless
 • IP forwarding
  ○ net.ipv4.ip_forward
3.3 Given a Scenario, Apply Operating System Hardening Techniques
Privilege Escalation
sudo
 • /etc/sudoers
 • NOEXEC
 • NOPASSWD
 • /etc/sudoers.d
 • visudo
 • sudo -i
 • wheel group
 • sudo group
su
 • su -
File Attributes
 • chattr
 • lsattr
Attributes
 • immutable
 • append only
Permissions
File permissions
 • chgrp
 • chmod
  ○ octal
  ○ symbolic
 • chown
Special permissions
 • sticky bit
 • setuid
 • setgid
Default permission mask
 • umask
Access Control
Access Control Lists (ACLs)
 • setfacl
 • getfacl
SELinux
 • restorecon
 • semanage
 • chcon
 • ls -Z
 • getenforce
 • setenforce
 • getsebool
 • setsebool
 • audit2allow
 • sealert
SELinux States
 • Enforcing
 • Permissive
 • Disabled
Secure Remote Access
SSH
 • SSHD
 • key authentication vs password authentication
 • SSH tunneling
 • PermitRootLogin
 • disabling X forwarding
 • AllowUsers
 • AllowGroups
SSH Tools
 • SSH agent
 • SFTP
 • chroot
Security Tools
 • fail2ban
Avoid Insecure Services
 • Telnet
 • FTP
 • TFTP
Additional Hardening
 • Disable unused file systems
 • Remove unnecessary SUID permissions
Secure Boot
 • UEFI
3.4 Explain Account Hardening Techniques and Best Practices
Passwords
 • Complexity
 • Length
 • Expiration
 • Reuse
 • History
Security Controls
 • Multifactor authentication (MFA)
 • Checking breach lists
Restricted Shells
 • /sbin/nologin
 • /bin/rbash
Account Security
 • pam_tally2
 • Avoid running as root
3.5 Explain Cryptographic Concepts and Technologies
Data at Rest
File encryption
 • GPG
Filesystem encryption
 • LUKS2
 • Argon2
Data in Transit
 • OpenSSL
 • WireGuard
 • LibreSSL
 • TLS protocol versions
Hashing
 • SHA-256
 • HMAC
Cryptography Best Practices
 • Remove weak algorithms
Certificate Management
 • Trusted root certificates
 • No-cost certificates
 • Commercial certificates
 • Avoid self-signed certificates
3.6 Explain the Importance of Compliance and Audit Procedures
Detection and Response
 • Anti-malware
 • Indicators of compromise (IOC)
Vulnerability Scanning
 • CVE
 • CVSS
 • Backporting patches
 • Service misconfigurations
Security Tools
 • Port scanners
 • Protocol analyzers
Standards and Audit
 • OpenSCAP
 • CIS Benchmarks
File Integrity
 • AIDE
 • rkhunter
 • Signed package verification
 • Installed file verification
Secure Data Destruction
 • shred
 • badblocks -w
 • dd if=/dev/urandom
 • cryptographic destruction
Software Supply Chain
Security Banners
 • /etc/issue
 • /etc/issue.net
 • /etc/motd
4.0 Automation, Orchestration, and Scripting
4.1 Summarize Automation and Orchestration in Linux
Infrastructure as Code
Ansible
 • Playbooks
 • Inventory
 • Modules
 • Ad hoc commands
 • Collections
 • Facts
 • Agentless
Puppet
 • Classes
 • Certificates
 • Modules
 • Facts
 • Agent / Agentless
OpenTofu
 • Provider
 • Resource
 • State
 • API
Unattended Deployment
 • Kickstart
 • Cloud-init
CI/CD
 • Version control
 • Shift-left testing
 • GitOps
 • Pipelines
 • DevSecOps
Deployment Orchestration
Kubernetes
 • ConfigMaps
 • Secrets
 • Pods
 • Deployments
 • Volumes
 • Services
 • Variables
Docker Swarm
 • Service
 • Nodes
 • Tasks
 • Networks
 • Scale
Docker / Podman Compose
 • Compose file
 • up/down
 • logs
4.2 Given a Scenario, Perform Automated Tasks Using Shell Scripting
Expansion
Parameter expansion
 • ${var}
Command substitution
 • $(command)
 • command
Subshell
 • (command)
Functions
Internal Field Separator
 • IFS
 • OFS
Conditional Statements
 • if
 • case
Loops
 • until
 • for
 • while
Interpreter Directive
 • #!
Comparisons
Numerical
 • -eq
 • -ge
 • -gt
 • -le
 • -lt
 • -ne
String
 • <
 • ==
 • =
 • =~
 • !=
 • <=
 • =
Regular Expressions
 • [[ $foo =~ regex ]]
Test Commands
 • !
 • -d
 • -f
 • -n
 • -z
Variables
Types
 • environmental
 • arguments
 • assignments
Commands
 • alias
 • export
 • local
 • set
 • unalias
 • unset
Return Codes
 • $?
4.3 Summarize Python Basics for Linux System Administration
Environment Setup
 • Virtual environments
Dependency Management
 • Installing dependencies
Python Fundamentals
 • indentation
 • current versions
Data Types
 • Boolean
 • Integer
 • List
 • String
 • Dictionary
 • Floating point
Extensibility
 • modules
 • packages
Best Practices
 • PEP 8
4.4 Given a Scenario, Implement Version Control Using Git
Core Git Commands
 • .gitignore
 • add
 • branch
 • checkout
 • clone
 • commit
 • config
 • diff
 • fetch
 • init
 • log
 • merge
 • pull
 • push
 • rebase
 • reset
 • stash
 • tag
Merge Options
 • squash
4.5 Summarize Best Practices for Artificial Intelligence
Common Use Cases
 • Code generation
 • Regular expression generation
 • Infrastructure as code generation
 • Documentation generation
 • Compliance recommendations
 • Security review
 • Code optimization
 • Code linting
Data Governance
 • security of data
 • LLM training
 • human review
 • local models
 • private vs public models
Policies
 • adhere to corporate policy
Prompt Engineering
Best Practices
 • avoid copy/paste without review
 • verify output
5.0 Troubleshooting
5.1 Summarize Monitoring Concepts and Configurations
Service Monitoring
 • SLA
 • SLI
 • SLO
Data Acquisition
 • SNMP
 • SNMP traps
 • MIBs
 • agent / agentless
 • webhooks
 • health checks
 • log aggregation
Monitoring Configuration
 • thresholds
 • alerts
 • events
 • notifications
 • logging
5.2 Given a Scenario, Troubleshoot Hardware, Storage, and OS Issues
Common Issues
 • kernel panic
 • data corruption
 • kernel corruption
 • package dependency issues
 • filesystem will not mount
 • server not turning on
 • filesystem full
 • server inaccessible
 • device failure
 • inode exhaustion
 • partition not writable
 • segmentation fault
 • GRUB misconfiguration
 • killed processes
 • PATH misconfiguration
 • systemd unit failures
 • missing or disabled drivers
 • unresponsive process
 • quota issues
 • memory leaks
5.3 Given a Scenario, Troubleshoot Networking Issues
Common Issues
 • misconfigured firewalls
 • DHCP issues
 • DNS issues
Interface Issues
 • interface misconfiguration
 • MTU mismatch
 • bonding
 • MAC spoofing
 • subnet issues
 • cannot ping server
Routing Issues
 • gateway problems
 • server unreachable
Other Issues
 • IP conflicts
 • IPv4/IPv6 dual stack issues
 • link down
 • link negotiation problems
5.4 Given a Scenario, Troubleshoot Security Issues
Common Issues
SELinux
 • policy issues
 • context issues
 • boolean issues
Permissions
 • ACL issues
 • attribute issues
Account Issues
 • account access problems
System Security
 • unpatched systems
 • exposed services
 • misconfigured services
 • remote access issues
Certificates
 • certificate issues
Repositories
 • misconfigured package repository
Protocols
 • obsolete protocols
 • insecure ciphers
 • cipher negotiation issues
5.5 Given a Scenario, Troubleshoot Performance Issues
Common Symptoms
 • swapping
 • out of memory
 • slow application response
 • system unresponsiveness
 • high CPU usage
 • high load average
 • high context switching
 • high failed login attempts
 • slow startup
 • high I/O wait
 • packet drops
 • jitter
 • random disconnects
 • random timeouts
 • high latency
 • slow response times
 • high disk latency
 • low throughput
 • blocked processes
 • hardware errors
 • sluggish terminal behavior
 • exceeding baselines
 • slow remote storage
 • CPU bottleneck
Acronym List
ACRONYM DEFINITION
ACL Access Control List
ACME Automated Certificate Management Environment
AI Artificial Intelligence
AIDE Advanced Intrusion Detection Environment
API Application Programming Interface
ARM Advanced Reduced Instruction Set Computer (RISC) Machine
BIOS Basic Input/Output System
CA Certificate Authority
CI/CD Continuous Integration/Continuous Deployment
CIFS Common Internet File System
CIS Center for Internet Security
CMS Content Management System
CPU Central Processing Unit
CSV Comma-seperated Value
CUPS Common UNIX Printing System
CVE Common Vulnerabilities and Exposures
CVSS Common Vulnerability Scoring System
DHCP Dynamic Host Configuration Protocol
DNAT Destination Network Address Translation
DNS Domain Name System
EGID Effective Group Identifier
EPEL Extra Packages for Enterprise Linux
EUID Effective User Identifier
FEC Forward Error Correction
FHS Filesystem Hierarchy Standard
FQDN Fully Qualified Domain Name
FTP File Transfer Protocol
FUSE Filesystem in Userspace
GDPR General Data Protection Regulation
GID Group Identifier
GNU Gnu’s Not Unix
GPG2 GNU Privacy Guard 2
GPG GNU Privacy Guard
GPT GUID (Globally Unique Identifier) Partition Table
GPU Graphics Processing Unit
GRUB Grand Unified Bootloader
GUI Graphical User Interface
GUID Globally Unique Identifier
HMAC Hashed Message Authentication Code
HTTP HyperText Transfer Protocol
HTTPD HyperText Transfer Protocol Daemon
IaC Infrastructure as Code
SLA Service-level Agreement
SLES SUSE Linux Enterprise Server
SLI Service-level Indicator
SLO Service-level Objective
SMB Server Message Block
SMTP Simple Mail Transfer Protocol
SNAT Source Network Address Translation
SNMP Simple Network Management Protocol
SR-IOV Single Root Input/Output Virtualization
SSD Solid-state Drive
SSH Secure Shell
SSHD Secure Shell Daemon
SSL Secure Sockets Layer
SSO Single Sign-On
SSSD System Security Services Daemon
TCP Transmission Control Protocol
TFTP Trivial File Transfer Protocol
TLS Transport Layer Security
TOTP Time-based One-time Password
TTL Time to Live
UDP User Datagram Protocol
UEFI Unified Extensible Firmware Interface
UFW Uncomplicated Firewall
UID Unique Identifier
USB Universal Serial Bus
UUID Univerally Unique Identifier
Vim Vi Improved
VM Virtual Machine
WAN Wide Area Network
XML Extensible Markup Langage
YAML YAML Ain't Markup Language



## Input 2: Lab Setup Exercises

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

## Input 3: Exercise Bank 1  

# Module 1 — System Management (30 Exercises)

## Exercise 1.1 — Identify System Architecture

Objective: Determine architecture and kernel information.

Tasks:

1. Display the system kernel name and version.
2. Display the CPU architecture of the system.
3. Display the hostname of the system.

---

## Exercise 1.2 — Inspect CPU Information

Tasks:

1. Display detailed CPU information including number of cores.
2. Identify the CPU model name.
3. Determine the number of threads available.

Use system files located under `/proc`.

---

## Exercise 1.3 — Inspect Memory Information

Tasks:

1. Display current memory usage in human-readable format.
2. Identify total installed system memory.
3. Identify available memory.

---

## Exercise 1.4 — Display Hardware Information

Tasks:

1. Display a full hardware summary of the system.
2. Identify the network interface hardware.
3. Identify the storage controller hardware.

---

## Exercise 1.5 — List PCI Devices

Tasks:

1. List all PCI devices installed on the system.
2. Identify which PCI device corresponds to the network adapter.

---

## Exercise 1.6 — List USB Devices

Tasks:

1. Display all USB devices currently detected by the system.
2. Identify any USB storage devices.

---

## Exercise 1.7 — Inspect Kernel Modules

Tasks:

1. List all currently loaded kernel modules.
2. Identify the module responsible for virtualization support if present.

---

## Exercise 1.8 — Inspect Boot Messages

Tasks:

1. Display the system boot log messages.
2. Identify any references to storage device initialization.

---

## Exercise 1.9 — Inspect Block Devices

Tasks:

1. Display all block devices attached to the system.
2. Identify disk devices and their partitions.

---

## Exercise 1.10 — Identify Filesystem Types

Tasks:

1. Display all block devices with filesystem type information.
2. Identify the filesystem used by the root partition.

---

## Exercise 1.11 — Inspect Disk Usage

Tasks:

1. Display disk usage for all mounted filesystems.
2. Identify which filesystem contains `/var`.

---

## Exercise 1.12 — Inspect Mounted Filesystems

Tasks:

1. Display all currently mounted filesystems.
2. Identify which filesystem is mounted at `/`.

---

## Exercise 1.13 — Inspect Directory Disk Usage

Tasks:

1. Determine the disk usage of `/var`.
2. Identify the largest subdirectory under `/var`.

---

## Exercise 1.14 — Identify Largest Log Files

Tasks:

1. List files inside `/var/log`.
2. Identify the five largest files.

---

## Exercise 1.15 — Inspect Partition Table

Tasks:

1. Display the partition table for the primary disk device.
2. Identify partition sizes and filesystem types.

---

## Exercise 1.16 — Mount a Temporary Filesystem

Tasks:

1. Create a directory `/opt/training_mount`.
2. Mount a temporary filesystem at that location.

---

## Exercise 1.17 — Unmount Filesystem

Tasks:

1. Unmount the filesystem mounted in Exercise 1.16.

---

## Exercise 1.18 — Inspect `/etc/fstab`

Tasks:

1. Display the contents of `/etc/fstab`.
2. Identify the entry responsible for mounting the root filesystem.

---

## Exercise 1.19 — Inspect Disk UUIDs

Tasks:

1. Display UUID information for all block devices.

---

## Exercise 1.20 — Inspect System Uptime

Tasks:

1. Display how long the system has been running since last boot.

---

## Exercise 1.21 — Inspect Network Interfaces

Tasks:

1. Display all network interfaces.
2. Identify the primary network interface.

---

## Exercise 1.22 — Display IP Address

Tasks:

1. Display the IPv4 address assigned to the primary interface.

---

## Exercise 1.23 — Display Routing Table

Tasks:

1. Display the system routing table.
2. Identify the default gateway.

---

## Exercise 1.24 — Test Network Connectivity

Tasks:

1. Send 4 ICMP echo requests to `8.8.8.8`.

---

## Exercise 1.25 — Inspect Listening Ports

Tasks:

1. Display all listening TCP ports.
2. Identify which services are listening.

---

## Exercise 1.26 — Capture Network Traffic

Tasks:

1. Capture 10 packets on the primary network interface.

---

## Exercise 1.27 — Display System Time

Tasks:

1. Display system date and time.
2. Display system timezone.

---

## Exercise 1.28 — Inspect System Logs

Tasks:

1. Display the last 20 log entries from the system journal.

---

## Exercise 1.29 — Inspect Boot Logs

Tasks:

1. Display logs from the most recent boot.

---

## Exercise 1.30 — Identify Kernel Ring Buffer Messages

Tasks:

1. Display the kernel ring buffer messages.
2. Identify messages referencing storage devices.

---

# Module 2 — User and Permission Management (30 Exercises)

## Exercise 2.1 — Create User Account

Tasks:

1. Create a new user named `analyst`.
2. Create the user's home directory.

---

## Exercise 2.2 — Create Group

Tasks:

1. Create a group named `security`.

---

## Exercise 2.3 — Add User to Group

Tasks:

1. Add the user `analyst` to the group `security`.

---

## Exercise 2.4 — Set User Password

Tasks:

1. Set a password for the user `analyst`.

---

## Exercise 2.5 — Lock User Account

Tasks:

1. Lock the `analyst` user account.

---

## Exercise 2.6 — Unlock User Account

Tasks:

1. Unlock the `analyst` user account.

---

## Exercise 2.7 — Inspect User Login History

Tasks:

1. Display login history for all users.

---

## Exercise 2.8 — Identify Currently Logged Users

Tasks:

1. Display currently logged in users.
2. Display what commands they are executing.

---

## Exercise 2.9 — Inspect File Permissions

Tasks:

1. Display permissions for `/etc/passwd`.

---

## Exercise 2.10 — Modify File Permissions

Tasks:

1. Create file `/opt/training_file`.
2. Set permissions to `640`.

---

## Exercise 2.11 — Create Symbolic Link

Tasks:

1. Create a symbolic link in `/home/student` named `syslog_link`.
2. The link should reference `/var/log/syslog`.

---

## Exercise 2.12 — Create Hard Link

Tasks:

1. Create a hard link to `/etc/hosts`.
2. Place the link in `/home/student`.

---

## Exercise 2.13 — Identify Open Files

Tasks:

1. Identify processes currently accessing files within `/var/log`.

---

## Exercise 2.14 — Inspect Running Processes

Tasks:

1. Display all running processes.

---

## Exercise 2.15 — Monitor Processes in Real Time

Tasks:

1. Display real-time system processes.

---

## Exercise 2.16 — Adjust Process Priority

Tasks:

1. Launch a CPU intensive command.
2. Adjust its scheduling priority.

---

## Exercise 2.17 — Terminate Process

Tasks:

1. Identify a running process.
2. Terminate the process using its PID.

---

## Exercise 2.18 — Run Process in Background

Tasks:

1. Run the command `sleep 300` in the background.

---

## Exercise 2.19 — Bring Background Process to Foreground

Tasks:

1. Bring the background sleep process to the foreground.

---

## Exercise 2.20 — Schedule Cron Job

Tasks:

1. Schedule a cron job for user `student`.
2. The job should append the current date to `/home/student/cron_test.log` every minute.

---

## Exercise 2.21 — Schedule One-Time Job

Tasks:

1. Schedule a job to run in 2 minutes.
2. The job should create a file `/home/student/at_test`.

---

## Exercise 2.22 — Inspect Services

Tasks:

1. Display the status of the SSH service.

---

## Exercise 2.23 — Start Service

Tasks:

1. Start the SSH service.

---

## Exercise 2.24 — Stop Service

Tasks:

1. Stop the SSH service.

---

## Exercise 2.25 — Restart Service

Tasks:

1. Restart the SSH service.

---

## Exercise 2.26 — Enable Service at Boot

Tasks:

1. Configure the SSH service to start automatically at boot.

---

## Exercise 2.27 — Disable Service at Boot

Tasks:

1. Disable automatic startup of the SSH service.

---

## Exercise 2.28 — Inspect Logs Using journalctl

Tasks:

1. Display logs for the SSH service.

---

## Exercise 2.29 — Install Package

Tasks:

1. Install the package `htop`.

---

## Exercise 2.30 — Remove Package

Tasks:

1. Remove the package `htop`.

---

# Module 3 — Security (35 Exercises)

## Exercise 3.1 — Inspect sudo Configuration

Tasks:

1. Display the sudo privileges assigned to the current user.
2. Identify which users or groups are granted administrative privileges.

---

## Exercise 3.2 — Inspect `/etc/sudoers`

Tasks:

1. Safely display the contents of `/etc/sudoers`.
2. Identify the line granting sudo access to members of the `sudo` or `wheel` group.

---

## Exercise 3.3 — Create a Restricted Directory

Tasks:

1. Create directory `/opt/security_lab`.
2. Configure permissions so only the owner can read, write, or execute.

---

## Exercise 3.4 — Configure Shared Group Directory

Tasks:

1. Create directory `/opt/shared_security`.
2. Assign group ownership to `security`.
3. Allow group members to read and write.

---

## Exercise 3.5 — Inspect File Permissions

Tasks:

1. Display permissions of `/etc/shadow`.
2. Identify which users have access.

---

## Exercise 3.6 — Identify World-Writable Files

Tasks:

1. Search the `/var` directory.
2. Identify any world-writable files.

---

## Exercise 3.7 — Identify SUID Files

Tasks:

1. Search the entire system.
2. Identify files with the SUID permission bit enabled.

---

## Exercise 3.8 — Remove SUID Bit

Tasks:

1. Copy `/bin/ls` to `/opt/security_lab`.
2. Add SUID permission.
3. Remove the SUID permission again.

---

## Exercise 3.9 — Configure Access Control List (ACL)

Tasks:

1. Create file `/opt/security_lab/acl_test`.
2. Grant read access to user `analyst` using ACL.

---

## Exercise 3.10 — Inspect ACL Settings

Tasks:

1. Display ACL permissions for `/opt/security_lab/acl_test`.

---

## Exercise 3.11 — Inspect SELinux Status

Tasks:

1. Determine whether SELinux is enabled.
2. Identify its current mode.

---

## Exercise 3.12 — Inspect SELinux Context

Tasks:

1. Display SELinux security context for `/var/log`.

---

## Exercise 3.13 — Change SELinux Context

Tasks:

1. Create file `/opt/security_lab/selinux_test`.
2. Change its SELinux type to `httpd_sys_content_t`.

---

## Exercise 3.14 — Restore Default SELinux Context

Tasks:

1. Restore the original context of `/opt/security_lab/selinux_test`.

---

## Exercise 3.15 — Inspect Firewall Status

Tasks:

1. Display the current firewall status.

---

## Exercise 3.16 — List Firewall Rules

Tasks:

1. Display all active firewall rules.

---

## Exercise 3.17 — Open Firewall Port

Tasks:

1. Open TCP port **8080** permanently.

---

## Exercise 3.18 — Remove Firewall Rule

Tasks:

1. Remove the rule allowing TCP port **8080**.

---

## Exercise 3.19 — Inspect Listening Services

Tasks:

1. Identify all processes listening on network ports.

---

## Exercise 3.20 — Inspect SSH Configuration

Tasks:

1. Display contents of `/etc/ssh/sshd_config`.
2. Identify whether root login is allowed.

---

## Exercise 3.21 — Disable SSH Root Login

Tasks:

1. Modify `/etc/ssh/sshd_config` to disable root login.

---

## Exercise 3.22 — Restart SSH Service

Tasks:

1. Restart the SSH service to apply configuration changes.

---

## Exercise 3.23 — Generate SSH Key Pair

Tasks:

1. Generate an SSH key pair for the `student` user.

---

## Exercise 3.24 — Copy SSH Key

Tasks:

1. Copy the public key to another local account (`analyst`).

---

## Exercise 3.25 — Inspect Authentication Logs

Tasks:

1. Inspect authentication logs inside `/var/log`.
2. Identify recent login attempts.

---

## Exercise 3.26 — Identify Failed Logins

Tasks:

1. Display failed login attempts.

---

## Exercise 3.27 — Configure Login Banner

Tasks:

1. Configure a login banner using `/etc/motd`.

---

## Exercise 3.28 — Encrypt File with GPG

Tasks:

1. Create file `/home/student/secret.txt`.
2. Encrypt the file.

---

## Exercise 3.29 — Decrypt File

Tasks:

1. Decrypt `/home/student/secret.txt`.

---

## Exercise 3.30 — Inspect Audit Logs

Tasks:

1. Display audit logs if auditing is enabled.

---

## Exercise 3.31 — Create Audit Rule

Tasks:

1. Configure auditing for changes to `/etc/passwd`.

---

## Exercise 3.32 — Identify Open Network Connections

Tasks:

1. Identify all established network connections.

---

## Exercise 3.33 — Inspect Running Services

Tasks:

1. Display all active services.

---

## Exercise 3.34 — Identify Privileged Processes

Tasks:

1. Identify processes running as root.

---

## Exercise 3.35 — Inspect System Security Updates

Tasks:

1. Identify whether any security updates are available.

---

# Module 4 — Automation and Scripting (30 Exercises)

## Exercise 4.1 — Create Bash Script

Tasks:

1. Create script `/home/student/sysinfo.sh`.
2. Script should display hostname, kernel version, and uptime.

---

## Exercise 4.2 — Use Script Variables

Tasks:

1. Modify the script to store hostname in a variable.

---

## Exercise 4.3 — Script Arguments

Tasks:

1. Modify script to accept a directory path as argument.
2. Display disk usage for that directory.

---

## Exercise 4.4 — Conditional Logic

Tasks:

1. Create script that checks if `/var/log/syslog` exists.

---

## Exercise 4.5 — Case Statement

Tasks:

1. Create script that accepts argument `start`, `stop`, or `status`.

---

## Exercise 4.6 — For Loop

Tasks:

1. Write script that lists all files in `/var/log`.

---

## Exercise 4.7 — While Loop

Tasks:

1. Write script that counts from 1 to 10.

---

## Exercise 4.8 — Until Loop

Tasks:

1. Write script that repeats until a file `/tmp/stopfile` exists.

---

## Exercise 4.9 — Parse Output with grep

Tasks:

1. Search `/var/log` for entries containing `error`.

---

## Exercise 4.10 — Extract Fields with awk

Tasks:

1. Display usernames from `/etc/passwd`.

---

## Exercise 4.11 — Replace Text with sed

Tasks:

1. Replace text `error` with `ERROR` in a copy of a log file.

---

## Exercise 4.12 — Sort Log Entries

Tasks:

1. Sort lines in `/var/log/syslog`.

---

## Exercise 4.13 — Remove Duplicate Lines

Tasks:

1. Remove duplicates from a test file.

---

## Exercise 4.14 — Count Lines in File

Tasks:

1. Count lines in `/etc/passwd`.

---

## Exercise 4.15 — Redirect Output

Tasks:

1. Redirect output of `journalctl` to `/home/student/log_output.txt`.

---

## Exercise 4.16 — Append Output

Tasks:

1. Append current date to `/home/student/log_output.txt`.

---

## Exercise 4.17 — Pipe Commands

Tasks:

1. Display the five largest files in `/var/log`.

---

## Exercise 4.18 — Backup Script

Tasks:

1. Write script that archives `/var/log` into `/home/student/log_backup.tar`.

---

## Exercise 4.19 — Automated Backup Cron Job

Tasks:

1. Schedule backup script to run daily at 1 AM.

---

## Exercise 4.20 — Cleanup Script

Tasks:

1. Create script deleting files older than 7 days in `/tmp`.

---

## Exercise 4.21 — System Health Script

Tasks:

1. Script should display CPU, memory, and disk usage.

---

## Exercise 4.22 — Git Repository Initialization

Tasks:

1. Create repository `/home/student/linux_lab_repo`.

---

## Exercise 4.23 — Git Commit

Tasks:

1. Commit script files into repository.

---

## Exercise 4.24 — Create Branch

Tasks:

1. Create branch `feature-monitoring`.

---

## Exercise 4.25 — Merge Branch

Tasks:

1. Merge `feature-monitoring` into main branch.

---

## Exercise 4.26 — View Git History

Tasks:

1. Display commit history.

---

## Exercise 4.27 — Tag Release

Tasks:

1. Tag repository version `v1.0`.

---

## Exercise 4.28 — Script Log Monitoring

Tasks:

1. Write script detecting new lines in `/var/log/syslog`.

---

## Exercise 4.29 — Scheduled Log Monitoring

Tasks:

1. Schedule monitoring script via cron.

---

## Exercise 4.30 — Script Exit Codes

Tasks:

1. Modify script to return exit code if log file missing.

---

# Module 5 — Troubleshooting (35 Exercises)

## Exercise 5.1 — Diagnose High CPU Usage

Tasks:

1. Identify the process consuming the most CPU.

---

## Exercise 5.2 — Diagnose High Memory Usage

Tasks:

1. Identify process consuming most memory.

---

## Exercise 5.3 — Diagnose Disk Space Issues

Tasks:

1. Identify which filesystem is full.

---

## Exercise 5.4 — Identify Large Files

Tasks:

1. Locate files larger than 100 MB inside `/var`.

---

## Exercise 5.5 — Identify Zombie Processes

Tasks:

1. Identify zombie processes.

---

## Exercise 5.6 — Diagnose Network Connectivity

Tasks:

1. Verify internet connectivity.

---

## Exercise 5.7 — Diagnose DNS Resolution

Tasks:

1. Query DNS for `google.com`.

---

## Exercise 5.8 — Inspect Network Interfaces

Tasks:

1. Verify interface status.

---

## Exercise 5.9 — Inspect Routing Table

Tasks:

1. Identify default route.

---

## Exercise 5.10 — Diagnose SSH Connection

Tasks:

1. Attempt SSH connection with verbose output.

---

## Exercise 5.11 — Diagnose Service Failure

Tasks:

1. Identify why SSH service fails to start.

---

## Exercise 5.12 — Inspect System Logs

Tasks:

1. Display logs for last hour.

---

## Exercise 5.13 — Inspect Boot Logs

Tasks:

1. Identify boot errors.

---

## Exercise 5.14 — Diagnose Disk Errors

Tasks:

1. Inspect kernel messages for disk issues.

---

## Exercise 5.15 — Check Filesystem Integrity

Tasks:

1. Perform filesystem check on non-mounted disk.

---

## Exercise 5.16 — Diagnose Mount Failure

Tasks:

1. Attempt mounting disk and inspect error messages.

---

## Exercise 5.17 — Diagnose Permission Errors

Tasks:

1. Identify cause of permission denied error for `/var/log`.

---

## Exercise 5.18 — Diagnose SELinux Denial

Tasks:

1. Identify SELinux denial messages.

---

## Exercise 5.19 — Diagnose Firewall Blocking

Tasks:

1. Identify firewall rule blocking port 22.

---

## Exercise 5.20 — Diagnose Package Installation Failure

Tasks:

1. Inspect logs for package installation failure.

---

## Exercise 5.21 — Diagnose Cron Job Failure

Tasks:

1. Identify why cron job failed to run.

---

## Exercise 5.22 — Diagnose Container Failure

Tasks:

1. Inspect container logs.

---

## Exercise 5.23 — Diagnose Network Latency

Tasks:

1. Identify latency path to `google.com`.

---

## Exercise 5.24 — Diagnose Disk I/O Issues

Tasks:

1. Identify high disk I/O process.

---

## Exercise 5.25 — Diagnose Inode Exhaustion

Tasks:

1. Identify filesystem with exhausted inodes.

---

## Exercise 5.26 — Diagnose Process Crash

Tasks:

1. Inspect logs for segmentation fault.

---

## Exercise 5.27 — Diagnose Login Failure

Tasks:

1. Identify reason for failed login attempt.

---

## Exercise 5.28 — Diagnose Service Dependency

Tasks:

1. Identify dependencies for SSH service.

---

## Exercise 5.29 — Diagnose Network Port Conflict

Tasks:

1. Identify processes using port 80.

---

## Exercise 5.30 — Diagnose Log Rotation Issues

Tasks:

1. Inspect `/etc/logrotate.conf`.

---

## Exercise 5.31 — Diagnose Slow Boot

Tasks:

1. Identify slow boot services.

---

## Exercise 5.32 — Inspect System Resource Limits

Tasks:

1. Identify current open file limit.

---

## Exercise 5.33 — Diagnose Kernel Panic Logs

Tasks:

1. Inspect logs for panic indicators.

---

## Exercise 5.34 — Inspect Hardware Errors

Tasks:

1. Inspect kernel logs for hardware errors.

---

## Exercise 5.35 — Perform Full System Health Review

Tasks:

1. Review CPU, memory, disk, network, and logs to determine overall system health.

---
# Input 4: Exercise Bank 2

```markdown
# Action 2 — Linux+ Progressive Exercise Set

This section contains a **progressive set of hands-on exercises** designed to prepare team members for the **CompTIA Linux+ XK0-006 exam**.

Exercises are designed to:

- Reinforce knowledge through **on-keyboard practice**
- Encourage **documentation lookup**
- Increase **administrative confidence**
- Build toward **automation and troubleshooting**
- Integrate **multiple exam objectives**

Exercises intentionally increase in difficulty.

---

# Exercise 1 — Verify the Lab Environment

## Objective

Verify that the three-node lab environment is functioning correctly.

## Tasks

1. Log in to the **controller** VM.

2. Verify system hostname.

3. Display the current logged-in user.

4. Display the system kernel version.

5. Display CPU architecture.

6. Verify IP addresses for the system.

7. Verify connectivity to:

```

server1
server2

```

8. Verify internet connectivity by pinging:

```

8.8.8.8

```

---

# Exercise 2 — Explore the Filesystem Hierarchy

## Objective

Identify key directories defined in the **Filesystem Hierarchy Standard (FHS)**.

## Tasks

1. Display the contents of the following directories:

```

/

```
```

/etc

```
```

/var

```
```

/usr

```

2. Determine the purpose of the directory:

```

/boot

```

3. Determine which directory stores:

```

system configuration files

```

4. Determine which directory contains:

```

user home directories

```

5. Display disk usage for:

```

/var

```

---

# Exercise 3 — File Management Operations

## Objective

Practice core file management operations.

## Tasks

1. Create directory:

```

/home/student/linuxplus

```

2. Inside that directory create files:

```

file1.txt
file2.txt
file3.txt

```

3. Copy `file1.txt` to:

```

/tmp

```

4. Move `file2.txt` to:

```

/var/tmp

```

5. Delete:

```

file3.txt

```

6. Display file metadata for:

```

file1.txt

```

---

# Exercise 4 — Working With Links

## Objective

Create symbolic and hard links.

## Tasks

1. Create directory:

```

/home/student/links

```

2. Create file:

```

original.txt

```

3. Create a **hard link** named:

```

hardlink.txt

```

4. Create a **symbolic link** named:

```

symlink.txt

```

5. Display inode numbers for all files.

6. Remove the original file.

7. Determine which link still functions.

---

# Exercise 5 — User Account Management

## Objective

Practice creating and managing user accounts.

## Tasks

1. Create user account:

```

devuser

```

2. Create group:

```

developers

```

3. Add `devuser` to the group.

4. Set password for the user.

5. Verify user ID and group membership.

6. Configure the account to expire in **30 days**.

7. Display last login information for the user.

---

# Exercise 6 — File Permissions

## Objective

Modify Linux file permissions.

## Tasks

1. Create file:

```

/home/student/secure.txt

```

2. Set permissions so that:

```

owner = read/write
group = read
others = none

```

3. Change file owner to:

```

devuser

```

4. Change file group to:

```

developers

```

5. Apply the **setgid** bit to a directory named:

```

shared

```

6. Configure default permissions using `umask`.

---

# Exercise 7 — Process Monitoring

## Objective

Monitor and manage running processes.

## Tasks

1. Display currently running processes.

2. Display process tree.

3. Identify PID of the `sshd` process.

4. Launch a background process using:

```

sleep 300

```

5. Identify the PID of that process.

6. Change the process priority.

7. Terminate the process.

---

# Exercise 8 — Job Control

## Objective

Manage foreground and background jobs.

## Tasks

1. Start a command:

```

sleep 600

```

2. Suspend the job.

3. Move the job to the background.

4. Display job list.

5. Bring the job back to the foreground.

6. Terminate the job.

---

# Exercise 9 — Package Management

## Objective

Install and manage software packages.

## Tasks

1. Verify enabled repositories.

2. Install package:

```

htop

```

3. Install package:

```

tree

```

4. Determine which package provides:

```

/usr/bin/ls

```

5. Remove the `tree` package.

6. Display package information for:

```

bash

```

---

# Exercise 10 — Disk and Storage Management

## Objective

Explore system storage devices.

## Tasks

1. List block devices.

2. Display filesystem usage.

3. Display inode usage.

4. Identify filesystem type used on:

```

/

```

5. Display partition information.

---

# Exercise 11 — Logical Volume Manager

## Objective

Create and manage LVM storage.

## Tasks

Assume a new disk appears as:

```

/dev/sdb

```

1. Create a physical volume.

2. Create volume group:

```

vgdata

```

3. Create logical volume:

```

lvdata

```

Size:

```

1GB

```

4. Create filesystem on the volume.

5. Mount the filesystem at:

```

/mnt/data

```

6. Extend the logical volume.

---

# Exercise 12 — Network Configuration

## Objective

Investigate network configuration.

## Tasks

1. Display system hostname.

2. Display network interfaces.

3. Display IP addresses.

4. Display routing table.

5. Verify DNS resolution for:

```

rockylinux.org

```

6. Display listening network sockets.

---

# Exercise 13 — Network Troubleshooting

## Objective

Diagnose connectivity issues.

## Tasks

1. Test connectivity to:

```

server1

```

2. Trace the network route.

3. Perform DNS lookup for:

```

github.com

```

4. Capture packets for:

```

ping traffic

```

5. Perform port scan on:

```

server1

```

---

# Exercise 14 — Systemd Service Management

## Objective

Manage system services.

## Tasks

1. Display system boot target.

2. Display status of:

```

sshd

```

3. Restart the service.

4. Disable the service.

5. Enable the service again.

6. Display system boot time analysis.

---

# Exercise 15 — Backup and Restore

## Objective

Create backups using archiving tools.

## Tasks

1. Create directory:

```

/home/student/backups

```

2. Archive directory:

```

/etc

```

3. Compress archive using:

```

gzip

```

4. Extract archive into:

```

/tmp/restore

```

---

# Exercise 16 — SSH Configuration

## Objective

Secure remote access.

## Tasks

1. Verify SSH service status.

2. Disable root SSH login.

3. Disable password authentication.

4. Restart SSH service.

5. Verify key-based authentication works.

---

# Exercise 17 — Firewall Configuration

## Objective

Configure host firewall rules.

## Tasks

1. Display current firewall zones.

2. Open port:

```

80/tcp

```

3. Add service:

```

ssh

```

4. Reload firewall configuration.

5. Verify open ports.

---

# Exercise 18 — Container Management

## Objective

Run containers using Podman.

## Tasks

1. Install Podman.

2. Pull image:

```

docker.io/library/nginx

```

3. Run container mapping:

```

8080 → 80

```

4. Display running containers.

5. Stop the container.

6. Remove the container.

---

# Exercise 19 — Bash Automation

## Objective

Create automation using Bash.

## Tasks

Create script:

```

system_report.sh

```

Script must display:

```

hostname
uptime
disk usage
memory usage
current user

```

1. Save script in:

```

/home/student/scripts

```

2. Make script executable.

3. Execute the script.

---

# Exercise 20 — Git Version Control

## Objective

Practice version control.

## Tasks

1. Navigate to repository.

2. Create directory:

```

exercises/linuxplus

```

3. Create file:

```

notes.md

```

4. Commit the file.

5. Push changes to GitHub.

---

# Exercise 21 — Automation Using Ansible

## Objective

Deploy configuration to all servers.

## Tasks

Create Ansible playbook:

```

install_tools.yml

```

Tasks:

Install packages:

```

htop
git
vim

```

Run the playbook against:

```

server1
server2

````

---

# Exercise 22 — Troubleshooting Scenario

## Objective

Troubleshoot a failed service.

## Scenario

The web server is not responding.

## Tasks

1. Verify service status.

2. Review logs.

3. Verify firewall configuration.

4. Confirm listening ports.

5. Restart the service.

---

# Appendix A — Recommended Answers

---

## Exercise 1

```bash
hostname
whoami
uname -r
uname -m
ip a
ping server1
ping server2
ping 8.8.8.8
````

---

## Exercise 2

```bash
ls /
ls /etc
ls /var
ls /usr
du -sh /var
```

---

## Exercise 3

```bash
mkdir /home/student/linuxplus
touch file1.txt file2.txt file3.txt
cp file1.txt /tmp
mv file2.txt /var/tmp
rm file3.txt
stat file1.txt
```

---

## Exercise 4

```bash
ln original.txt hardlink.txt
ln -s original.txt symlink.txt
ls -li
```

---

## Exercise 5

```bash
sudo useradd devuser
sudo groupadd developers
sudo usermod -aG developers devuser
sudo passwd devuser
id devuser
sudo chage -M 30 devuser
lastlog
```

---

## Exercise 7

```bash
ps aux
pstree
sleep 300 &
renice -n 10 PID
kill PID
```

---

## Exercise 11

```bash
pvcreate /dev/sdb
vgcreate vgdata /dev/sdb
lvcreate -L 1G -n lvdata vgdata
mkfs.ext4 /dev/vgdata/lvdata
mount /dev/vgdata/lvdata /mnt/data
lvextend -L +1G /dev/vgdata/lvdata
```

---

## Exercise 14

```bash
systemctl status sshd
systemctl restart sshd
systemctl disable sshd
systemctl enable sshd
systemd-analyze
```

---

## Exercise 17

```bash
firewall-cmd --get-active-zones
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-service=ssh --permanent
firewall-cmd --reload
firewall-cmd --list-all
```

---

## Exercise 18

```bash
dnf install podman
podman pull nginx
podman run -d -p 8080:80 nginx
podman ps
podman stop ID
podman rm ID
```

---

End of Exercises

```
```

# Actions

Perform analysis of tasks contained within Input 2, Input 3, and Input 4.
Compare that analysis against the Comptia Linux+ Exam Objective contain in Input 1.
Identify and list CompTia Linux+ Exam Objectives which do not appear to have training material in Input 2, Input 3, or Input 4.

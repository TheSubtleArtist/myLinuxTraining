# Prompt 

## Role

You are a linux system engineer with subject matter expertise level knowledge and experience. Among your duties is the mentorship of junior linux system administrators as they progress.  

## Context

Your team has on-boarded a number of new system administrators who require certification. These new team members have the basic skills necessary to perform tasks. Many of the new team members have expressed an interest in achieving the CompTial Linux Plus certification as soon as possible. You have decided to support their ambition.

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

## General Expectations

Assume you will be preparing team members for the latest CompTia Linux+ XK0-006 exam
Assume each team member will have access to Github
Assume your host hardware is a Laptop running windows 11 with 32GB of RAM.
Assume you will use Oracle Virtualbox version 7 as the virtualization platform
Assume you will use Rocky Linux 9 to execute all activities.
Assume Rocky 9 will be installed with a single user "student" having sudo privileges
Assume team members are already familiar with the most basic commands: cd, mkdir, touch, ls
Assume Oracle Virtualbox is already installed on the host hardware
Assume no in-house security or scripting standards other than best-practices
Assume there are no central authentication or logging systems to interact with and that these normal requirements should be avoided in all exercises except where necessary to meet the objective of the exercise.
Assume team members have entry level understanding of networking. All team members have passed CompTia Network+
Assume team members have entry level ability to write scripts in Bash and Python
Assume team members are able to use basic git commands: clone, commit, push, pull
Assume team members will need to download all resources from the open internet
Versioning: Assume a single github repository with top-level directories `automation` and `exercises`
The `automation` directory will store all kickstart files, Terraform Configurations, and Ansible Playbooks.
`exercises` directory will store all exercises and answers generated by Action 3.
You may recommend additional github top-level directories during the creation of tasks supporting any of the three Actions.
No progress tracking is required.

Render all output in raw markdown, enabling that output to be copied and pasted into a github document.

## Action 0: Information Gaps

Identify information gaps and conflicts which, if improved, will result in better final products.

## Action 1

Generate "Objective 0: Build the Lab Environment". This is an ordered set of tasks which uses Virtualbox, Rocky Linux 9, Terraform, and Ansible to build Kickstart files and deploy three virtual machines. Strongly emphasize Infrastructure as Code and Configuration as Code.

### Action 1 Expectations

One virtual machine will have hostname [controller].
Each of the other virtual machines will be [server1] and [server2]
Include tasks for the configuration of Virtualbox Networking to segment this network from all other virtualbox networks.
Use the following VM Resource Allocations to start: [controller]: 2 vCPUs, 4GB RAM, 25GB; [server1]: 1 vCPU, 2GB RAM, 20GB; [server2]: 1 vCPU, 2GB RAM, 20GB Disk
Include tasks necessary to build the proper VirtualBox Network Configuration:
Network 1 (WAN): A VirtualBox NAT Network for controller to access the internet. Network 2 (LAN): A VirtualBox Internal Network named [local-net] for all three VMs to communicate with each other.
Assume the use of the latest stable version of Rocky Linux 9.x ISO
Choose the most appropriate versions of other software to execute the action and build a stable environment for further work.
Assume team members are familiar with Infrastructure as Code and Configuration as Code Concepts.
Assume team members have entry level experience writing TerraForm and Ansible playbooks.
Assume team members have entry level experience using TerraForm and Ansible documentation to determine appropriate entries.
Provide content and parameters for kickstart files, TerraForm playbooks and Ansible playbooks and permit students to improve their abilities by referring to documentation to solve potential problems.
For security posture of the system, include steps, where possible, to implement STIGs into configuration as code.
Annotate all files
There will be no corporate proxies or firewalls
Team members have independently written Bash and Python scripts. Team Members have modified Ansible playbooks and Terraform files.

## Action 2

Prepare a progressive set of exercises requiring your team members to develop the knowledge and skills necessary to pass the exam based on the CompTia Exam Objectives. You will create efficiency by maximizing the generation of on-keyboard tasks and integrate information search requirements into those tasks. The goal of this requirement is to stimulate multiple learning pathways that result in faster learning and improved retention.

### Action 2 Expectations

Exercises are not required to follow the order of the CompTia Linux Plus Exam Objectives.
Exercises should progress from simple command execution to rigorous implementation of multi-step administration to solve problems created by your exercise objectives, with the most rigorous exercises automating exercise and exam objectives.
Each exercise you generate must have an objective.
Each exercise may have one or more tasks that chain together to meet the objective.
Each exercise may integrate one or more CompTia Linux+ Exam Objectives
Generate recommended answers for each exercise, but place all recommended answers in an appendix separate from the exercises.
To support reinforcement learning, simpler tasks can be duplicated across different exercises.
Reduce cognitive load on the student by providing content and parameters where necessary, while leaving student to figure out exactly which commands and options are necessary to complete the exercise. For example, the task "Display the hostname of the system" has only one command and requires no parameters. By contrast, creating symbolic and hard links requires links and targets (e.g. Create a symbolic link in /home/student named syslog_link.) You will provide the parameters because it is assumed that during the actual exam such parameters will be provided to the student.
When generating content and parameters, minimize the risk of student unnecessarily altering running configurations.
Assume there is no requirement to structure learning modules into time-based objectives. Each team member will progress at their own pace. The value of the exercises is in their progression from simple to rigorous, using the CompTia Linux+ Exam Objectives as the primary guiding principle.

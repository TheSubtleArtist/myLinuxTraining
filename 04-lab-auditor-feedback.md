# Linux+ Coverage Gap Analysis for Inputs 2, 3, and 4

## Method used

I compared the training material in:

* **Input 2** — Lab setup exercises
* **Input 3** — Exercise Bank 1
* **Input 4** — Exercise Bank 2

against the **CompTIA Linux+ XK0-006 objectives** in **Input 1**.

I treated an objective as a **gap** when it is:

* not explicitly taught,
* not directly practiced,
* or only implied in passing without enough depth to count as real training coverage.

That means a few items below are technically adjacent to the labs, but still not meaningfully covered.

---

# Overall result

The materials provide **good hands-on coverage** for:

* basic shell usage
* file operations
* users/groups
* permissions
* processes/jobs
* package installation
* systemd basics
* storage basics
* networking basics
* SSH hardening
* firewalld basics
* SELinux basics
* GPG basics
* Podman basics
* Bash scripting basics
* Git basics
* general troubleshooting

However, there are still **substantial objective gaps**, especially in:

* boot process and Linux concepts
* advanced device and storage tooling
* virtualization
* enterprise identity/authentication
* advanced hardening
* cryptography beyond GPG
* compliance/audit tooling
* monitoring concepts
* Python fundamentals
* AI best practices
* orchestration ecosystems beyond Ansible
* advanced container topics
* several networking and performance troubleshooting areas

---

# Exam objectives that do **not appear to have training material**

## 1.0 System Management

### 1.1 Explain Basic Linux Concepts

The following objectives do not appear to be covered:

* **Basic boot process**

  * Bootloader
  * Boot configuration files
  * Kernel parameters
  * Initial RAM disk (**initrd**)
  * PXE

* **Filesystem Hierarchy Standard** items not explicitly trained

  * `/bin`
  * `/dev`
  * `/lib`
  * `/proc`
  * `/sbin`
  * `/tmp`

* **Server architectures**

  * AArch64
  * RISC-V
  * x86
  * x86_64 / AMD64 as architecture families and differences

* **Linux distributions**

  * RPM-based vs dpkg-based comparison

* **GUI stack**

  * Display managers
  * Window managers
  * X Server
  * Wayland

* **Software licensing**

  * Open-source software
  * Free software
  * Proprietary software
  * Copyleft

---

### 1.2 Summarize Linux Device Management Concepts and Tools

Missing or not meaningfully covered:

* **Kernel module tools**

  * `depmod`
  * `insmod`
  * `modinfo`
  * `modprobe`
  * `rmmod`

* **Device/hardware tools**

  * `dmidecode`
  * `ipmitool`
  * `lm_sensors`
  * `lscpu`
  * `lshw`
  * `lsmem`

* **initrd management**

  * `dracut`
  * `mkinitrd`

* **Custom hardware topics**

  * Embedded systems
  * GPU use cases
  * `nvtop`

---

### 1.3 Given a Scenario, Manage Storage in a Linux System

The labs cover basic storage inspection, mounting, and a simple LVM workflow, but these objectives do not appear to be covered:

* **LVM administration beyond the basic create path**

  * `lvchange`
  * `lvdisplay`
  * `lvremove`
  * `lvresize`
  * `lvs`
  * `vgchange`
  * `vgdisplay`
  * `vgexport`
  * `vgextend`
  * `vgimport`
  * `vgremove`
  * `vgs`
  * `vgscan`
  * `pvdisplay`
  * `pvmove`
  * `pvremove`
  * `pvresize`
  * `pvs`
  * `pvscan`

* **Partition tools**

  * `blkid` is lightly implied elsewhere but not clearly trained as a partition-identification task
  * `fdisk`
  * `gdisk`
  * `growpart`
  * `parted`

* **Filesystem formats**

  * `xfs`
  * `btrfs`
  * `tmpfs` as an explicit filesystem type objective

* **Filesystem utilities**

  * `fio`
  * `fsck`
  * `resize2fs`
  * `xfs_growfs`
  * `xfs_repair`

* **RAID**

  * `/proc/mdstat`
  * `mdadm`

* **Mounted storage internals**

  * `/etc/mtab`
  * `/proc/mounts`
  * `autofs`

* **Mount options**

  * `noatime`
  * `nodev`
  * `nodiratime`
  * `noexec`
  * `nofail`
  * `nosuid`
  * `remount`
  * `ro`
  * `rw`

* **Network mounts**

  * NFS
  * SMB / Samba

* **Inodes as a concept**

  * inode usage is touched indirectly, but the underlying inode concept is not explicitly trained

---

### 1.4 Given a Scenario, Manage Network Services and Configurations

Partially covered overall, but these objectives do not appear to have direct training:

* **Network configuration files**

  * `/etc/hosts`
  * `/etc/resolv.conf`
  * `/etc/nsswitch.conf`

* **NetworkManager**

  * `nmcli`
  * `nmconnect`

* **Netplan**

  * `netplan apply`
  * `netplan status`
  * `netplan try`
  * `/etc/netplan`

* **Common network tools not explicitly covered**

  * `arp`
  * `curl`
  * `dig`
  * `ethtool`
  * `iperf3`
  * `mtr`
  * `nc`
  * `nslookup`
  * `ping6`
  * `tracepath`

---

### 1.5 Given a Scenario, Manage a Linux System Using Common Shell Operations

The labs cover a good slice of shell use, but these objectives appear missing:

* **Common environment variables**

  * `DISPLAY`
  * `HOME`
  * `PATH`
  * `PS1`
  * `SHELL`
  * `USER`

* **Shell environment configuration**

  * `.bashrc`
  * `.bash_profile`
  * `.profile`

* **Channel redirection topics not directly trained**

  * standard error redirection
  * standard input redirection
  * `<`
  * `<<`
  * here docs / here strings

* **Basic shell utilities not explicitly trained**

  * `!`
  * `!!`
  * `alias`
  * `bc`
  * `cut`
  * `echo`
  * `history`
  * `less`
  * `more`
  * `printf`
  * `source`
  * `tee`
  * `tr`
  * `uniq`
  * `xargs`

* **Text editors**

  * `vi`
  * `nano`

---

### 1.6 Given a Scenario, Perform Backup and Restore Operations

Covered lightly with `tar` and `gzip`, but these objectives do not appear:

* `cpio`
* `7zip`
* `bzip2`
* `xz`
* `dd`
* `ddrescue`
* `rsync`
* `zcat`
* `zgrep`
* `zless`
* `unzip`

---

### 1.7 Summarize Virtualization on Linux Systems

This is one of the largest gaps. The materials use **VirtualBox**, but the Linux+ objectives are focused on Linux virtualization concepts and tools. Missing coverage includes:

* **Hypervisors**

  * QEMU
  * KVM

* **VM concepts**

  * Paravirtualized drivers
  * VirtIO
  * Disk image operations

    * convert
    * resize
    * image properties
  * VM states
  * Nested virtualization

* **VM operations**

  * baseline image templates
  * cloning
  * migrations
  * snapshots

* **Deployment types**

  * bare metal
  * virtual machines as a comparative objective

* **Virtual network types**

  * bridged
  * NAT
  * host-only / isolated
  * routed
  * open as formal virtualization networking concepts

* **VM tools**

  * `libvirt`
  * `virsh`
  * `virt-manager`

---

## 2.0 Services and User Management

### 2.1 Given a Scenario, Manage Files and Directories

Basic file operations are covered well, but these items do not clearly appear:

* `diff`

* `sdiff`

* `file`

* `find`

* `locate`

* `rmdir`

* **Device types in `/dev`**

  * block devices
  * character devices
  * special character devices as a concept area

---

### 2.2 Given a Scenario, Perform Local Account Management

Partially covered, but the following appear absent or too thin:

* **Account management commands**

  * `adduser`
  * `deluser`
  * `groupdel`
  * `userdel`
  * `chsh`
  * `groupmod`

* **Listing/account inspection tools not clearly trained**

  * `getent passwd`
  * `groups`
  * `last`
  * `w`
  * `who`
  * `whoami`

* **User profile templates**

  * `/etc/profile`
  * `/etc/skel`

* **Account files as learning objectives**

  * `/etc/group`
  * `/etc/passwd`
  * `/etc/shadow` are referenced, but not really taught as structured account databases

* **Attributes**

  * UID
  * GID
  * EUID
  * EGID

* **Account types**

  * user accounts
  * system accounts
  * service accounts

---

### 2.3 Given a Scenario, Manage Processes and Jobs

The labs cover process listing, job control, backgrounding, priority, kill, cron, and `at`. Missing items include:

* **Process verification tools**

  * `atop`
  * `htop` as a monitoring exercise appears only as a package install/remove target, not a process-analysis exercise
  * `mpstat`
  * `pidstat`
  * `strace`

* **Process identifiers / concepts**

  * PPID

* **Process states**

  * Running
  * Blocked
  * Sleeping
  * Stopped
  * Zombie as a formal state model

* **Scheduling**

  * `anacron`

* **Signals as named objectives**

  * HUP (1)
  * KILL (9)
  * TERM (15)

---

### 2.4 Given a Scenario, Configure and Manage Software

The materials cover repo enablement, package install/remove, and provider lookup, but these objectives appear missing:

* **Software sources**

  * install from source

* **Package concepts**

  * package dependencies
  * package conflicts

* **Package managers**

  * `pip`
  * `cargo`
  * `npm`

* **Repository management**

  * enabling/disabling repos as an operational skill is lightly present
  * third-party repositories are touched via EPEL, but not taught as a reusable objective
  * GPG signatures are not covered

* **Other package topics**

  * package exclusions
  * update alternatives
  * sandboxed applications

* **Common services management**

  * DNS
  * NTP / PTP
  * DHCP
  * HTTP (Apache, Nginx) is only lightly touched
  * SMTP
  * IMAP4

---

### 2.5 Given a Scenario, Manage Linux Using systemd

The labs cover status/start/stop/restart/enable/disable plus some `journalctl`, but these objectives are missing:

* **Systemd unit types**

  * timers
  * mounts
  * targets as unit concepts beyond checking boot target

* **Utilities**

  * `hostnamectl`
  * `resolvectl`
  * `sysctl`
  * `systemd-blame`
  * `systemd-resolved`
  * `timedatectl`

* **Unit state management**

  * `daemon-reload`
  * `edit`
  * `mask`
  * `reload`
  * `unmask`

---

### 2.6 Given a Scenario, Manage Containers on Linux

The training covers **basic Podman run lifecycle**. Missing objectives include:

* **Runtimes**

  * `runC`
  * `containerd`
  * Docker

* **Image operations**

  * build images
  * Dockerfile
  * `ENTRYPOINT`
  * `CMD`
  * `USER`
  * `FROM`
  * tags
  * layers
  * pruning

* **Container operations**

  * inspect containers
  * exec
  * logs
  * environment variables

* **Volume operations**

  * create volume
  * map volume
  * pruning
  * SELinux context
  * overlay

* **Container networks**

  * `macvlan`
  * `ipvlan`
  * `host`
  * `bridge`
  * `overlay`
  * `none`

* **Concepts**

  * privileged vs unprivileged containers

---

## 3.0 Security

### 3.1 Summarize Authorization, Authentication, and Accounting Methods

The exercises cover sudo basics and some auditing, but these objectives are largely missing:

* **AAA/authentication technologies**

  * Polkit
  * PAM
  * SSSD
  * LDAP
  * Kerberos
  * Samba
  * Winbind
  * `realm`

* **Logging stack**

  * `rsyslog`
  * `logrotate`
  * `/var/log` as a logging architecture topic rather than just a directory to inspect

* **System audit**

  * `audit.rules`
  * `auditd` as a service/configuration topic

---

### 3.2 Given a Scenario, Configure and Implement Firewalls on a Linux System

Basic `firewalld` usage is present. Missing objectives include:

* **firewalld concepts**

  * runtime vs permanent configuration as a deliberate comparison
  * rich rules
  * ports vs services as a concept area

* **UFW**

  * all `ufw` coverage is absent

* **Other firewall technologies**

  * `nftables`
  * `iptables`
  * `ipset`
  * Netfilter module

* **Address translation**

  * NAT
  * PAT
  * DNAT
  * SNAT

* **Firewall concepts**

  * stateful vs stateless
  * IP forwarding
  * `net.ipv4.ip_forward`

---

### 3.3 Given a Scenario, Apply Operating System Hardening Techniques

This section has some coverage, but many Linux+ hardening items are missing:

* **sudo hardening**

  * `NOEXEC`
  * `NOPASSWD`
  * `/etc/sudoers.d`
  * `visudo`
  * `sudo -i`
  * `wheel group` / `sudo group` as a privilege model topic

* **su**

  * `su -`

* **File attributes**

  * `chattr`
  * `lsattr`
  * immutable
  * append-only

* **Special permissions**

  * sticky bit is not clearly covered

* **SELinux**

  * `semanage`
  * `setenforce`
  * `getsebool`
  * `setsebool`
  * `audit2allow`
  * `sealert`
  * permissive vs disabled vs enforcing as a mode-management topic

* **Secure remote access**

  * SSH tunneling
  * disabling X forwarding
  * `AllowUsers`
  * `AllowGroups`

* **SSH tools**

  * SSH agent
  * SFTP
  * chroot

* **Security tools**

  * `fail2ban`

* **Avoid insecure services**

  * Telnet
  * FTP
  * TFTP

* **Additional hardening**

  * disable unused file systems
  * remove unnecessary SUID permissions as a system hardening program
  * Secure Boot
  * UEFI

---

### 3.4 Explain Account Hardening Techniques and Best Practices

Missing objectives:

* **Password policy**

  * complexity
  * length
  * reuse
  * history

* **Security controls**

  * MFA
  * breach list checking

* **Restricted shells**

  * `/sbin/nologin`
  * `/bin/rbash`

* **Account security**

  * `pam_tally2`
  * avoid running as root as an explicit best-practice topic

---

### 3.5 Explain Cryptographic Concepts and Technologies

Only **basic GPG file encryption/decryption** is covered. Missing objectives include:

* **Data at rest**

  * LUKS2
  * Argon2
  * filesystem encryption concepts

* **Data in transit**

  * OpenSSL
  * WireGuard
  * LibreSSL
  * TLS protocol versions

* **Hashing**

  * SHA-256
  * HMAC

* **Cryptography best practices**

  * remove weak algorithms

* **Certificate management**

  * trusted root certificates
  * no-cost certificates
  * commercial certificates
  * avoid self-signed certificates

---

### 3.6 Explain the Importance of Compliance and Audit Procedures

This section is mostly missing. Gaps include:

* anti-malware

* indicators of compromise (IOC)

* **Vulnerability scanning**

  * CVE
  * CVSS
  * backporting patches
  * service misconfigurations

* **Security tools**

  * protocol analyzers as a formal security tool category
  * port scanners appear in practice, but not within compliance/audit framing

* **Standards and audit**

  * OpenSCAP
  * CIS Benchmarks

* **File integrity**

  * AIDE
  * `rkhunter`
  * signed package verification
  * installed file verification

* **Secure data destruction**

  * `shred`
  * `badblocks -w`
  * `dd if=/dev/urandom`
  * cryptographic destruction

* **Software supply chain**

  * no direct training

* **Security banners**

  * `/etc/issue`
  * `/etc/issue.net`
  * `/etc/motd` is covered, but only one banner file is used

---

## 4.0 Automation, Orchestration, and Scripting

### 4.1 Summarize Automation and Orchestration in Linux

The materials do cover **Ansible**, **Terraform**, and **Kickstart**, which is solid. Missing Linux+ objectives include:

* **Puppet**

  * classes
  * certificates
  * modules
  * facts
  * agent / agentless

* **OpenTofu**

  * provider
  * resource
  * state
  * API

* **Unattended deployment**

  * cloud-init

* **CI/CD**

  * version control is covered via Git
  * shift-left testing
  * GitOps
  * pipelines
  * DevSecOps

* **Deployment orchestration**

  * Kubernetes

    * ConfigMaps
    * Secrets
    * Pods
    * Deployments
    * Volumes
    * Services
    * Variables
  * Docker Swarm

    * service
    * nodes
    * tasks
    * networks
    * scale
  * Docker / Podman Compose

    * compose file
    * `up/down`
    * `logs`

---

### 4.2 Given a Scenario, Perform Automated Tasks Using Shell Scripting

Bash scripting is reasonably covered, but these objectives do not appear explicitly:

* **Expansion**

  * parameter expansion `${var}`
  * command substitution `$(command)`
  * backtick command substitution
  * subshell `(command)`

* **Functions**

  * shell functions are not directly trained

* **Field separators**

  * `IFS`
  * `OFS`

* **Comparisons**

  * full numerical comparison set
  * full string comparison set
  * regex matching `[[ $foo =~ regex ]]`

* **Test commands**

  * `-d`
  * `-n`
  * `-z`
  * `!` as a test operator in shell scripting context

* **Variable commands**

  * `alias`
  * `export`
  * `local`
  * `set`
  * `unalias`
  * `unset`

A few of these may be implicitly used by a student, but they are not actually taught in the materials.

---

### 4.3 Summarize Python Basics for Linux System Administration

This area is essentially absent.

Missing objectives:

* virtual environments
* installing dependencies
* indentation
* current Python versions
* data types

  * Boolean
  * Integer
  * List
  * String
  * Dictionary
  * Floating point
* modules
* packages
* PEP 8

---

### 4.4 Given a Scenario, Implement Version Control Using Git

Git basics are present, but these objectives do not appear or are too thin:

* `checkout`

* `config`

* `diff`

* `fetch`

* `pull`

* `reset`

* `stash`

* `rebase`

* **Merge options**

  * squash merge

---

### 4.5 Summarize Best Practices for Artificial Intelligence

This entire objective appears absent.

Missing coverage:

* code generation
* regex generation
* infrastructure as code generation
* documentation generation
* compliance recommendations
* security review
* code optimization
* code linting
* security of data
* LLM training
* human review
* local models
* private vs public models
* adherence to corporate policy
* prompt engineering
* avoid copy/paste without review
* verify output

---

## 5.0 Troubleshooting

### 5.1 Summarize Monitoring Concepts and Configurations

This is another major gap. Missing objectives:

* **Service monitoring concepts**

  * SLA
  * SLI
  * SLO

* **Data acquisition**

  * SNMP
  * SNMP traps
  * MIBs
  * agent / agentless monitoring
  * webhooks
  * health checks
  * log aggregation

* **Monitoring configuration**

  * thresholds
  * alerts
  * events
  * notifications
  * logging as a monitoring design topic

---

### 5.2 Given a Scenario, Troubleshoot Hardware, Storage, and OS Issues

There is decent troubleshooting coverage overall, but these items do not clearly appear:

* kernel panic
* data corruption
* kernel corruption
* server not turning on
* device failure
* partition not writable as a specific scenario
* GRUB misconfiguration
* killed processes
* PATH misconfiguration
* missing or disabled drivers
* quota issues
* memory leaks

Some are adjacent to general troubleshooting exercises, but they are not actually targeted.

---

### 5.3 Given a Scenario, Troubleshoot Networking Issues

Basic network troubleshooting is present, but these objective gaps remain:

* DHCP issues
* MTU mismatch
* bonding
* MAC spoofing
* subnet issues
* IPv4/IPv6 dual stack issues
* link down as a discrete troubleshooting case
* link negotiation problems
* IP conflicts

---

### 5.4 Given a Scenario, Troubleshoot Security Issues

The exercises cover some security troubleshooting, but these items are not clearly trained:

* misconfigured package repository from a security perspective
* obsolete protocols
* insecure ciphers
* cipher negotiation issues
* certificate issues in any meaningful depth

---

### 5.5 Given a Scenario, Troubleshoot Performance Issues

The materials cover some CPU, memory, disk, and latency checks, but these objectives remain missing or weak:

* swapping
* out of memory
* high load average
* high context switching
* high failed login attempts
* packet drops
* jitter
* random disconnects
* random timeouts
* slow response times as an application/service symptom
* low throughput
* blocked processes
* sluggish terminal behavior
* exceeding baselines
* slow remote storage
* CPU bottleneck

---

# Bottom line

## Strongest covered areas

The current materials are strongest in:

* foundational CLI usage
* file and directory management
* user/group administration
* permissions
* process and job control
* basic package management
* basic networking
* SSH and firewalld basics
* SELinux basics
* basic GPG usage
* Podman basics
* Bash scripting basics
* Git basics
* common troubleshooting workflow
* automation with Ansible/Terraform/Kickstart

## Biggest objective gaps to address next

If the goal is **fuller Linux+ coverage**, the highest-priority additions should be:

1. **Boot process and Linux concepts**
2. **Advanced storage, RAID, and filesystem tooling**
3. **Linux virtualization with KVM/libvirt**
4. **Enterprise auth/AAA topics**
5. **Advanced hardening and SSH/SELinux depth**
6. **Cryptography and certificates**
7. **Compliance, auditing, integrity, and vulnerability management**
8. **Monitoring concepts and tooling**
9. **Python fundamentals**
10. **AI best practices**
11. **Advanced container/image/network/volume topics**
12. **CI/CD, Kubernetes, Compose, and orchestration topics**

## Recommendation

The current content is a **solid hands-on lab foundation**, but it is **not yet a complete Linux+ objective map**. To make it certification-ready, the next revision should add a **targeted gap-closure module set** for the missing objectives listed above.

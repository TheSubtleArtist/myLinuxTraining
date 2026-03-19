# Linux+ XK0-006 Training Program

# Section 2 — Lab Environment Architecture

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

### 1. Clone the Repository

```bash
git clone https://github.com/TheSubtleArtist/myLinuxTraining
cd myLinuxTraining
```

### 2. Create Required Directories

```bash
mkdir -p automation/terraform
mkdir -p automation/ansible
mkdir -p automation/kickstart
mkdir -p exercises
mkdir -p docs
```

### 3. Create `.gitignore`

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

### 4. Add VirtualBox to PATH

```powershell
$env:Path += ";C:\Program Files\VirtualBox"
VBoxManage --version
```

### 5. Download Rocky Linux ISO

Place the image at:

```text
automation/terraform/iso/Rocky-9.7-x86_64-minimal.iso
```

### 6. Create Host-Only Network

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

# Section 3 — Progressive Exercise Curriculum

## Curriculum Structure

The progressive curriculum is organized into 10 modules of 10 exercises each. Exercises begin with single-command validation tasks and progress toward multi-step administrative workflows.

---

## Module 1 — Linux Foundations

### Exercise 1.1 — Verify System Identity

**Objective**

Confirm basic operating system and host identity details.

**Tasks**

1. Display the hostname.
2. Display the currently logged-in user.
3. Display kernel name and kernel release.
4. Display machine architecture.

**Optional Challenge Tasks**

1. Display distribution release details.
2. Compare kernel release to OS release.

---

### Exercise 1.2 — Explore the Filesystem Hierarchy

**Objective**

Identify major directories in the Filesystem Hierarchy Standard.

**Tasks**

1. List the contents of `/`.
2. List the contents of `/etc`, `/usr`, and `/var`.
3. Identify the purpose of `/boot`.
4. Identify the purpose of `/proc`.
5. Identify where user home directories are stored.

**Optional Challenge Tasks**

1. Determine which FHS directories are typically writable during runtime.
2. Document one example file from each directory.

---

### Exercise 1.3 — Inspect Shell Environment Variables

**Objective**

Work with standard shell environment variables.

**Tasks**

1. Display the values of `HOME`, `PATH`, `USER`, `SHELL`, and `PS1`.
2. Temporarily modify `PATH`.
3. Start a new shell and verify whether the temporary change persists.

**Optional Challenge Tasks**

1. Add a persistent alias in `.bashrc`.
2. Reload the shell configuration without logging out.

---

### Exercise 1.4 — Practice Absolute and Relative Paths

**Objective**

Use path navigation safely and predictably.

**Tasks**

1. Navigate to `/home/student`.
2. Create `~/linuxplus/module1`.
3. Move into the new directory using a relative path.
4. Return to the previous directory using shell shorthand.
5. Move to the parent directory using a relative path.

**Optional Challenge Tasks**

1. Demonstrate the difference between `~`, `.`, `..`, and `-`.
2. Record the current working directory after each navigation step.

---

### Exercise 1.5 — Use Redirection and Pipelines

**Objective**

Capture, append, and pipe command output.

**Tasks**

1. Save the output of `uname -a` to a file in `/tmp`.
2. Append the output of `date` to the same file.
3. Redirect standard error from a failing command into a separate file.
4. Pipe the output of `ip address` through `grep`.

**Optional Challenge Tasks**

1. Use a here-document to create a multi-line file.
2. Combine standard output and standard error into one log file.

---

### Exercise 1.6 — Search and Filter Text

**Objective**

Use shell utilities to process structured text.

**Tasks**

1. Display the first five lines of `/etc/passwd`.
2. Display the last five lines of `/etc/passwd`.
3. Extract usernames from `/etc/passwd`.
4. Sort the usernames alphabetically.
5. Count total user entries.

**Optional Challenge Tasks**

1. Remove duplicate values from a test file using `sort` and `uniq`.
2. Use `awk` to display usernames and shells only.

---

### Exercise 1.7 — Review Shell History and Aliases

**Objective**

Use interactive shell productivity features.

**Tasks**

1. Display command history.
2. Re-run the previous command using history expansion.
3. Create an alias for a commonly used command.
4. Source the current shell configuration file.

**Optional Challenge Tasks**

1. Create a persistent alias in `.bash_profile` or `.bashrc`.
2. Remove a temporary alias.

---

### Exercise 1.8 — Edit Text in the Terminal

**Objective**

Modify a configuration-style text file with a terminal editor.

**Tasks**

1. Create `/home/student/linuxplus/module1/notes.txt`.
2. Open the file in `vim` or `nano`.
3. Add at least five lines of text.
4. Save the file and exit the editor.
5. Display the file contents.

**Optional Challenge Tasks**

1. Search for a word inside the editor.
2. Copy and paste one line within the editor.

---

### Exercise 1.9 — Compare Distribution and Packaging Families

**Objective**

Identify the host package ecosystem and distribution family.

**Tasks**

1. Determine whether the system is RPM-based or dpkg-based.
2. Identify the package manager in use.
3. List enabled repositories or package sources.
4. Record one package installed on the system.

**Optional Challenge Tasks**

1. Compare RPM-based and dpkg-based workflows in a notes file.
2. Record repository metadata locations.

---

### Exercise 1.10 — Review Linux Licensing Concepts

**Objective**

Relate installed software to licensing categories.

**Tasks**

1. Identify one open-source package installed on the host.
2. Identify one package with a copyleft license if available.
3. Identify one proprietary application installed on the workstation or host platform.
4. Document the difference between open-source, free software, copyleft, and proprietary software.

**Optional Challenge Tasks**

1. Record the license metadata of a package using package tooling.
2. Compare the redistribution implications of GPL and permissive licenses.

---

## Module 2 — Boot, Kernel, and Device Management

### Exercise 2.1 — Inspect Boot Targets and Boot Duration

**Objective**

Examine the system boot path and startup timing.

**Tasks**

1. Display the default boot target.
2. Display the current boot target.
3. Display boot timing analysis.
4. Identify the slowest units during boot.

**Optional Challenge Tasks**

1. Record which service contributes most to boot delay.
2. Compare boot timing before and after disabling a nonessential service.

---

### Exercise 2.2 — Review Bootloader Configuration

**Objective**

Identify the bootloader and its configuration artifacts.

**Tasks**

1. Determine which bootloader is installed.
2. Locate the primary bootloader configuration file.
3. Identify the default kernel entry.
4. Record the currently selected kernel command line.

**Optional Challenge Tasks**

1. Compare static GRUB defaults with the active boot entry.
2. Document where bootloader environment variables are stored.

---

### Exercise 2.3 — Inspect Kernel Parameters

**Objective**

Read and interpret runtime kernel parameters.

**Tasks**

1. Display the current kernel command line.
2. Display at least five runtime `sysctl` parameters.
3. Identify the parameter controlling IPv4 forwarding.
4. Temporarily enable IPv4 forwarding.
5. Revert the change.

**Optional Challenge Tasks**

1. Persist the setting in a dedicated configuration file.
2. Explain the difference between boot parameters and `sysctl` parameters.

---

### Exercise 2.4 — Inspect initrd or initramfs Artifacts

**Objective**

Locate the initial RAM disk used during boot.

**Tasks**

1. Locate the initrd or initramfs image for the running kernel.
2. Determine the file size of the image.
3. Identify the associated kernel version.
4. Record the purpose of initrd/initramfs in the boot process.

**Optional Challenge Tasks**

1. Inspect the image contents using an appropriate tool if available.
2. Compare the naming convention across installed kernels.

---

### Exercise 2.5 — Gather CPU and Memory Hardware Details

**Objective**

Use hardware discovery tools and `/proc` to inspect the platform.

**Tasks**

1. Display CPU model information.
2. Determine the number of logical CPUs.
3. Determine total installed memory.
4. Display memory usage in human-readable form.
5. Record the hardware architecture.

**Optional Challenge Tasks**

1. Compare `lscpu` output with `/proc/cpuinfo`.
2. Record hypervisor or virtualization indicators if present.

---

### Exercise 2.6 — Inspect PCI, USB, and Platform Devices

**Objective**

Survey connected hardware and buses.

**Tasks**

1. List PCI devices.
2. Identify the network adapter in the PCI list.
3. List USB devices.
4. Display platform or motherboard details using a hardware inventory tool.

**Optional Challenge Tasks**

1. Record the storage controller model.
2. Compare `lspci`, `lsusb`, and `lshw` output for device naming consistency.

---

### Exercise 2.7 — Review Kernel Modules

**Objective**

Inspect loaded modules and their metadata.

**Tasks**

1. List loaded kernel modules.
2. Identify the module associated with the primary network adapter.
3. Display metadata for that module.
4. Record the module filename on disk.

**Optional Challenge Tasks**

1. Identify module dependencies.
2. Record whether the module is built-in or dynamically loaded.

---

### Exercise 2.8 — Manage a Test Kernel Module

**Objective**

Practice module insertion and removal with a safe module.

**Tasks**

1. Choose a safe, noncritical module available on the system.
2. Load the module with `modprobe`.
3. Confirm that it is loaded.
4. Remove the module.
5. Confirm that it is no longer loaded.

**Optional Challenge Tasks**

1. Compare `modprobe` and `insmod` requirements.
2. Run `depmod` after a module tree change in a sandboxed environment.

---

### Exercise 2.9 — Inspect Kernel and Boot Messages

**Objective**

Use log tools to analyze startup and driver initialization.

**Tasks**

1. Display kernel ring buffer messages.
2. Display logs from the current boot.
3. Identify storage-related initialization messages.
4. Identify network interface initialization messages.

**Optional Challenge Tasks**

1. Filter messages by priority.
2. Record one warning and one informational message from boot.

---

### Exercise 2.10 — Review Architecture and Platform Types

**Objective**

Relate the current host to Linux server architecture families.

**Tasks**

1. Determine the current architecture of the VM.
2. Document the difference between `x86`, `x86_64/AMD64`, `AArch64`, and `RISC-V`.
3. Identify which architecture is in use in the lab.
4. Record one use case for each architecture family.

**Optional Challenge Tasks**

1. Compare virtualization support expectations across architectures.
2. Record which architectures are common in cloud, embedded, and workstation workloads.

---

## Module 3 — Storage, Filesystems, and Backup

### Exercise 3.1 — Inspect Block Devices and Filesystems

**Objective**

Enumerate disks, partitions, and filesystems.

**Tasks**

1. List all block devices.
2. Display filesystem types.
3. Identify the root filesystem.
4. Display UUID information for all block devices.

**Optional Challenge Tasks**

1. Map mount points to backing block devices.
2. Record partition labels if present.

---

### Exercise 3.2 — Measure Space and Inode Consumption

**Objective**

Assess filesystem capacity and inode usage.

**Tasks**

1. Display disk usage for all mounted filesystems.
2. Display inode usage for all mounted filesystems.
3. Identify which filesystem contains `/var`.
4. Determine disk usage for `/var`.

**Optional Challenge Tasks**

1. Identify the largest subdirectory under `/var`.
2. Record whether space or inode exhaustion is currently a greater risk.

---

### Exercise 3.3 — Review Partition Layout

**Objective**

Inspect the partition table of the primary disk.

**Tasks**

1. Display the partition table for the primary disk.
2. Record partition sizes.
3. Identify partition table type.
4. Identify any boot-related partition.

**Optional Challenge Tasks**

1. Compare `fdisk`, `gdisk`, and `parted` output styles.
2. Record which partitions are mounted and which are not.

---

### Exercise 3.4 — Create and Mount a Temporary Filesystem

**Objective**

Practice safe mount and unmount operations.

**Tasks**

1. Create `/opt/training_mount`.
2. Mount a `tmpfs` filesystem at that location.
3. Verify the filesystem type.
4. Unmount the filesystem.

**Optional Challenge Tasks**

1. Remount the filesystem read-only.
2. Record the entry format required in `/etc/fstab`.

---

### Exercise 3.5 — Inspect Persistent Mount Configuration

**Objective**

Understand persistent mount behavior.

**Tasks**

1. Display `/etc/fstab`.
2. Identify the root filesystem entry.
3. Compare `/etc/fstab`, `/etc/mtab`, and `/proc/mounts`.
4. Identify one mount option used on the host.

**Optional Challenge Tasks**

1. Explain `ro`, `rw`, `nosuid`, `nodev`, `noexec`, and `nofail`.
2. Record which entries are device-based and which are UUID-based.

---

### Exercise 3.6 — Create an Archive Backup

**Objective**

Protect system data with archiving tools.

**Tasks**

1. Create `/home/student/backups`.
2. Archive `/etc` into a tar file.
3. Compress the archive with `gzip`.
4. Verify the archive contents.
5. Extract the archive into `/tmp/restore`.

**Optional Challenge Tasks**

1. Repeat using `xz`.
2. Compare compressed archive sizes.

---

### Exercise 3.7 — Synchronize Data with `rsync`

**Objective**

Use file-level synchronization for backup and restore workflows.

**Tasks**

1. Create a source directory with sample files.
2. Synchronize the source to a backup directory with `rsync`.
3. Modify one source file.
4. Run `rsync` again and observe the change set.
5. Restore one file from the backup copy.

**Optional Challenge Tasks**

1. Use archive mode and verbose logging.
2. Exclude one file pattern from the sync.

---

### Exercise 3.8 — Create and Manage an LVM Stack

**Objective**

Provision storage using LVM.

**Tasks**

1. Assume a new disk is available as `/dev/sdb`.
2. Create a physical volume.
3. Create a volume group named `vgdata`.
4. Create a logical volume named `lvdata`.
5. Create an `ext4` or `xfs` filesystem.
6. Mount it at `/mnt/data`.

**Optional Challenge Tasks**

1. Extend the logical volume.
2. Grow the filesystem online if supported.

---

### Exercise 3.9 — Inspect and Resize Storage

**Objective**

Expand storage capacity safely.

**Tasks**

1. Display existing PV, VG, and LV details.
2. Extend the logical volume by an additional amount.
3. Resize the filesystem using the appropriate tool.
4. Verify the new size with `df`.

**Optional Challenge Tasks**

1. Record the difference between `resize2fs` and `xfs_growfs`.
2. Document online vs offline resize constraints.

---

### Exercise 3.10 — Create a Raw Disk Image Backup

**Objective**

Understand low-level copy operations.

**Tasks**

1. Create a small test file and convert it into an image-style backup with `dd`.
2. Record block size and copy count used.
3. Validate the copied file size.
4. Document one safe use case and one unsafe use case for `dd`.

**Optional Challenge Tasks**

1. Compare `dd` to `rsync` and `tar`.
2. Record the purpose of `ddrescue`.

---

## Module 4 — Networking and Host Connectivity

### Exercise 4.1 — Inspect Network Interfaces

**Objective**

Identify interfaces and link state.

**Tasks**

1. Display all network interfaces.
2. Identify the NAT-facing adapter.
3. Identify the host-only adapter.
4. Display link state for both interfaces.

**Optional Challenge Tasks**

1. Record interface MAC addresses.
2. Identify MTU values.

---

### Exercise 4.2 — Review IP Addressing and Routing

**Objective**

Validate addressing and path selection.

**Tasks**

1. Display IPv4 addresses on all interfaces.
2. Display the routing table.
3. Identify the default route.
4. Identify the route to the host-only network.

**Optional Challenge Tasks**

1. Record the metric associated with the default route.
2. Determine which interface is used to reach `8.8.8.8`.

---

### Exercise 4.3 — Validate Name Resolution

**Objective**

Inspect DNS resolution behavior.

**Tasks**

1. Display `/etc/hosts`.
2. Display `/etc/resolv.conf`.
3. Display `/etc/nsswitch.conf`.
4. Resolve `rockylinux.org`.
5. Compare `dig`, `nslookup`, and `getent hosts`.

**Optional Challenge Tasks**

1. Create a temporary static host entry and verify resolution precedence.
2. Record how `nsswitch.conf` affects lookup order.

---

### Exercise 4.4 — Use `nmcli` to Inspect Connections

**Objective**

Manage interfaces with NetworkManager.

**Tasks**

1. List NetworkManager connection profiles.
2. Display device status.
3. Identify the profile attached to the host-only interface.
4. Display profile details.

**Optional Challenge Tasks**

1. Rename a connection profile.
2. Record which files or services store connection state.

---

### Exercise 4.5 — Configure a Static Address

**Objective**

Modify a persistent interface configuration.

**Tasks**

1. Use NetworkManager to configure the host-only interface with a static IP.
2. Set the address appropriate for the node.
3. Apply the configuration.
4. Verify the change with `ip address`.

**Optional Challenge Tasks**

1. Add a secondary address.
2. Revert the interface to the original configuration.

---

### Exercise 4.6 — Test Reachability and Latency

**Objective**

Validate connectivity to lab nodes and the internet.

**Tasks**

1. Ping `server1` from `controller`.
2. Ping `server2` from `controller`.
3. Ping `8.8.8.8`.
4. Record packet loss and latency.

**Optional Challenge Tasks**

1. Repeat using IPv6 if configured.
2. Compare results between NAT and host-only reachability.

---

### Exercise 4.7 — Inspect Listening Ports and Sockets

**Objective**

Identify active network services.

**Tasks**

1. Display all listening TCP sockets.
2. Display all listening UDP sockets.
3. Identify the service bound to port 22.
4. Record which address the SSH daemon is listening on.

**Optional Challenge Tasks**

1. Identify established outbound connections.
2. Compare `ss` and `lsof` for socket inspection.

---

### Exercise 4.8 — Capture Traffic with `tcpdump`

**Objective**

Observe packet flow directly.

**Tasks**

1. Capture 10 packets on the host-only interface.
2. Generate traffic with `ping`.
3. Filter the capture to ICMP packets only.
4. Save the capture to a file.

**Optional Challenge Tasks**

1. Read the saved capture back from disk.
2. Capture only traffic to a specific host.

---

### Exercise 4.9 — Diagnose Path and Name Service Issues

**Objective**

Use multiple tools to investigate connectivity failures.

**Tasks**

1. Trace the route to `github.com`.
2. Run `mtr` to the same destination if installed.
3. Use `dig` to resolve the host.
4. Compare IP reachability and DNS reachability results.

**Optional Challenge Tasks**

1. Test a connection to a remote web service using `curl`.
2. Document one failure pattern for DNS and one for routing.

---

### Exercise 4.10 — Perform Basic Port and Service Testing

**Objective**

Validate service availability at the socket level.

**Tasks**

1. Use `nc` to test connectivity to SSH on `server1`.
2. Scan `server1` for open ports with `nmap`.
3. Record which ports are reachable.
4. Compare scan results with `ss` output from the target host.

**Optional Challenge Tasks**

1. Test HTTP connectivity after enabling a web service.
2. Record how host firewalls affect scan results.

---

## Module 5 — Files, Users, Permissions, and Process Control

### Exercise 5.1 — Create and Inspect Files and Directories

**Objective**

Perform core filesystem operations.

**Tasks**

1. Create `/home/student/linuxplus`.
2. Create `file1.txt`, `file2.txt`, and `file3.txt`.
3. Copy one file to `/tmp`.
4. Move one file to `/var/tmp`.
5. Delete one file.
6. Display metadata for the remaining file.

**Optional Challenge Tasks**

1. Use `find` to locate the moved file.
2. Use `stat` to compare timestamps before and after the move.

---

### Exercise 5.2 — Create Symbolic and Hard Links

**Objective**

Understand link behavior and inode relationships.

**Tasks**

1. Create `/home/student/links`.
2. Create `original.txt`.
3. Create a hard link and a symbolic link to it.
4. Display inode numbers.
5. Remove the original file.
6. Determine which link remains usable.

**Optional Challenge Tasks**

1. Record why symbolic and hard links behave differently.
2. Create a symbolic link to a directory.

---

### Exercise 5.3 — Create and Manage Local Users

**Objective**

Create user and group resources safely.

**Tasks**

1. Create user `devuser`.
2. Create group `developers`.
3. Add `devuser` to `developers`.
4. Set a password for `devuser`.
5. Display UID, GID, and group membership.

**Optional Challenge Tasks**

1. Create a system account without a home directory.
2. Compare service accounts and interactive user accounts.

---

### Exercise 5.4 — Manage Account Aging and Login Shells

**Objective**

Apply basic account lifecycle controls.

**Tasks**

1. Set `devuser` to expire in 30 days.
2. Display aging information for the account.
3. Change the user shell.
4. Restore the original shell.

**Optional Challenge Tasks**

1. Assign `/sbin/nologin` to a service-style account.
2. Review default files in `/etc/skel`.

---

### Exercise 5.5 — Review Account Databases

**Objective**

Interpret local account metadata.

**Tasks**

1. Display entries for `devuser` from `/etc/passwd`.
2. Display group information for `developers`.
3. Use `getent` to retrieve account data.
4. Display recent login information.

**Optional Challenge Tasks**

1. Compare `/etc/passwd` and `/etc/shadow` visibility.
2. Record which fields identify UID, GID, home directory, and shell.

---

### Exercise 5.6 — Apply Standard and Special Permissions

**Objective**

Manage ownership and permissions.

**Tasks**

1. Create `/home/student/secure.txt`.
2. Set mode `640`.
3. Change ownership to `devuser`.
4. Change group ownership to `developers`.
5. Create a shared directory.
6. Apply the setgid bit to the directory.

**Optional Challenge Tasks**

1. Demonstrate symbolic and octal `chmod`.
2. Record the effect of `umask` on new files.

---

### Exercise 5.7 — Apply ACLs

**Objective**

Extend permissions beyond standard mode bits.

**Tasks**

1. Create `/opt/security_lab`.
2. Create a file inside it.
3. Grant `analyst` read access with an ACL.
4. Display the ACL configuration.
5. Remove the ACL entry.

**Optional Challenge Tasks**

1. Add a default ACL to a directory.
2. Compare ACL behavior to group-based access.

---

### Exercise 5.8 — Inspect and Control Processes

**Objective**

Monitor running processes and resource usage.

**Tasks**

1. Display running processes.
2. Display the process tree.
3. Identify the PID of `sshd`.
4. Identify the process using the most CPU.
5. Identify the process using the most memory.

**Optional Challenge Tasks**

1. Inspect one process under `/proc/<PID>`.
2. Record parent and child relationships for one service.

---

### Exercise 5.9 — Practice Job Control and Scheduling

**Objective**

Manage foreground and background work.

**Tasks**

1. Start `sleep 600`.
2. Suspend the process.
3. Move it to the background.
4. Display jobs.
5. Return it to the foreground.
6. Terminate it.

**Optional Challenge Tasks**

1. Start a command with `nohup`.
2. Compare `bg`, `fg`, `&`, and `exec`.

---

### Exercise 5.10 — Schedule Recurring and One-Time Tasks

**Objective**

Automate work with `cron` and `at`.

**Tasks**

1. Create a cron job for `student` that appends the date to a log every minute.
2. Verify the cron entry.
3. Schedule a one-time job to create `/home/student/at_test`.
4. Verify the queued job.

**Optional Challenge Tasks**

1. Review system-wide cron locations.
2. Compare `cron`, `anacron`, and `at`.

---

## Module 6 — Software, Services, and systemd

### Exercise 6.1 — Review Enabled Repositories

**Objective**

Inspect package source configuration.

**Tasks**

1. Display enabled repositories.
2. Identify the base OS repository.
3. Identify an optional or extra repository such as EPEL if enabled.
4. Record the repository configuration files used by the system.

**Optional Challenge Tasks**

1. Disable and re-enable a noncritical repository.
2. Record GPG signature enforcement settings.

---

### Exercise 6.2 — Install, Query, and Remove Packages

**Objective**

Manage packages using the platform package manager.

**Tasks**

1. Install `htop`.
2. Install `tree`.
3. Query package information for `bash`.
4. Determine which package provides `/usr/bin/ls`.
5. Remove `tree`.

**Optional Challenge Tasks**

1. Verify package signatures if supported by the platform.
2. Record dependency information for `htop`.

---

### Exercise 6.3 — Use Language-Specific Package Managers

**Objective**

Recognize application-level package management.

**Tasks**

1. Verify whether `pip`, `npm`, or `cargo` is installed.
2. Display the configured version.
3. Install a harmless package into a virtual environment or user scope where appropriate.
4. Record why language package managers are separate from system package managers.

**Optional Challenge Tasks**

1. Compare system-wide versus user-local installs.
2. Record one risk of unmanaged package sprawl.

---

### Exercise 6.4 — Manage SSH Service State

**Objective**

Control a common infrastructure service with systemd.

**Tasks**

1. Display the status of `sshd`.
2. Restart the service.
3. Disable the service.
4. Re-enable the service.
5. Confirm the final enabled state.

**Optional Challenge Tasks**

1. Reload the service if supported.
2. Compare `stop`, `disable`, `mask`, and `status`.

---

### Exercise 6.5 — Inspect Logs with `journalctl`

**Objective**

Use the journal for operational diagnosis.

**Tasks**

1. Display the last 20 journal entries.
2. Display logs for `sshd`.
3. Display logs from the current boot.
4. Filter logs to the last hour.

**Optional Challenge Tasks**

1. Filter by priority.
2. Export logs to a file.

---

### Exercise 6.6 — Inspect Host and Time Management Tools

**Objective**

Use common systemd-adjacent administration tools.

**Tasks**

1. Display detailed hostname information.
2. Display time and timezone configuration.
3. Display resolver status.
4. Record the active NTP state if available.

**Optional Challenge Tasks**

1. Change the timezone and then revert it.
2. Compare `hostnamectl`, `timedatectl`, and `resolvectl`.

---

### Exercise 6.7 — Create a Custom systemd Service

**Objective**

Deploy a simple unit file.

**Tasks**

1. Create a script that writes timestamps to a file.
2. Create a systemd service unit for the script.
3. Reload the systemd daemon.
4. Start the unit.
5. Verify service execution.

**Optional Challenge Tasks**

1. Add restart behavior.
2. Document unit dependencies and target placement.

---

### Exercise 6.8 — Create a systemd Timer

**Objective**

Replace a simple cron workflow with a systemd-native timer.

**Tasks**

1. Create a oneshot service unit for a report script.
2. Create a timer unit that runs it every five minutes.
3. Enable and start the timer.
4. Verify the timer schedule.
5. Review generated output.

**Optional Challenge Tasks**

1. Compare the timer to an equivalent cron job.
2. Record the next and last run times.

---

### Exercise 6.9 — Deploy and Validate an HTTP Service

**Objective**

Install and test a common infrastructure service.

**Tasks**

1. Install `httpd` or `nginx`.
2. Enable and start the service.
3. Confirm that the service is listening.
4. Retrieve the default page locally with `curl`.

**Optional Challenge Tasks**

1. Place a custom index page.
2. Open the required firewall service and retest remotely.

---

### Exercise 6.10 — Review Package and Service Troubleshooting

**Objective**

Correlate package state, service state, and logs.

**Tasks**

1. Verify whether a package is installed.
2. Confirm whether the corresponding service exists.
3. Inspect unit status.
4. Review logs for recent service errors.
5. Record a basic remediation workflow.

**Optional Challenge Tasks**

1. Identify package conflicts or missing dependencies if present.
2. Document the difference between installation failure and runtime failure.

---

## Module 7 — Security, Identity, and Compliance

### Exercise 7.1 — Inspect sudo Policy

**Objective**

Review administrative privilege delegation.

**Tasks**

1. Display effective sudo rights for the current user.
2. Safely inspect `/etc/sudoers`.
3. Identify the administrative group on the system.
4. Create a file under `/etc/sudoers.d` for a lab rule.
5. Validate syntax with `visudo`.

**Optional Challenge Tasks**

1. Add a `NOPASSWD` rule for a specific command.
2. Document the effect of `NOEXEC`.

---

### Exercise 7.2 — Harden SSH Access

**Objective**

Reduce attack surface for remote administration.

**Tasks**

1. Review `/etc/ssh/sshd_config`.
2. Disable root login.
3. Disable password authentication after keys are confirmed.
4. Restart the SSH service.
5. Validate that key-based authentication still works.

**Optional Challenge Tasks**

1. Restrict login with `AllowUsers` or `AllowGroups`.
2. Disable X forwarding.

---

### Exercise 7.3 — Generate and Distribute SSH Keys

**Objective**

Implement key-based remote administration.

**Tasks**

1. Generate an SSH key pair for `student`.
2. Copy the public key to another lab host or account.
3. Test key-based SSH access.
4. Review the SSH agent if available.

**Optional Challenge Tasks**

1. Use SFTP to transfer a file.
2. Document the difference between agent use and direct private key use.

---

### Exercise 7.4 — Review Firewall Zones and Rules

**Objective**

Inspect and modify the host firewall.

**Tasks**

1. Display active firewall zones.
2. Display all rules in the active zone.
3. Add service `ssh` permanently.
4. Add port `8080/tcp` permanently.
5. Reload the firewall.
6. Remove the port rule.

**Optional Challenge Tasks**

1. Compare runtime and permanent configuration.
2. Record the difference between opening a port and opening a service.

---

### Exercise 7.5 — Review SELinux Status and Contexts

**Objective**

Understand SELinux enforcement basics.

**Tasks**

1. Determine whether SELinux is enabled.
2. Identify the current mode.
3. Display SELinux labels for `/var/www/html`.
4. Create a test file and inspect its label.
5. Restore the default context on the file.

**Optional Challenge Tasks**

1. Temporarily switch to permissive mode and revert.
2. Record when `chcon` is preferred versus `semanage`.

---

### Exercise 7.6 — Apply File Attributes and Search Risky Permissions

**Objective**

Use filesystem security controls beyond mode bits.

**Tasks**

1. Create a test file in `/opt/security_lab`.
2. Apply the immutable attribute.
3. Attempt to modify the file.
4. Remove the immutable attribute.
5. Search for world-writable files under `/var`.
6. Search for SUID files on the system.

**Optional Challenge Tasks**

1. Apply and remove the append-only attribute.
2. Document when immutable files are operationally useful.

---

### Exercise 7.7 — Encrypt and Decrypt Data with GPG

**Objective**

Protect data at rest with file-level encryption.

**Tasks**

1. Create `/home/student/secret.txt`.
2. Encrypt the file with GPG.
3. Verify that the encrypted artifact exists.
4. Decrypt the file.
5. Confirm the contents are restored.

**Optional Challenge Tasks**

1. Use symmetric encryption.
2. Record where GPG key material is stored.

---

### Exercise 7.8 — Review Authentication Logs and Failed Logins

**Objective**

Inspect security-relevant log sources.

**Tasks**

1. Review authentication-related logs.
2. Identify recent login attempts.
3. Display failed login history.
4. Record the log source used by the distribution.

**Optional Challenge Tasks**

1. Compare `last`, `lastlog`, and journal-based review.
2. Identify whether repeated failures suggest brute-force behavior.

---

### Exercise 7.9 — Review Audit and Integrity Tooling

**Objective**

Understand host auditing and integrity verification.

**Tasks**

1. Verify whether `auditd` is installed and running.
2. Display existing audit rules.
3. Add a rule to watch `/etc/passwd`.
4. Generate a qualifying change.
5. Search the audit logs for the event.

**Optional Challenge Tasks**

1. Install and initialize AIDE if available.
2. Record the difference between audit trails and integrity baselines.

---

### Exercise 7.10 — Review Compliance and Security Posture

**Objective**

Connect host controls to compliance workflows.

**Tasks**

1. Display the login banner files `/etc/issue`, `/etc/issue.net`, and `/etc/motd`.
2. Verify package signatures or installed file verification if supported.
3. Review available security updates.
4. Record one vulnerability management workflow for the host.

**Optional Challenge Tasks**

1. Install `openscap-scanner` if available and review available content.
2. Document the purpose of CIS Benchmarks and OpenSCAP.

---

## Module 8 — Containers and Virtualization

### Exercise 8.1 — Review Virtualization Capabilities

**Objective**

Determine whether the host supports virtualization-related labs.

**Tasks**

1. Determine whether the system is virtualized.
2. Record the hypervisor type if detectable.
3. Check for CPU virtualization extensions.
4. Document whether nested virtualization is available.

**Optional Challenge Tasks**

1. Record how virtualization extension availability affects KVM labs.
2. Compare bare metal and VM deployment characteristics.

---

### Exercise 8.2 — Inspect VM Concepts and Images

**Objective**

Understand VM resource and image concepts.

**Tasks**

1. Record VM CPU, RAM, storage, and network assignments.
2. Identify the disk image format used by the desktop hypervisor.
3. Document the difference between clone, snapshot, and migration.
4. Record the purpose of paravirtualized drivers and VirtIO.

**Optional Challenge Tasks**

1. Compare NAT, bridged, host-only, and routed virtual networking.
2. Record when open network mode is useful.

---

### Exercise 8.3 — Install Podman

**Objective**

Prepare the host for container workloads.

**Tasks**

1. Install Podman.
2. Verify the installed version.
3. Display Podman system information.
4. Record default storage and network details.

**Optional Challenge Tasks**

1. Compare Podman and Docker daemon models.
2. Record whether the current user can run rootless containers.

---

### Exercise 8.4 — Run and Inspect a Container

**Objective**

Perform a basic container lifecycle workflow.

**Tasks**

1. Pull `docker.io/library/nginx`.
2. Run the container mapping host port `8080` to container port `80`.
3. Verify the container is running.
4. Inspect the container.
5. View its logs.
6. Stop and remove the container.

**Optional Challenge Tasks**

1. Exec into the container and inspect the filesystem.
2. Record container environment variables.

---

### Exercise 8.5 — Build a Custom Image

**Objective**

Create an image from a Dockerfile or Containerfile.

**Tasks**

1. Create a build directory.
2. Write a minimal `Containerfile` using `FROM`, `COPY`, `CMD`, and `USER`.
3. Build the image.
4. Tag the image.
5. Run a container from the new image.

**Optional Challenge Tasks**

1. Compare `ENTRYPOINT` and `CMD`.
2. Record how image layers affect rebuild performance.

---

### Exercise 8.6 — Manage Container Volumes

**Objective**

Persist container data correctly.

**Tasks**

1. Create a named volume.
2. Run a container with the volume mounted.
3. Write data into the mounted path.
4. Remove the container.
5. Start a new container using the same volume and verify persistence.

**Optional Challenge Tasks**

1. Compare bind mounts and named volumes.
2. Record SELinux labeling considerations for volume mounts.

---

### Exercise 8.7 — Explore Container Networks

**Objective**

Understand container connectivity options.

**Tasks**

1. List container networks.
2. Inspect the default bridge network.
3. Run a container using host networking.
4. Run a second container using bridge networking.
5. Compare port exposure behavior.

**Optional Challenge Tasks**

1. Document `macvlan`, `ipvlan`, `overlay`, and `none`.
2. Record security implications of host networking.

---

### Exercise 8.8 — Clean Up Container Resources

**Objective**

Maintain container hygiene.

**Tasks**

1. List stopped containers.
2. List unused images.
3. Prune unused containers.
4. Prune unused images.
5. Record reclaimed space.

**Optional Challenge Tasks**

1. Compare selective removal and pruning.
2. Document risks of aggressive cleanup on shared systems.

---

### Exercise 8.9 — Review KVM and libvirt Tooling

**Objective**

Understand Linux-native virtualization management tooling.

**Tasks**

1. Verify whether KVM-related packages are installed.
2. Verify whether libvirt services are present.
3. Record the role of `virsh` and `virt-manager`.
4. Document the difference between KVM, QEMU, and libvirt.

**Optional Challenge Tasks**

1. Record basic VM state transitions such as running, paused, and shut off.
2. Document when snapshots are appropriate.

---

### Exercise 8.10 — Compare Privileged and Unprivileged Containers

**Objective**

Understand container security boundaries.

**Tasks**

1. Review the concept of privileged versus unprivileged containers.
2. Run an unprivileged container and inspect capabilities.
3. Record what changes in a privileged execution model.
4. Document why least privilege matters in container operations.

**Optional Challenge Tasks**

1. Record one scenario where privileged execution is required.
2. Document safer alternatives to privileged containers.

---

## Module 9 — Automation, Git, Python, and AI-Assisted Administration

### Exercise 9.1 — Write a Basic Bash Report Script

**Objective**

Create a reusable shell script for host reporting.

**Tasks**

1. Create `/home/student/scripts/system_report.sh`.
2. Display hostname, uptime, disk usage, memory usage, and current user.
3. Make the script executable.
4. Run the script.

**Optional Challenge Tasks**

1. Redirect output to a dated report file.
2. Add error handling for missing commands.

---

### Exercise 9.2 — Add Variables and Arguments

**Objective**

Use variables and positional parameters in shell scripts.

**Tasks**

1. Store the hostname in a variable.
2. Accept a directory as an argument.
3. Display disk usage for the provided directory.
4. Display the script return code after execution.

**Optional Challenge Tasks**

1. Use parameter expansion defaults.
2. Exit with a nonzero status when the directory does not exist.

---

### Exercise 9.3 — Use Conditionals and Loops

**Objective**

Implement decision logic and repetition.

**Tasks**

1. Create a script that checks whether a file exists.
2. Add an `if` statement with success and failure output.
3. Add a `for` loop to process files in `/var/log`.
4. Add a `while` or `until` loop for a simple repeated check.

**Optional Challenge Tasks**

1. Add a `case` statement for `start`, `stop`, and `status`.
2. Use a regular expression test in `[[ ]]`.

---

### Exercise 9.4 — Parse Text in Scripts

**Objective**

Combine scripting with text-processing tools.

**Tasks**

1. Extract usernames from `/etc/passwd`.
2. Search logs for `error` case-insensitively.
3. Replace text in a copied log file using `sed`.
4. Count matching lines.

**Optional Challenge Tasks**

1. Use `tee` to both display and save output.
2. Use `xargs` to perform an action on matching files.

---

### Exercise 9.5 — Automate Backups with Cron

**Objective**

Schedule a practical administrative script.

**Tasks**

1. Create a script that archives `/var/log`.
2. Save the archive in `/home/student/backups`.
3. Schedule the script to run daily at `01:00`.
4. Verify the cron entry.

**Optional Challenge Tasks**

1. Add retention logic for old backups.
2. Log success and failure messages.

---

### Exercise 9.6 — Initialize and Commit a Git Repository

**Objective**

Track automation artifacts with version control.

**Tasks**

1. Create `/home/student/linux_lab_repo`.
2. Initialize a Git repository.
3. Add a `.gitignore`.
4. Commit one or more scripts.

**Optional Challenge Tasks**

1. Configure user name and email locally.
2. Add a README describing the repository.

---

### Exercise 9.7 — Use Branches, Merge, and Tags

**Objective**

Practice standard Git workflows.

**Tasks**

1. Create a branch named `feature-monitoring`.
2. Modify a script on that branch.
3. Commit the change.
4. Merge the branch into the main branch.
5. Tag the repository as `v1.0`.

**Optional Challenge Tasks**

1. Use a squash merge.
2. Inspect history before and after the merge.

---

### Exercise 9.8 — Run an Ansible Ad Hoc Command

**Objective**

Use Ansible for remote administration.

**Tasks**

1. Verify the Ansible inventory.
2. Run a ping module against `server1` and `server2`.
3. Run a command module to display uptime on both hosts.
4. Record the results.

**Optional Challenge Tasks**

1. Gather and review Ansible facts.
2. Compare ad hoc commands to playbooks.

---

### Exercise 9.9 — Write an Ansible Playbook

**Objective**

Deploy configuration consistently across servers.

**Tasks**

1. Create `install_tools.yml`.
2. Install `htop`, `git`, and `vim` on `server1` and `server2`.
3. Run the playbook.
4. Verify package installation on both hosts.

**Optional Challenge Tasks**

1. Convert the playbook into a role.
2. Add idempotent service enablement for `sshd` or `httpd`.

---

### Exercise 9.10 — Prepare a Python Administration Environment

**Objective**

Use Python safely for Linux administration tasks.

**Tasks**

1. Create a Python virtual environment.
2. Activate it.
3. Install one Python dependency with `pip`.
4. Create a short Python script that prints hostname information.
5. Record PEP 8 formatting expectations.

**Optional Challenge Tasks**

1. Import a standard library module.
2. Freeze dependencies to a requirements file.

---

## Module 10 — Monitoring, Performance, and Troubleshooting

### Exercise 10.1 — Review Monitoring Concepts

**Objective**

Connect operational monitoring terms to Linux administration.

**Tasks**

1. Define SLA, SLI, and SLO in a notes file.
2. Identify one host metric that can function as an SLI.
3. Identify one alert threshold for disk usage.
4. Identify one event source and one log source on the host.

**Optional Challenge Tasks**

1. Document the difference between threshold alerts and health checks.
2. Record one example of an agent-based and an agentless data source.

---

### Exercise 10.2 — Perform a Basic Health Check

**Objective**

Collect a quick operational baseline.

**Tasks**

1. Display uptime.
2. Display load average.
3. Display CPU and memory use.
4. Display disk use.
5. Display listening services.
6. Display recent critical logs.

**Optional Challenge Tasks**

1. Save the output as a health report.
2. Compare two hosts side by side.

---

### Exercise 10.3 — Diagnose High CPU Usage

**Objective**

Identify a CPU bottleneck.

**Tasks**

1. Identify the highest-CPU process.
2. Record its PID and command.
3. Review its priority.
4. Adjust priority if appropriate.
5. Confirm the effect.

**Optional Challenge Tasks**

1. Use `pidstat` or `mpstat` if installed.
2. Record whether the issue is a single-process spike or sustained load.

---

### Exercise 10.4 — Diagnose High Memory Usage

**Objective**

Identify memory pressure and swap activity.

**Tasks**

1. Display memory usage.
2. Identify the process consuming the most memory.
3. Determine whether swap is in use.
4. Record likely symptoms of memory exhaustion.

**Optional Challenge Tasks**

1. Compare `free`, `top`, and `/proc/meminfo`.
2. Record what an out-of-memory event would look like in logs.

---

### Exercise 10.5 — Diagnose Disk and Inode Exhaustion

**Objective**

Investigate full-filesystem conditions.

**Tasks**

1. Identify the fullest filesystem.
2. Identify inode utilization.
3. Locate large files under `/var`.
4. Record the top space consumers.

**Optional Challenge Tasks**

1. Compare full disk and inode exhaustion symptoms.
2. Record what application failures might appear first.

---

### Exercise 10.6 — Diagnose Network and DNS Issues

**Objective**

Troubleshoot end-to-end reachability problems.

**Tasks**

1. Verify interface status.
2. Verify the routing table.
3. Test IP connectivity to `8.8.8.8`.
4. Test DNS resolution for `google.com`.
5. Record whether the failure is link, route, or DNS related.

**Optional Challenge Tasks**

1. Compare `ping`, `tracepath`, and `dig`.
2. Record one symptom of an MTU mismatch.

---

### Exercise 10.7 — Diagnose Service Failure

**Objective**

Use logs and unit metadata to identify a failing service.

**Tasks**

1. Select a target service such as `sshd` or `httpd`.
2. Display its status.
3. Review recent logs.
4. Identify dependencies.
5. Record a remediation plan.

**Optional Challenge Tasks**

1. Use `systemd-analyze blame` to inspect service startup impact.
2. Record how configuration syntax issues present in logs.

---

### Exercise 10.8 — Diagnose Security Policy Failures

**Objective**

Distinguish permissions, ACL, firewall, and SELinux issues.

**Tasks**

1. Identify a denied access symptom.
2. Verify standard permissions.
3. Verify ACLs.
4. Verify SELinux status and recent denials.
5. Verify firewall policy if a network service is involved.

**Optional Challenge Tasks**

1. Use `audit2allow` in analysis mode if available.
2. Record why temporary disabling is not a valid final fix.

---

### Exercise 10.9 — Diagnose Slow Boot and Startup Delays

**Objective**

Analyze boot performance problems.

**Tasks**

1. Display boot timing.
2. Identify slow units.
3. Review failed units from the current boot.
4. Record one likely optimization target.

**Optional Challenge Tasks**

1. Compare current boot to a previous boot if available.
2. Record one service that should not be disabled even if slow.

---

### Exercise 10.10 — Perform a Full System Health Review

**Objective**

Apply a structured troubleshooting methodology.

**Tasks**

1. Review CPU, memory, storage, network, services, and logs.
2. Identify at least three observations.
3. Classify each observation as normal, warning, or critical.
4. Propose a remediation order.
5. Save the review to a report file.

**Optional Challenge Tasks**

1. Present findings for two hosts and compare their health.
2. Record what additional data would be needed before escalating.

---

# Section 4 — Gap Coverage Exercises

The following exercises are new additions targeting Linux+ objective areas not fully covered by the source materials.

---

## 4.1 Linux Internals

### Gap Exercise G1 — Inspect GRUB Boot Entries and Defaults

**Covers**

* bootloader
* configuration files
* kernel parameters

**Tasks**

1. Identify the GRUB configuration file path on the host.
2. Display configured default boot settings.
3. List available kernel menu entries.
4. Record the active kernel command line.
5. Document how a boot parameter change would be applied safely.

---

### Gap Exercise G2 — Compare initrd and initramfs Lifecycle

**Covers**

* initrd
* `dracut`
* `mkinitrd`

**Tasks**

1. Locate the initramfs image for the running kernel.
2. Identify the tool used by the distribution to build it.
3. Record one scenario that requires rebuilding initramfs.
4. Generate a non-destructive command example to rebuild initramfs.
5. Document the difference between `initrd` and `initramfs`.

---

### Gap Exercise G3 — Document PXE Boot Workflow

**Covers**

* PXE

**Tasks**

1. Document the sequence of a PXE boot from DHCP to installer fetch.
2. Identify the roles of DHCP, TFTP, and the boot image.
3. Relate PXE to Kickstart-based unattended deployment.
4. Record one enterprise use case for PXE.
5. Record one failure point that would prevent network boot.

---

### Gap Exercise G4 — Compare Linux Architecture Families

**Covers**

* AArch64
* RISC-V
* x86
* x86_64/AMD64

**Tasks**

1. Record the architecture of the lab hosts.
2. Document one server use case for each architecture family.
3. Record one limitation or ecosystem consideration for each.
4. Identify which are most common in cloud, embedded, and general-purpose workloads.

---

## 4.2 Kernel and Device Management

### Gap Exercise G5 — Load a Module with `insmod` and `modprobe`

**Covers**

* `insmod`
* `modprobe`
* `modinfo`
* `rmmod`

**Tasks**

1. Select a safe module available on the system.
2. Display module metadata with `modinfo`.
3. Load the module with `modprobe`.
4. Remove it with `rmmod`.
5. Record why `modprobe` is preferred over `insmod` for dependency handling.

---

### Gap Exercise G6 — Refresh Module Dependencies with `depmod`

**Covers**

* `depmod`

**Tasks**

1. Identify the module dependency database location.
2. Run `depmod` in a controlled lab context.
3. Record when dependency regeneration is required.
4. Document the relationship between `depmod` and `modprobe`.

---

### Gap Exercise G7 — Hardware Discovery Deep Dive

**Covers**

* `dmidecode`
* `ipmitool`
* `lm_sensors`
* `lscpu`
* `lshw`
* `lsmem`
* `lspci`
* `lsusb`
* `dmesg`
* custom hardware concepts

**Tasks**

1. Collect hardware data from at least five discovery tools.
2. Record CPU model, memory size, PCI network adapter, and storage controller.
3. Identify whether sensors data is available.
4. Document how BMC/IPMI tooling would fit on physical servers.
5. Record one GPU use case and the purpose of `nvtop`.

---

## 4.3 Advanced Storage

### Gap Exercise G8 — Build a Software RAID Array

**Covers**

* `mdadm`
* `/proc/mdstat`

**Tasks**

1. Add two new lab disks.
2. Create a RAID1 array.
3. Format and mount the array.
4. Verify status using `/proc/mdstat`.
5. Record how to persist the array configuration.

---

### Gap Exercise G9 — Simulate RAID Degradation and Recovery

**Covers**

* RAID troubleshooting

**Tasks**

1. Mark one RAID member as failed.
2. Verify degraded status.
3. Remove the failed member.
4. Re-add the member.
5. Confirm resynchronization progress.

---

### Gap Exercise G10 — Advanced LVM Operations

**Covers**

* `pvmove`
* `pvresize`
* `vgextend`
* `vgchange`
* `vgexport`
* `vgimport`
* `lvchange`

**Tasks**

1. Add a second disk to an existing volume group.
2. Extend the volume group.
3. Move extents from one physical volume to another.
4. Deactivate and reactivate a logical volume.
5. Document `vgexport` and `vgimport` use cases.

---

### Gap Exercise G11 — Filesystem Repair and Recovery

**Covers**

* `fsck`
* `xfs_repair`
* `resize2fs`
* `xfs_growfs`

**Tasks**

1. Create a noncritical test filesystem.
2. Unmount it safely.
3. Run the appropriate repair or check utility.
4. Resize the filesystem according to its type.
5. Record why XFS and ext4 require different workflows.

---

### Gap Exercise G12 — Partition Management with `parted`, `gdisk`, and `growpart`

**Covers**

* partition tools

**Tasks**

1. Create a GPT partition table on a lab disk.
2. Create a partition with `parted` or `gdisk`.
3. Inspect the new layout.
4. Expand the partition with `growpart` if available.
5. Record the difference between MBR and GPT handling.

---

### Gap Exercise G13 — Configure a Network Mount

**Covers**

* NFS
* SMB/Samba
* `autofs`

**Tasks**

1. Export a directory from one server.
2. Mount it on another server.
3. Verify read and write access.
4. Unmount the share.
5. Document how `autofs` differs from static mounts.

---

## 4.4 Network Configuration

### Gap Exercise G14 — Persist Network Configuration with `nmcli`

**Covers**

* `nmcli`
* NetworkManager

**Tasks**

1. Display all connection profiles.
2. Modify DNS servers on the host-only profile.
3. Add a static route.
4. Bring the connection down and back up.
5. Verify the updated runtime state.

---

### Gap Exercise G15 — Review Netplan Configuration Model

**Covers**

* Netplan
* `/etc/netplan`
* `netplan apply`
* `netplan status`
* `netplan try`

**Tasks**

1. Document the purpose of Netplan on Ubuntu-family systems.
2. Write a sample Netplan YAML for a static interface.
3. Record how `netplan try` protects against lockout.
4. Compare Netplan to NetworkManager and traditional config files.

---

### Gap Exercise G16 — Advanced Network Diagnostics

**Covers**

* `arp`
* `ethtool`
* `iperf3`
* `mtr`
* `tracepath`
* `traceroute`

**Tasks**

1. Display neighbor or ARP information.
2. Inspect NIC speed and negotiation.
3. Generate throughput measurements between lab nodes with `iperf3`.
4. Compare `mtr`, `tracepath`, and `traceroute`.
5. Record one symptom of link negotiation failure.

---

### Gap Exercise G17 — DNS Troubleshooting Workflow

**Covers**

* DNS troubleshooting
* `/etc/hosts`
* `/etc/resolv.conf`
* `/etc/nsswitch.conf`

**Tasks**

1. Break and restore name resolution in a controlled way.
2. Test lookup behavior with static host entries.
3. Test DNS server reachability separately from hostname resolution.
4. Document the order of investigation for DNS issues.

---

## 4.5 Virtualization

### Gap Exercise G18 — Install KVM and libvirt Tooling

**Covers**

* QEMU
* KVM
* libvirt
* `virsh`
* `virt-manager`

**Tasks**

1. Install KVM/libvirt tooling on a suitable host.
2. Verify virtualization support.
3. Start and enable the libvirt service.
4. List available networks and storage pools with `virsh`.
5. Document the role of `virt-manager`.

---

### Gap Exercise G19 — Create and Manage a libvirt VM

**Covers**

* baseline image templates
* cloning
* snapshots
* VM states

**Tasks**

1. Import or create a test VM image.
2. Start the VM.
3. Inspect its state.
4. Create a snapshot.
5. Clone the VM from a baseline image.

---

### Gap Exercise G20 — Inspect Disk Image Operations

**Covers**

* convert
* resize
* image properties

**Tasks**

1. Inspect a QCOW2 or RAW image with an image utility.
2. Record image format and virtual size.
3. Resize the image in a test workflow.
4. Document when conversion between image formats is required.

---

### Gap Exercise G21 — Review Nested Virtualization

**Covers**

* nested virtualization

**Tasks**

1. Determine whether nested virtualization is enabled.
2. Record the hypervisor settings needed to support it.
3. Document one use case and one limitation.
4. Relate nested virtualization to KVM lab design.

---

## 4.6 Authentication and Identity

### Gap Exercise G22 — Review PAM Stack Configuration

**Covers**

* PAM

**Tasks**

1. Inspect PAM configuration files related to SSH or login.
2. Identify account, auth, password, and session sections.
3. Record one common PAM security control.
4. Document how PAM affects account lockout or password policy.

---

### Gap Exercise G23 — Review SSSD, LDAP, Kerberos, and realm

**Covers**

* SSSD
* LDAP
* Kerberos
* realm
* winbind
* Samba

**Tasks**

1. Document the roles of LDAP, Kerberos, SSSD, Samba, and Winbind.
2. Inspect whether SSSD is installed.
3. Review a sample `sssd.conf` configuration.
4. Record how `realm join` fits into centralized identity management.
5. Compare local accounts to centralized identities.

---

## 4.7 Security Hardening

### Gap Exercise G24 — SELinux Troubleshooting Deep Dive

**Covers**

* `semanage`
* `chcon`
* `restorecon`
* `getsebool`
* `setsebool`
* `audit2allow`
* `sealert`

**Tasks**

1. Identify a service denied by SELinux in a controlled lab case.
2. Inspect recent denials.
3. Check relevant booleans.
4. Apply the correct context or boolean change.
5. Document why ad hoc policy generation should be reviewed carefully.

---

### Gap Exercise G25 — Account Hardening and Restricted Shells

**Covers**

* password complexity
* history
* expiration
* MFA concepts
* breach-list checking
* `/sbin/nologin`
* `/bin/rbash`
* avoiding root

**Tasks**

1. Review local password aging policy.
2. Assign a restricted shell to a lab account.
3. Verify the account cannot obtain a normal interactive shell.
4. Document the purpose of MFA and breach-list checks.
5. Record why interactive root use should be minimized.

---

### Gap Exercise G26 — Deploy `fail2ban`

**Covers**

* `fail2ban`

**Tasks**

1. Install `fail2ban`.
2. Enable protection for SSH.
3. Review default jail behavior.
4. Simulate or inspect a ban event in a safe lab manner.
5. Record how it complements, but does not replace, firewall policy.

---

### Gap Exercise G27 — Review Secure Boot and UEFI Concepts

**Covers**

* UEFI
* Secure Boot

**Tasks**

1. Determine whether the platform is booted with BIOS or UEFI.
2. Document how Secure Boot validates boot components.
3. Record one operational benefit and one compatibility consideration.
4. Relate Secure Boot to kernel module trust and boot integrity.

---

## 4.8 Cryptography

### Gap Exercise G28 — Create an Encrypted LUKS Volume

**Covers**

* LUKS2
* Argon2

**Tasks**

1. Attach a dedicated lab disk.
2. Create a LUKS2 container.
3. Open the encrypted volume.
4. Create a filesystem inside it.
5. Mount it and verify access.
6. Record where passphrase-based unlocking fits at boot time.

---

### Gap Exercise G29 — Use OpenSSL for Certificates and Hashing

**Covers**

* OpenSSL
* SHA-256
* HMAC
* TLS concepts

**Tasks**

1. Generate a private key.
2. Create a certificate signing request.
3. Generate a self-signed certificate for lab testing.
4. Compute a SHA-256 hash of a file.
5. Document the purpose of HMAC.

---

### Gap Exercise G30 — Review Certificate Management Practices

**Covers**

* trusted roots
* no-cost certificates
* commercial certificates
* self-signed risks
* weak algorithm removal

**Tasks**

1. Inspect the system trust store.
2. Record the role of trusted root certificates.
3. Compare no-cost and commercial certificate workflows.
4. Document why weak algorithms and obsolete TLS versions must be removed.
5. Record why self-signed certificates should be avoided in production.

---

### Gap Exercise G31 — Review Secure Tunnel Concepts

**Covers**

* WireGuard
* LibreSSL
* TLS versions

**Tasks**

1. Document the purpose of WireGuard.
2. Compare TLS 1.2 and TLS 1.3 at a high level.
3. Record the role of cryptographic libraries such as OpenSSL and LibreSSL.
4. Identify insecure legacy protocol versions to avoid.

---

## 4.9 Compliance and Audit

### Gap Exercise G32 — Run an OpenSCAP Evaluation

**Covers**

* OpenSCAP
* CIS Benchmarks

**Tasks**

1. Install OpenSCAP content if available.
2. Review available profiles.
3. Run a non-remediating scan against a baseline profile.
4. Record findings categories.
5. Document how benchmarks support audit preparation.

---

### Gap Exercise G33 — Review Host Integrity and Rootkit Tooling

**Covers**

* AIDE
* `rkhunter`

**Tasks**

1. Install and initialize AIDE if available.
2. Run an integrity check.
3. Install and run `rkhunter` in a safe lab context.
4. Record the difference between integrity drift and malware indicators.

---

### Gap Exercise G34 — Review Vulnerability and Supply Chain Practices

**Covers**

* CVE
* CVSS
* backporting
* signed package verification
* installed file verification
* software supply chain

**Tasks**

1. Inspect package verification capabilities on the platform.
2. Record how a distribution may backport a fix without changing upstream major version numbers.
3. Document how CVE and CVSS are used in prioritization.
4. Record one software supply chain control.

---

### Gap Exercise G35 — Secure Data Destruction Methods

**Covers**

* `shred`
* `badblocks -w`
* `dd if=/dev/urandom`
* cryptographic destruction

**Tasks**

1. Document safe lab use cases for each destruction method.
2. Record which methods are inappropriate on some storage types.
3. Explain cryptographic destruction for encrypted media.
4. Document data sanitization decision criteria.

---

## 4.10 Automation and Orchestration

### Gap Exercise G36 — Ansible Advanced Usage

**Covers**

* inventories
* modules
* collections
* facts
* roles
* agentless

**Tasks**

1. Gather facts from all lab servers.
2. Create a role to install and configure a service.
3. Use variables from `group_vars`.
4. Install a collection.
5. Record how idempotence is verified.

---

### Gap Exercise G37 — Terraform Concepts Review

**Covers**

* providers
* resources
* state
* API

**Tasks**

1. Review the lab Terraform state file behavior.
2. Identify provider and resource blocks in the configuration.
3. Record how state drift can occur.
4. Document why state protection matters operationally.

---

### Gap Exercise G38 — Puppet Overview Lab

**Covers**

* classes
* certificates
* modules
* facts
* agent vs agentless

**Tasks**

1. Document Puppet core architecture.
2. Compare Puppet to Ansible.
3. Record the roles of classes, modules, facts, and certificates.
4. Identify which use cases fit each tool best.

---

### Gap Exercise G39 — Cloud-init Overview and Sample Config

**Covers**

* cloud-init

**Tasks**

1. Document the role of cloud-init in first-boot provisioning.
2. Write a sample cloud-init configuration that creates a user and installs packages.
3. Compare cloud-init and Kickstart.
4. Record where each fits in the deployment lifecycle.

---

### Gap Exercise G40 — Compose and Orchestration Concepts

**Covers**

* Docker/Podman Compose
* Docker Swarm
* Kubernetes concepts

**Tasks**

1. Write a simple Compose file for a web container.
2. Document `up`, `down`, and `logs` workflow.
3. Record the roles of pods, deployments, services, ConfigMaps, and Secrets in Kubernetes.
4. Record the roles of nodes, services, tasks, and networks in Swarm.

---

## 4.11 Containers

### Gap Exercise G41 — Container Security and SELinux Contexts

**Covers**

* SELinux context
* overlay
* privileged vs unprivileged

**Tasks**

1. Run a container with a bind mount on an SELinux-enabled host.
2. Observe access behavior.
3. Apply the correct labeling approach.
4. Record why overlay storage matters.
5. Document the security tradeoffs of privileged containers.

---

### Gap Exercise G42 — Container Networking Deep Dive

**Covers**

* bridge
* host
* macvlan
* ipvlan
* overlay
* none
* port mapping

**Tasks**

1. Inspect default container networking.
2. Compare host and bridge mode behavior.
3. Record the use case for each listed network type.
4. Document how port mapping changes reachability.

---

## 4.12 Monitoring and Performance

### Gap Exercise G43 — Monitoring Data Sources

**Covers**

* SNMP
* SNMP traps
* MIBs
* webhooks
* health checks
* log aggregation

**Tasks**

1. Document the purpose of each monitoring data source.
2. Identify which are pull-based and which are push-based.
3. Record one Linux service example that can provide a health check.
4. Document one log aggregation workflow.

---

### Gap Exercise G44 — Service Monitoring Design

**Covers**

* thresholds
* alerts
* notifications
* events
* SLA/SLI/SLO

**Tasks**

1. Design a monitoring plan for `sshd` and `httpd`.
2. Define one SLI for each service.
3. Define alert thresholds.
4. Define notification severity levels.
5. Record which events should trigger escalation.

---

### Gap Exercise G45 — Performance Analysis: CPU, Memory, Disk, and Network

**Covers**

* CPU bottlenecks
* memory exhaustion
* disk latency
* high I/O wait
* jitter
* latency
* throughput
* packet drops

**Tasks**

1. Capture CPU usage and load metrics.
2. Capture memory usage and swap status.
3. Measure disk I/O behavior with appropriate tools such as `fio` if available.
4. Measure network throughput between hosts with `iperf3`.
5. Record how to distinguish CPU saturation, memory pressure, disk latency, and network instability.

---

# Section 5 — Capstone Scenarios

## Scenario 1 — Broken SSH Access After Hardening

**Situation**

A server that was recently hardened is no longer accessible through SSH.

**Required Skills**

* SSH configuration
* firewall validation
* SELinux validation
* systemd service management
* logs and journal review
* account authorization

**Tasks**

1. Determine whether the failure is network, service, auth, or policy related.
2. Review `sshd_config` and applied hardening changes.
3. Validate `sshd` unit status and logs.
4. Confirm firewall port exposure.
5. Confirm SELinux is not blocking access.
6. Restore secure remote access without weakening controls unnecessarily.

---

## Scenario 2 — Disk Full Production Web Server

**Situation**

An internal web service is unavailable because the filesystem hosting application data is full.

**Required Skills**

* disk usage
* inode usage
* large-file analysis
* service recovery
* backup and cleanup strategy

**Tasks**

1. Determine whether the issue is block-space or inode exhaustion.
2. Identify the top space consumers.
3. Recover enough space safely.
4. Verify service recovery.
5. Recommend a permanent prevention control.

---

## Scenario 3 — SELinux Blocking a Web Application

**Situation**

A web service starts successfully but returns access-related failures when serving content from a nonstandard directory.

**Required Skills**

* SELinux contexts
* booleans
* journal and audit review
* service validation

**Tasks**

1. Confirm the service is running.
2. Review audit and journal data for denials.
3. Determine whether the issue is label-related or boolean-related.
4. Apply the correct persistent SELinux fix.
5. Verify application functionality.

---

## Scenario 4 — Network Outage Between Lab Nodes

**Situation**

`server1` cannot reach `server2` over the host-only network.

**Required Skills**

* interface inspection
* IP addressing
* routing
* firewalls
* packet capture
* DNS and host resolution validation

**Tasks**

1. Determine whether link, addressing, routing, or filtering is at fault.
2. Validate both interface configurations.
3. Validate routes and neighbor information.
4. Use packet capture to confirm whether traffic leaves and returns.
5. Restore host-to-host connectivity.

---

## Scenario 5 — Failed Automated Deployment

**Situation**

A new VM was provisioned, but Kickstart completed only partially and Ansible configuration failed afterward.

**Required Skills**

* Kickstart delivery
* HTTP service validation
* installation logs
* SSH bootstrap
* Ansible inventory and authentication
* troubleshooting methodology

**Tasks**

1. Verify the Kickstart file was served correctly.
2. Review installer or post-install logs.
3. Confirm network addressing on the new VM.
4. Validate Ansible reachability and authentication.
5. Complete the configuration workflow and update documentation.

---

## Scenario 6 — Package Installation Failure During Update Window

**Situation**

A maintenance update fails because of repository issues and conflicting dependencies.

**Required Skills**

* repository management
* package dependencies
* GPG signatures
* package conflict analysis
* journal review

**Tasks**

1. Determine whether the issue is repository, signature, dependency, or network related.
2. Inspect enabled repositories and metadata sources.
3. Review package manager logs or transaction history.
4. Resolve the conflict safely.
5. Verify package health after remediation.

---

## Scenario 7 — Containerized Service Deployment Failure

**Situation**

A new containerized service does not respond on the expected port.

**Required Skills**

* image and container inspection
* logs
* port mapping
* container networks
* firewalls
* SELinux volume labeling

**Tasks**

1. Verify the container is running.
2. Inspect mapped ports and exposed services.
3. Review container logs.
4. Check host firewall policy.
5. Validate volume mounts and SELinux context if content is mounted from the host.
6. Restore service availability.

---

## Scenario 8 — LVM Expansion Did Not Increase Available Space

**Situation**

A logical volume was extended, but the filesystem still reports the old size.

**Required Skills**

* LVM inspection
* filesystem type identification
* resize workflow
* mount awareness

**Tasks**

1. Verify PV, VG, and LV state.
2. Identify the filesystem type on the logical volume.
3. Apply the correct filesystem growth command.
4. Confirm the new size.
5. Record the root cause in operational notes.

---

## Scenario 9 — Slow Boot and Intermittent Service Start Failures

**Situation**

A server takes much longer than normal to boot, and application services sometimes fail during startup.

**Required Skills**

* systemd analysis
* service dependencies
* logs
* storage or network wait diagnosis
* boot target analysis

**Tasks**

1. Identify slow units during boot.
2. Review failed and delayed services.
3. Determine whether the root cause is dependency timing, storage delay, or network readiness.
4. Apply a stable remediation.
5. Validate the next boot.

---

## Scenario 10 — Compromised Security Posture Review

**Situation**

A server is suspected of drift from baseline hardening standards after multiple failed logins and unauthorized configuration changes.

**Required Skills**

* authentication log review
* audit rules
* integrity validation
* sudo policy review
* firewall and SSH hardening review
* update verification

**Tasks**

1. Review failed login activity.
2. Review recent privileged changes.
3. Validate SSH and sudo policy.
4. Validate package and file integrity where possible.
5. Verify update status and exposed services.
6. Produce a remediation and containment summary.

---

# Section 6 — Automation Integration

## 6.1 Automation Objectives

Automation is embedded across the curriculum to reinforce infrastructure-as-code and repeatable operations.

### Integration Goals

* eliminate manual drift
* standardize host configuration
* version changes through Git
* validate infrastructure after each change
* support rapid rebuild after break/fix labs

---

## 6.2 Automation Exercise Set

### Automation Exercise A1 — Build the Lab with Terraform

**Tasks**

1. Initialize the Terraform working directory.
2. Review provider and resource blocks.
3. Plan the deployment.
4. Apply the configuration.
5. Record resulting infrastructure state.

---

### Automation Exercise A2 — Parameterize Terraform Variables

**Tasks**

1. Move VM settings into variables.
2. Add variables for CPU, RAM, and hostnames.
3. Apply a configuration change using a variable file.
4. Record the effect on state and plan output.

---

### Automation Exercise A3 — Serve Kickstart from the Controller

**Tasks**

1. Install and enable the web service on `controller`.
2. Copy Kickstart files into the document root.
3. Validate access to the Kickstart URL.
4. Boot a server using the Kickstart URL.

---

### Automation Exercise A4 — Build a Post-Install Baseline with Ansible

**Tasks**

1. Create a `bootstrap.yml` playbook.
2. Install base packages.
3. Configure SSH keys.
4. Ensure time synchronization and firewall services are present.
5. Run the playbook against all managed nodes.

---

### Automation Exercise A5 — Convert Repeated Tasks into Ansible Roles

**Tasks**

1. Create a `common` role.
2. Move package and SSH tasks into the role.
3. Re-run the playbook.
4. Validate idempotent behavior.

---

### Automation Exercise A6 — Use Git for Infrastructure Changes

**Tasks**

1. Commit the baseline Terraform and Ansible content.
2. Create a feature branch for a lab enhancement.
3. Commit the enhancement.
4. Merge the branch after validation.
5. Tag a lab release.

---

### Automation Exercise A7 — Add Validation Scripts

**Tasks**

1. Create a shell script that validates hostnames, IPs, SSH, and package presence.
2. Run the script after provisioning.
3. Save the output to a report file.
4. Commit the validation script to Git.

---

### Automation Exercise A8 — Build a CI/CD Concept Workflow

**Tasks**

1. Create a repository structure for infrastructure and exercises.
2. Define a simple pipeline concept for linting shell, YAML, and Terraform.
3. Document shift-left validation steps.
4. Record where human review is mandatory.

---

### Automation Exercise A9 — Generate a Golden Baseline Snapshot

**Tasks**

1. Fully configure the three-node environment.
2. Create VirtualBox snapshots for all nodes.
3. Document snapshot naming conventions.
4. Record when to revert and when to rebuild.

---

### Automation Exercise A10 — Document Recovery Through Rebuild

**Tasks**

1. Destroy or discard a noncritical node.
2. Rebuild it using Terraform and Kickstart.
3. Reapply baseline configuration with Ansible.
4. Validate the recovered state.
5. Record the recovery time and lessons learned.

---

# Section 7 — Difficulty Progression

## 7.1 Progression Model

```text
Beginner -> Intermediate -> Advanced -> Scenario-based
```

---

## 7.2 Difficulty Bands by Module

| Stage          | Characteristics                                                                                     | Modules / Activities                       |
| -------------- | --------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| Beginner       | single-command inspection, direct lookup, local host changes                                        | Modules 1, 2, early 3, early 4, early 5    |
| Intermediate   | multi-step workflows, persistence, package/service management, basic automation                     | late 3, 4, 5, 6, early 7, early 8, early 9 |
| Advanced       | policy controls, storage expansion, container lifecycle, identity concepts, orchestrated automation | late 6, 7, 8, 9, gap coverage labs         |
| Scenario-based | incomplete information, cross-domain diagnosis, service restoration                                 | Module 10, Section 5 capstones             |

---

## 7.3 Recommended Learning Path

### Phase 1 — Foundations

* Module 1
* Module 2
* Module 4 basics
* Module 5 basics

### Phase 2 — Core Administration

* Module 3
* Module 5
* Module 6

### Phase 3 — Secure Operations

* Module 7
* targeted Section 4 security and identity labs

### Phase 4 — Modern Linux Operations

* Module 8
* Module 9
* automation integration labs

### Phase 5 — Operations Readiness

* Module 10
* Section 4 gap coverage labs
* Section 5 capstone scenarios

---

## 7.4 Progression Rules for Exercise Design

### Early Exercises

* one tool at a time
* local host only
* explicit task targets
* low-risk changes
* immediate visible results

### Mid-Curriculum Exercises

* combine 2 to 4 tools
* introduce persistence and recovery
* begin multi-host workflows
* require written operational notes

### Late Exercises

* incomplete or noisy symptoms
* multiple valid data sources
* remediation with justification
* security and automation constraints
* restoration of service, not only diagnosis

---

# Section 8 — Instructor Guidance

## 8.1 Recommended Teaching Order

1. Lab build and baseline validation
2. Linux foundations and shell operations
3. boot, device, and kernel concepts
4. storage and backup
5. networking
6. users, permissions, and process control
7. packages, services, and systemd
8. security and compliance
9. containers and virtualization
10. automation, Git, and Python
11. monitoring and troubleshooting
12. capstone scenarios

---

## 8.2 Expected Completion Time

| Training Segment                  | Estimated Time  |
| --------------------------------- | --------------- |
| Lab build and automation baseline | 6 to 10 hours   |
| Modules 1 to 3                    | 12 to 16 hours  |
| Modules 4 to 6                    | 14 to 18 hours  |
| Module 7                          | 12 to 16 hours  |
| Modules 8 and 9                   | 12 to 16 hours  |
| Module 10                         | 8 to 12 hours   |
| Gap coverage labs                 | 16 to 24 hours  |
| Capstone scenarios                | 10 to 15 hours  |
| Total program estimate            | 90 to 127 hours |

---

## 8.3 Suggested Lab Pacing

### Cohort Delivery Model

| Week | Focus                                     |
| ---- | ----------------------------------------- |
| 1    | lab build, Linux foundations              |
| 2    | shell, boot, hardware, filesystems        |
| 3    | storage, backup, networking               |
| 4    | users, permissions, processes, scheduling |
| 5    | packages, services, systemd               |
| 6    | security hardening and firewalls          |
| 7    | identity, crypto, compliance              |
| 8    | containers, virtualization, automation    |
| 9    | Python, Git, AI best practices            |
| 10   | monitoring, troubleshooting, capstones    |

### Self-Paced Model

* target 8 to 12 exercises per week
* require lab notes after each module
* require one rebuild of at least one node
* require at least three incident-style writeups before capstones

---

## 8.4 Instructor Delivery Notes

### Recommended Practices

* require command logging or markdown lab notes
* demonstrate once, then require independent repetition
* review both successful and failed attempts
* use snapshots before destructive labs
* grade for method, not only final state
* require students to justify remediations

### Validation Standards

Students should be able to:

* explain what they changed
* explain why they changed it
* verify the outcome
* revert or recover safely
* document commands used
* identify security implications of the change

---

## 8.5 Optional Advanced Extensions

### Advanced Lab Extensions

* add a fourth VM for client/service-consumer testing
* implement local DNS caching or authoritative DNS
* deploy NFS and Samba cross-host storage workflows
* build a small libvirt/KVM environment on a nested-capable host
* integrate containerized monitoring tools
* test WireGuard in a multi-node design
* perform OpenSCAP baseline comparison before and after hardening
* build a simple Git-based CI validation pipeline for Terraform, Ansible, and shell scripts

---

## 8.6 Assessment Recommendations

### Practical Assessments

* timed command execution labs
* service restoration drills
* written troubleshooting summaries
* Git commit history review
* automation code review
* hardening verification checklist
* end-of-course capstone recovery exercise

### Certification Readiness Indicators

A learner is ready for Linux+ exam preparation review when they can:

* complete baseline administration tasks without reference material
* diagnose common storage, service, and network faults
* apply secure defaults to SSH, sudo, SELinux, and firewalls
* use Ansible and shell scripting to automate repeated work
* explain Linux+ terms and concepts in operational context
* recover a broken lab host through logs, configuration review, and rebuild workflows

---

# Program Summary

```text
Linux+ Training Program
│
├── Objective Map
├── Lab Architecture
├── Progressive Module Exercises
├── Gap Coverage Labs
├── Capstone Scenarios
├── Automation Integration
├── Difficulty Progression
└── Instructor Notes
```

## Coverage Statement

This curriculum is designed to cover the full Linux+ XK0-006 objective set through:

* structured objective mapping
* reproducible lab infrastructure
* progressive hands-on exercises
* targeted gap coverage
* integrated scenario labs
* automation-first workflows
* operational troubleshooting practice

It is intended to function as a complete Linux training repository document for internal administrator development and certification readiness.

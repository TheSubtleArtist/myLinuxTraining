
# Linux+ XK0-006 Training Program - Section 3 — Progressive Exercise Curriculum

- [Linux+ XK0-006 Training Program - Section 3 — Progressive Exercise Curriculum](#linux-xk0-006-training-program---section-3--progressive-exercise-curriculum)
  - [Curriculum](#curriculum)
  - [Module 1 — Linux Foundations](#module-1--linux-foundations)
  - [Module 2 — Boot, Kernel, and Device Management](#module-2--boot-kernel-and-device-management)
  - [Module 3 — Storage, Filesystems, and Backup](#module-3--storage-filesystems-and-backup)
  - [Module 4 — Networking and Host Connectivity](#module-4--networking-and-host-connectivity)
  - [Module 5 — Files, Users, Permissions, and Process Control](#module-5--files-users-permissions-and-process-control)
  - [Module 6 — Software, Services, and systemd](#module-6--software-services-and-systemd)
  - [Module 7 — Security, Identity, and Compliance](#module-7--security-identity-and-compliance)
  - [Module 8 — Containers and Virtualization](#module-8--containers-and-virtualization)
  - [Module 9 — Automation, Git, Python, and AI-Assisted Administration](#module-9--automation-git-python-and-ai-assisted-administration)
  - [Module 10 — Monitoring, Performance, and Troubleshooting](#module-10--monitoring-performance-and-troubleshooting)
  - [Module 11 — Advanced Platform and Storage Operations](#module-11--advanced-platform-and-storage-operations)
  - [Module 12 — Advanced Network, Identity, and Security Operations](#module-12--advanced-network-identity-and-security-operations)
- [Capstone Scenarios](#capstone-scenarios)
  - [Scenario 1 — Broken SSH Access After Hardening](#scenario-1--broken-ssh-access-after-hardening)
  - [Scenario 2 — Disk Full Production Web Server](#scenario-2--disk-full-production-web-server)
  - [Scenario 3 — SELinux Blocking a Web Application](#scenario-3--selinux-blocking-a-web-application)
  - [Scenario 4 — Network Outage Between Lab Nodes](#scenario-4--network-outage-between-lab-nodes)
  - [Scenario 5 — Failed Automated Deployment](#scenario-5--failed-automated-deployment)
  - [Scenario 6 — Package Installation Failure During Update Window](#scenario-6--package-installation-failure-during-update-window)
  - [Scenario 7 — Containerized Service Deployment Failure](#scenario-7--containerized-service-deployment-failure)
  - [Scenario 8 — LVM Expansion Did Not Increase Available Space](#scenario-8--lvm-expansion-did-not-increase-available-space)
  - [Scenario 9 — Slow Boot and Intermittent Service Start Failures](#scenario-9--slow-boot-and-intermittent-service-start-failures)
  - [Scenario 10 — Compromised Security Posture Review](#scenario-10--compromised-security-posture-review)
- [Automation Integration](#automation-integration)
  - [Automation Objectives](#automation-objectives)
  - [Automation Exercise Set](#automation-exercise-set)
- [Difficulty Progression](#difficulty-progression)
  - [Progression Model](#progression-model)
  - [Difficulty Bands by Module](#difficulty-bands-by-module)
  - [Recommended Learning Path](#recommended-learning-path)
  - [Progression Rules for Exercise Design](#progression-rules-for-exercise-design)
- [Instructor Guidance](#instructor-guidance)
  - [Recommended Teaching Order](#recommended-teaching-order)
  - [Expected Completion Time](#expected-completion-time)
  - [Suggested Lab Pacing](#suggested-lab-pacing)
  - [Instructor Delivery Notes](#instructor-delivery-notes)
  - [Optional Advanced Extensions](#optional-advanced-extensions)
  - [Assessment Recommendations](#assessment-recommendations)
- [Program Summary](#program-summary)
  - [Coverage Statement](#coverage-statement)

## Curriculum

The progressive curriculum is organized into **12 modules**. Modules **1 through 10** remain the preserved core certification-aligned learning path. Modules **11 and 12** formalize the advanced-extension material that was previously separated from the mainline sequence.

The curriculum is re-engineered around **VirtualBox and Vagrant for host-side provisioning**, while retaining **Kickstart for installation automation**, **Ansible for configuration automation**, and **Git for version control and iteration**.

Use the following lifecycle vocabulary consistently throughout the program:

```text
prepare -> provision -> install -> configure -> validate -> snapshot -> rebuild
````

**Modules 11 and 12 replace the former standalone gap-coverage section by retaining all non-direct-integration exercises in a structured advanced-extension track.**

This structure preserves the integrity of the original 10-module path while retaining full exercise coverage and keeping capstones after the module sequence.

---

## Module 1 — Linux Foundations

### Module Purpose

Establish baseline Linux fluency through operating system concepts, filesystem hierarchy awareness, shell use, text processing, navigation, and distribution familiarity.

### Core Exercises

#### Exercise 1.1 — Verify System Identity

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

#### Exercise 1.2 — Explore the Filesystem Hierarchy

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

#### Exercise 1.3 — Inspect Shell Environment Variables

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

#### Exercise 1.4 — Practice Absolute and Relative Paths

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

#### Exercise 1.5 — Use Redirection and Pipelines

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

#### Exercise 1.6 — Search and Filter Text

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

#### Exercise 1.7 — Review Shell History and Aliases

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

#### Exercise 1.8 — Edit Text in the Terminal

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

#### Exercise 1.9 — Compare Distribution and Packaging Families

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

#### Exercise 1.10 — Review Linux Licensing Concepts

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

#### Exercise 1.11 — Compare Linux Architecture Families

**Objective**

Relate the current host to Linux server architecture families.

**Tasks**

1. Record the architecture of the lab hosts.
2. Document the difference between `x86`, `x86_64/AMD64`, `AArch64`, and `RISC-V`.
3. Identify which architecture is used in the lab.
4. Record one use case for each architecture family.

**Optional Challenge Tasks**

1. Compare virtualization support expectations across architectures.
2. Record which architectures are common in cloud, embedded, and workstation workloads.

---

## Module 2 — Boot, Kernel, and Device Management

### Module Purpose

Develop fluency in Linux boot stages, kernel behavior, device discovery, module management, and low-level host inspection.

### Core Exercises

#### Exercise 2.1 — Inspect Boot Targets and Boot Duration

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

#### Exercise 2.2 — Review Bootloader Configuration

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

#### Exercise 2.3 — Inspect Kernel Parameters

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

#### Exercise 2.4 — Inspect initrd or initramfs Artifacts

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

#### Exercise 2.5 — Gather CPU and Memory Hardware Details

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

#### Exercise 2.6 — Inspect PCI, USB, and Platform Devices

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

#### Exercise 2.7 — Review Kernel Modules

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

#### Exercise 2.8 — Manage a Test Kernel Module

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

#### Exercise 2.9 — Inspect Kernel and Boot Messages

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

#### Exercise 2.10 — Review Architecture and Platform Types

**Objective**

Interpret platform class and architecture details.

**Tasks**

1. Determine the current architecture of the VM.
2. Review virtualization indicators.
3. Record the boot mode in use.
4. Identify whether secure boot is applicable in the current environment.

**Optional Challenge Tasks**

1. Compare UEFI and BIOS/legacy boot concepts.
2. Record one implication of hosted virtualization for kernel and boot labs.

---

#### Exercise 2.11 — Inspect GRUB Boot Entries and Defaults

**Objective**

Review bootloader defaults and active boot entries.

**Tasks**

1. Identify the GRUB configuration file path on the host.
2. Display configured default boot settings.
3. List available kernel menu entries.
4. Record the active kernel command line.
5. Document how a boot parameter change would be applied safely.

**Optional Challenge Tasks**

1. Compare static defaults and active entries.
2. Record where bootloader environment variables are stored.

---

#### Exercise 2.12 — Compare initrd and initramfs Lifecycle

**Objective**

Understand early userspace boot artifacts and rebuild workflows.

**Tasks**

1. Locate the initramfs image for the running kernel.
2. Identify the tool used by the distribution to build it.
3. Record one scenario that requires rebuilding initramfs.
4. Generate a non-destructive command example to rebuild initramfs.
5. Document the difference between `initrd` and `initramfs`.

**Optional Challenge Tasks**

1. Record a hardware-driver-related rebuild scenario.
2. Compare naming conventions for multiple installed kernels.

---

#### Exercise 2.13 — Load a Module with `insmod` and `modprobe`

**Objective**

Compare direct and dependency-aware kernel module loading.

**Tasks**

1. Select a safe module available on the system.
2. Display module metadata with `modinfo`.
3. Load the module with `modprobe`.
4. Remove it with `rmmod`.
5. Record why `modprobe` is preferred over `insmod` for dependency handling.

**Optional Challenge Tasks**

1. Compare exit behavior for both commands in notes.
2. Record where dependency metadata is stored on disk.

---

## Module 3 — Storage, Filesystems, and Backup

### Module Purpose

Build storage-management confidence across block devices, filesystems, mounts, LVM, RAID, backup, restore, and filesystem repair.

### Core Exercises

#### Exercise 3.1 — Inspect Block Devices and Filesystems

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

#### Exercise 3.2 — Measure Space and Inode Consumption

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

#### Exercise 3.3 — Review Partition Layout

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

#### Exercise 3.4 — Create and Mount a Temporary Filesystem

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

#### Exercise 3.5 — Inspect Persistent Mount Configuration

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

#### Exercise 3.6 — Create an Archive Backup

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

#### Exercise 3.7 — Synchronize Data with `rsync`

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

#### Exercise 3.8 — Create and Manage an LVM Stack

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

#### Exercise 3.9 — Inspect and Resize Storage

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

#### Exercise 3.10 — Create a Raw Disk Image Backup

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

#### Exercise 3.11 — Build a Software RAID Array

**Objective**

Create a software-managed RAID device for storage resilience practice.

**Tasks**

1. Add two new lab disks.
2. Create a RAID1 array.
3. Format and mount the array.
4. Verify status using `/proc/mdstat`.
5. Record how to persist the array configuration.

**Optional Challenge Tasks**

1. Compare RAID1 and RAID0 use cases.
2. Document how boot support differs from data-volume RAID use.

---

#### Exercise 3.12 — Perform Filesystem Repair and Recovery

**Objective**

Practice controlled filesystem verification and repair.

**Tasks**

1. Create a noncritical test filesystem.
2. Unmount it safely.
3. Run the appropriate repair or check utility.
4. Resize the filesystem according to its type.
5. Record why XFS and ext4 require different workflows.

**Optional Challenge Tasks**

1. Compare online and offline resize expectations.
2. Document when repair tools should not be run on mounted filesystems.

---

#### Exercise 3.13 — Manage Partitions with `parted`, `gdisk`, and `growpart`

**Objective**

Use modern partitioning tools safely.

**Tasks**

1. Create a GPT partition table on a lab disk.
2. Create a partition with `parted` or `gdisk`.
3. Inspect the new layout.
4. Expand the partition with `growpart` if available.
5. Record the difference between MBR and GPT handling.

**Optional Challenge Tasks**

1. Compare output styles from `parted`, `fdisk`, and `gdisk`.
2. Record one cloud or VM use case for `growpart`.

---

## Module 4 — Networking and Host Connectivity

### Module Purpose

Develop practical Linux networking skills for interfaces, addressing, routing, DNS, connection management, packet visibility, and service validation.

### Core Exercises

#### Exercise 4.1 — Inspect Network Interfaces

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

#### Exercise 4.2 — Review IP Addressing and Routing

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

#### Exercise 4.3 — Validate Name Resolution

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

#### Exercise 4.4 — Use `nmcli` to Inspect Connections

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

#### Exercise 4.5 — Configure a Static Address

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

#### Exercise 4.6 — Test Reachability and Latency

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

#### Exercise 4.7 — Inspect Listening Ports and Sockets

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

#### Exercise 4.8 — Capture Traffic with `tcpdump`

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

#### Exercise 4.9 — Diagnose Path and Name Service Issues

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

#### Exercise 4.10 — Perform Basic Port and Service Testing

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

#### Exercise 4.11 — Persist Network Configuration with `nmcli`

**Objective**

Use NetworkManager to apply persistent connection settings.

**Tasks**

1. Display all connection profiles.
2. Modify DNS servers on the host-only profile.
3. Add a static route.
4. Bring the connection down and back up.
5. Verify the updated runtime state.

**Optional Challenge Tasks**

1. Record where NetworkManager stores persistent settings.
2. Compare runtime and persistent connection state in notes.

---

## Module 5 — Files, Users, Permissions, and Process Control

### Module Purpose

Build competence in local identity management, permissions, links, process control, and scheduled task execution.

### Core Exercises

#### Exercise 5.1 — Create and Inspect Files and Directories

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

#### Exercise 5.2 — Create Symbolic and Hard Links

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

#### Exercise 5.3 — Create and Manage Local Users

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

#### Exercise 5.4 — Manage Account Aging and Login Shells

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

#### Exercise 5.5 — Review Account Databases

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

#### Exercise 5.6 — Apply Standard and Special Permissions

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

#### Exercise 5.7 — Apply ACLs

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

#### Exercise 5.8 — Inspect and Control Processes

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

#### Exercise 5.9 — Practice Job Control and Scheduling

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

#### Exercise 5.10 — Schedule Recurring and One-Time Tasks

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

### Module Purpose

Develop operational fluency in package management, services, logs, systemd units, timers, and platform-level service troubleshooting.

### Core Exercises

#### Exercise 6.1 — Review Enabled Repositories

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

#### Exercise 6.2 — Install, Query, and Remove Packages

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

#### Exercise 6.3 — Use Language-Specific Package Managers

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

#### Exercise 6.4 — Manage SSH Service State

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

#### Exercise 6.5 — Inspect Logs with `journalctl`

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

#### Exercise 6.6 — Inspect Host and Time Management Tools

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

#### Exercise 6.7 — Create a Custom systemd Service

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

#### Exercise 6.8 — Create a systemd Timer

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

#### Exercise 6.9 — Deploy and Validate an HTTP Service

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

#### Exercise 6.10 — Review Package and Service Troubleshooting

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

### Module Purpose

Build practical security operations skill through hardening, auth review, remote access control, integrity validation, encryption, and compliance-aware administration.

### Core Exercises

#### Exercise 7.1 — Inspect sudo Policy

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

#### Exercise 7.2 — Harden SSH Access

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

#### Exercise 7.3 — Generate and Distribute SSH Keys

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

#### Exercise 7.4 — Review Firewall Zones and Rules

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

#### Exercise 7.5 — Review SELinux Status and Contexts

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

#### Exercise 7.6 — Apply File Attributes and Search Risky Permissions

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

#### Exercise 7.7 — Encrypt and Decrypt Data with GPG

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

#### Exercise 7.8 — Review Authentication Logs and Failed Logins

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

#### Exercise 7.9 — Review Audit and Integrity Tooling

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

#### Exercise 7.10 — Review Compliance and Security Posture

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

#### Exercise 7.11 — Review PAM Stack Configuration

**Objective**

Understand the structure and control flow of Linux authentication modules.

**Tasks**

1. Identify the PAM configuration path used by the distribution.
2. Review the PAM stack for SSH or login.
3. Record the purpose of `required`, `requisite`, `sufficient`, and `optional`.
4. Document one risk of careless PAM changes.

**Optional Challenge Tasks**

1. Compare two PAM service files.
2. Record where PAM failures would surface during troubleshooting.

---

#### Exercise 7.12 — Review NSS and Identity Lookup Behavior

**Objective**

Interpret how local and remote identity lookups are resolved.

**Tasks**

1. Display `nsswitch.conf`.
2. Record the lookup order for users and groups.
3. Use `getent` to retrieve passwd and group entries.
4. Document how NSS affects authentication troubleshooting.

**Optional Challenge Tasks**

1. Compare passwd lookups with host lookups in `nsswitch.conf`.
2. Record one failure mode caused by incorrect NSS ordering.

---

#### Exercise 7.13 — Review SSH Hardening Controls

**Objective**

Evaluate common SSH hardening controls before and after policy changes.

**Tasks**

1. Review effective SSH server settings.
2. Document which settings reduce attack surface most directly.
3. Record one rollback plan before applying hardening.
4. Compare key-only access to password-based access.

**Optional Challenge Tasks**

1. Record one safe validation workflow before restarting `sshd`.
2. Compare `AllowUsers` and `AllowGroups`.

---

#### Exercise 7.14 — Review SELinux Policy Troubleshooting Workflow

**Objective**

Differentiate context, boolean, and policy-level SELinux problems.

**Tasks**

1. Document the difference between a context problem and a boolean problem.
2. Record how to inspect SELinux denials.
3. Explain when `restorecon` is preferred over custom policy work.
4. Record why disabling SELinux is not an acceptable final fix.

**Optional Challenge Tasks**

1. Review the role of `audit2allow` in analysis.
2. Compare temporary and persistent SELinux changes.

---

#### Exercise 7.15 — Review Host Hardening Baseline

**Objective**

Define a minimal server hardening baseline.

**Tasks**

1. Record a minimum hardening baseline for a Linux server.
2. Identify three services or settings to review after installation.
3. Document one recurring validation task for hardening drift.
4. Record one reason to baseline before destructive labs.

**Optional Challenge Tasks**

1. Compare development and production hardening tradeoffs.
2. Record one hardening control that can break service unexpectedly.

---

#### Exercise 7.16 — Inspect Certificates with OpenSSL

**Objective**

Review certificate metadata and basic TLS concepts.

**Tasks**

1. Inspect a certificate file with OpenSSL if available.
2. Record certificate subject, issuer, and expiration.
3. Document the difference between a certificate and a private key.
4. Record one operational risk of expired certificates.

**Optional Challenge Tasks**

1. Compare PEM and DER container formats in notes.
2. Record one service that commonly fails due to certificate expiry.

---

#### Exercise 7.17 — Review Package and File Integrity Validation

**Objective**

Understand integrity validation for installed software and critical files.

**Tasks**

1. Verify package or file integrity using platform-supported tooling.
2. Record one file type that should be monitored for drift.
3. Compare integrity verification to configuration management.
4. Document one incident response use case for integrity checking.

**Optional Challenge Tasks**

1. Compare RPM verification and AIDE-style baselines.
2. Record one false-positive cause in integrity workflows.

---

#### Exercise 7.18 — Review Audit Workflow and Watched Events

**Objective**

Connect audit configuration to investigation and accountability.

**Tasks**

1. Record which events should be audited on a baseline server.
2. Identify one privileged file that should be watched.
3. Compare authentication logs to audit logs.
4. Document one workflow for review after a suspected policy violation.

**Optional Challenge Tasks**

1. Review one example of syscall-centric audit coverage.
2. Record one limitation of incomplete audit rulesets.

---

#### Exercise 7.19 — Review Vulnerability Management Workflow

**Objective**

Relate updates, exposure, and prioritization to operational security.

**Tasks**

1. Record the major steps in a Linux vulnerability management workflow.
2. Identify one source for security update metadata.
3. Document how exposed services affect patch urgency.
4. Record how snapshots and rebuilds support safer remediation.

**Optional Challenge Tasks**

1. Compare routine patching and emergency remediation workflows.
2. Record one rollback consideration before major updates.

---

## Module 8 — Containers and Virtualization

### Module Purpose

Introduce virtualization and container operations in a way that supports both Linux+ coverage and the accepted VirtualBox/Vagrant lab architecture.

### Core Exercises

#### Exercise 8.1 — Review Virtualization Capabilities

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

#### Exercise 8.2 — Inspect VM Concepts and Images

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

#### Exercise 8.3 — Install Podman

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

#### Exercise 8.4 — Run and Inspect a Container

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

#### Exercise 8.5 — Build a Custom Image

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

#### Exercise 8.6 — Manage Container Volumes

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

#### Exercise 8.7 — Explore Container Networks

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

#### Exercise 8.8 — Clean Up Container Resources

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

#### Exercise 8.9 — Review KVM and libvirt Tooling

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

#### Exercise 8.10 — Compare Privileged and Unprivileged Containers

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

#### Exercise 8.11 — Compare Hypervisor Models

**Objective**

Relate hosted and bare-metal virtualization to Linux operations.

**Tasks**

1. Document the difference between Type 1 and Type 2 hypervisors.
2. Record which model the lab uses.
3. Identify one enterprise use case for each model.
4. Document one tradeoff of desktop-hosted virtualization.

**Optional Challenge Tasks**

1. Compare the lab stack to cloud hypervisor abstractions.
2. Record one security implication of each model.

---

#### Exercise 8.12 — Review Virtual Disk and Snapshot Concepts

**Objective**

Understand how disk images, clones, and snapshots affect lab operations.

**Tasks**

1. Record the disk image format used by the lab.
2. Document the difference between full clone and linked clone.
3. Create a notes entry describing when to snapshot and when to rebuild.
4. Record one risk of long-lived snapshot chains.

**Optional Challenge Tasks**

1. Compare snapshot use in labs and production.
2. Record one storage-capacity implication of snapshot growth.

---

#### Exercise 8.13 — Review Virtual Networking Modes

**Objective**

Compare common virtual networking models.

**Tasks**

1. Document the purpose of NAT, bridged, host-only, and internal networking.
2. Record which modes are used in the lab.
3. Compare internet reachability and east-west reachability by mode.
4. Identify one misconfiguration that would break host-only communication.

**Optional Challenge Tasks**

1. Compare Vagrant networking declarations to VirtualBox concepts.
2. Record one reason bridged mode is not the default in this lab.

---

#### Exercise 8.14 — Perform a Container Networking Deep Dive

**Objective**

Extend container-networking understanding beyond basic port publishing.

**Tasks**

1. Inspect default container networking.
2. Compare host and bridge mode behavior.
3. Record the use case for bridge, host, `macvlan`, `ipvlan`, `overlay`, and `none`.
4. Document how port mapping changes reachability.

**Optional Challenge Tasks**

1. Compare rootless and rootful network behavior if available.
2. Record one debugging method for container port collisions.

---

## Module 9 — Automation, Git, Python, and AI-Assisted Administration

### Module Purpose

Build automation fluency across shell scripting, Git workflows, Ansible, Vagrant, Kickstart awareness, Python basics, and responsible AI-assisted operations.

### Core Exercises

#### Exercise 9.1 — Write a Basic Bash Report Script

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

#### Exercise 9.2 — Add Variables and Arguments

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

#### Exercise 9.3 — Use Conditionals and Loops

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

#### Exercise 9.4 — Parse Text in Scripts

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

#### Exercise 9.5 — Automate Backups with Cron

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

#### Exercise 9.6 — Initialize and Commit a Git Repository

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

#### Exercise 9.7 — Use Branches, Merge, and Tags

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

#### Exercise 9.8 — Run an Ansible Ad Hoc Command

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

#### Exercise 9.9 — Write an Ansible Playbook

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

#### Exercise 9.10 — Prepare a Python Administration Environment

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

#### Exercise 9.11 — Review Vagrant Provisioning Concepts

**Objective**

Understand the accepted infrastructure-provisioning model used in the lab.

**Tasks**

1. Review the lab `Vagrantfile`.
2. Identify the settings that control VM names, memory, CPUs, and networking.
3. Record how configuration drift can occur if VirtualBox settings are changed outside Vagrant.
4. Document why version-controlled provisioning improves rebuild consistency.

**Optional Challenge Tasks**

1. Record which Vagrant settings are provider-specific.
2. Compare VM definition and guest configuration responsibilities.

---

#### Exercise 9.12 — Review Vagrant Networking and Synced Folders

**Objective**

Relate Vagrant abstractions to the underlying VirtualBox lab topology.

**Tasks**

1. Identify the Vagrant declarations that map the host-only interfaces.
2. Record how synced folders are presented to the guest.
3. Document one risk of assuming synced folders are a production deployment pattern.
4. Record how the VirtualBox provider underpins the lab topology.

**Optional Challenge Tasks**

1. Compare synced folders to configuration-management file deployment.
2. Record one troubleshooting clue when synced folders do not behave as expected.

---

#### Exercise 9.13 — Review Kickstart Deployment Workflow

**Objective**

Understand how Kickstart fits into the accepted lab lifecycle.

**Tasks**

1. Document the role of `controller` in serving Kickstart files.
2. Record the Kickstart boot parameter used for the managed nodes.
3. Compare semi-automated controller installation to the server install flow.
4. Identify one failure point in the Kickstart delivery path.

**Optional Challenge Tasks**

1. Record one reason the controller-first design is useful for training.
2. Compare unattended install benefits to manual consistency risks.

---

#### Exercise 9.14 — Review Ansible Idempotence and Inventory Design

**Objective**

Strengthen understanding of repeatable configuration workflows.

**Tasks**

1. Review the Ansible inventory and group structure.
2. Record the difference between an ad hoc command and a playbook.
3. Document why idempotence matters after rebuilds.
4. Identify one task that belongs in a role instead of a one-off playbook.

**Optional Challenge Tasks**

1. Compare group vars and host vars usage.
2. Record one symptom of poor inventory design.

---

#### Exercise 9.15 — Review Git-Based Operations Workflow

**Objective**

Use Git as an operational control for infrastructure and automation content.

**Tasks**

1. Document the minimum Git workflow expected for infrastructure and automation content.
2. Record when to branch, when to tag, and when to merge.
3. Compare Git history review to command-line lab notes.
4. Identify one rollback benefit of disciplined commit structure.

**Optional Challenge Tasks**

1. Record one benefit of small commits over infrequent large commits.
2. Compare tags and branches in change-management terms.

---

## Module 10 — Monitoring, Performance, and Troubleshooting

### Module Purpose

Develop a disciplined operations-readiness approach to health review, performance analysis, and Linux troubleshooting.

### Core Exercises

#### Exercise 10.1 — Review Monitoring Concepts

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

#### Exercise 10.2 — Perform a Basic Health Check

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

#### Exercise 10.3 — Diagnose High CPU Usage

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

#### Exercise 10.4 — Diagnose High Memory Usage

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

#### Exercise 10.5 — Diagnose Disk and Inode Exhaustion

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

#### Exercise 10.6 — Diagnose Network and DNS Issues

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

#### Exercise 10.7 — Diagnose Service Failure

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

#### Exercise 10.8 — Diagnose Security Policy Failures

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

#### Exercise 10.9 — Diagnose Slow Boot and Startup Delays

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

#### Exercise 10.10 — Perform a Full System Health Review

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

#### Exercise 10.11 — Review Monitoring Data Sources

**Objective**

Understand common observability inputs used in Linux operations.

**Tasks**

1. Document the purpose of SNMP, SNMP traps, MIBs, webhooks, health checks, and log aggregation.
2. Identify which are pull-based and which are push-based.
3. Record one Linux service example that can provide a health check.
4. Document one log aggregation workflow.

**Optional Challenge Tasks**

1. Compare metrics and logs for troubleshooting value.
2. Record one weakness of relying on a single data source.

---

#### Exercise 10.12 — Design Service Monitoring and Alerting

**Objective**

Define meaningful service checks and operational alerts.

**Tasks**

1. Design a monitoring plan for `sshd` and `httpd`.
2. Define one SLI for each service.
3. Define alert thresholds.
4. Define notification severity levels.
5. Record which events should trigger escalation.

**Optional Challenge Tasks**

1. Compare health checks and performance thresholds.
2. Record one anti-pattern in alert design.

---

#### Exercise 10.13 — Analyze CPU, Memory, Disk, and Network Performance

**Objective**

Use multiple signals to differentiate common bottleneck classes.

**Tasks**

1. Capture CPU usage and load metrics.
2. Capture memory usage and swap status.
3. Measure disk I/O behavior with appropriate tools such as `fio` if available.
4. Measure network throughput between hosts with `iperf3`.
5. Record how to distinguish CPU saturation, memory pressure, disk latency, and network instability.

**Optional Challenge Tasks**

1. Compare throughput and latency-focused measurements.
2. Record how jitter and packet drops affect perceived application health.

---

## Module 11 — Advanced Platform and Storage Operations

### Module Purpose

Extend platform and storage depth after the core path without disrupting the pacing of Modules 1 through 10.

**Modules 11 and 12 replace the former standalone gap-coverage section by retaining all non-direct-integration exercises in a structured advanced-extension track.**

### Exercises

#### Exercise 11.1 — Document PXE Boot Workflow

**Objective**

Understand network-based installation and provisioning concepts.

**Tasks**

1. Document the sequence of a PXE boot from DHCP to installer fetch.
2. Identify the roles of DHCP, TFTP, and the boot image.
3. Relate PXE to Kickstart-based unattended deployment.
4. Record one enterprise use case for PXE.
5. Record one failure point that would prevent network boot.

**Optional Challenge Tasks**

1. Compare PXE to ISO-based installation in the lab.
2. Record one reason PXE is common in fleet provisioning.

---

#### Exercise 11.2 — Refresh Module Dependencies with `depmod`

**Objective**

Understand kernel module dependency metadata and refresh workflows.

**Tasks**

1. Identify the module dependency database location.
2. Run `depmod` in a controlled lab context.
3. Record when dependency regeneration is required.
4. Document the relationship between `depmod` and `modprobe`.

**Optional Challenge Tasks**

1. Record one scenario involving driver updates.
2. Compare dependency-aware and direct module loading in notes.

---

#### Exercise 11.3 — Perform Advanced Hardware Discovery

**Objective**

Use deeper host-inspection tools beyond basic platform review.

**Tasks**

1. Collect hardware data from at least five discovery tools.
2. Record CPU model, memory size, PCI network adapter, and storage controller.
3. Identify whether sensors data is available.
4. Document how BMC/IPMI tooling would fit on physical servers.
5. Record one GPU use case and the purpose of `nvtop`.

**Optional Challenge Tasks**

1. Compare `lshw`, `dmidecode`, and `/proc` as data sources.
2. Record one virtualization limitation for hardware-discovery labs.

---

#### Exercise 11.4 — Simulate RAID Degradation and Recovery

**Objective**

Practice controlled RAID failure handling and member recovery.

**Tasks**

1. Mark one RAID member as failed.
2. Verify degraded status.
3. Remove the failed member.
4. Re-add the member.
5. Confirm resynchronization progress.

**Optional Challenge Tasks**

1. Record one operational caution before simulating failure.
2. Compare rebuild behavior for different RAID levels.

---

#### Exercise 11.5 — Perform Advanced LVM Operations

**Objective**

Use less common LVM workflows for storage migration and lifecycle control.

**Tasks**

1. Add a second disk to an existing volume group.
2. Extend the volume group.
3. Move extents from one physical volume to another.
4. Deactivate and reactivate a logical volume.
5. Document `vgexport` and `vgimport` use cases.

**Optional Challenge Tasks**

1. Compare `pvmove` and traditional data migration.
2. Record one operational risk during storage migration.

---

#### Exercise 11.6 — Configure a Network Mount

**Objective**

Understand shared storage and automount concepts.

**Tasks**

1. Export a directory from one server.
2. Mount it on another server.
3. Verify read and write access.
4. Unmount the share.
5. Document how `autofs` differs from static mounts.

**Optional Challenge Tasks**

1. Compare NFS and SMB use cases.
2. Record one security consideration for shared storage.

---

#### Exercise 11.7 — Review KVM and libvirt Concepts

**Objective**

Compare the lab’s virtualization model to Linux-native virtualization stacks.

**Tasks**

1. Document the role of KVM, QEMU, and libvirt in Linux-native virtualization.
2. Record one task commonly performed with `virsh`.
3. Compare the lab’s VirtualBox stack to a libvirt-based Linux stack.
4. Identify when a nested-capable host would be required.

**Optional Challenge Tasks**

1. Record one benefit of libvirt abstraction.
2. Compare hosted and Linux-native VM administration workflows.

---

## Module 12 — Advanced Network, Identity, and Security Operations

### Module Purpose

Extend network, identity, encryption, and compliance breadth after the core path without disrupting the pacing of Modules 1 through 10.

**Modules 11 and 12 replace the former standalone gap-coverage section by retaining all non-direct-integration exercises in a structured advanced-extension track.**

### Exercises

#### Exercise 12.1 — Review Netplan Configuration Model

**Objective**

Understand cross-platform Linux network configuration beyond Rocky Linux.

**Tasks**

1. Document the purpose of Netplan on Ubuntu-family systems.
2. Write a sample Netplan YAML for a static interface.
3. Record how `netplan try` protects against lockout.
4. Compare Netplan to NetworkManager and traditional config files.

**Optional Challenge Tasks**

1. Record one reason Netplan is not used in the lab baseline.
2. Compare renderer concepts in notes.

---

#### Exercise 12.2 — Perform Advanced Network Diagnostics

**Objective**

Use a wider set of network-analysis tools.

**Tasks**

1. Display neighbor or ARP information.
2. Inspect NIC speed and negotiation.
3. Generate throughput measurements between lab nodes with `iperf3`.
4. Compare `mtr`, `tracepath`, and `traceroute`.
5. Record one symptom of link negotiation failure.

**Optional Challenge Tasks**

1. Compare `arp`/neighbor state across two nodes.
2. Record one case where packet captures are more useful than path tools.

---

#### Exercise 12.3 — Perform a DNS Troubleshooting Workflow

**Objective**

Practice structured name-resolution troubleshooting.

**Tasks**

1. Break and restore name resolution in a controlled way.
2. Test lookup behavior with static host entries.
3. Test DNS server reachability separately from hostname resolution.
4. Document the order of investigation for DNS issues.

**Optional Challenge Tasks**

1. Compare `getent`, `dig`, and `nslookup` roles.
2. Record one way `nsswitch.conf` affects DNS investigation.

---

#### Exercise 12.4 — Review LDAP and Central Identity Concepts

**Objective**

Understand centralized identity in Linux environments.

**Tasks**

1. Document the role of LDAP in enterprise identity management.
2. Record one Linux integration path for LDAP-based identity.
3. Compare local accounts to centralized identity.
4. Record one outage impact of a broken central identity source.

**Optional Challenge Tasks**

1. Compare LDAP and directory-backed SSO at a high level.
2. Record one caching benefit in remote identity designs.

---

#### Exercise 12.5 — Review Kerberos Concepts

**Objective**

Understand ticket-based authentication and time-sensitive identity controls.

**Tasks**

1. Document the purpose of Kerberos tickets.
2. Record the role of the KDC.
3. Explain why clock synchronization matters for Kerberos.
4. Identify one Linux administration workflow that benefits from Kerberos.

**Optional Challenge Tasks**

1. Compare password auth and ticket-based auth from an operator perspective.
2. Record one troubleshooting clue for expired or invalid tickets.

---

#### Exercise 12.6 — Compare Firewall Frameworks

**Objective**

Understand Linux firewall frameworks beyond the lab default.

**Tasks**

1. Document the role of `firewalld`, `nftables`, and `ufw`.
2. Record which firewall framework is primary on Rocky Linux.
3. Compare service-based and port-based rule approaches.
4. Identify one case where runtime changes can diverge from permanent configuration.

**Optional Challenge Tasks**

1. Compare `iptables` legacy concepts to `nftables`.
2. Record one reason policy abstraction can help junior administrators.

---

#### Exercise 12.7 — Review LUKS and Encrypted Storage Concepts

**Objective**

Understand block-level encryption concepts and recovery implications.

**Tasks**

1. Document the role of LUKS in Linux storage protection.
2. Record the difference between file-level and block-level encryption.
3. Identify one use case for encrypting removable or backup media.
4. Record one recovery consideration for encrypted storage.

**Optional Challenge Tasks**

1. Compare key files and passphrases in notes.
2. Record one operational risk of poor key handling.

---

#### Exercise 12.8 — Review WireGuard Concepts

**Objective**

Understand secure host-to-host networking concepts.

**Tasks**

1. Document the role of WireGuard in secure host-to-host connectivity.
2. Record the high-level configuration components required for a peer.
3. Compare VPN reachability to host-only lab reachability.
4. Identify one case where a VPN adds operational value.

**Optional Challenge Tasks**

1. Compare WireGuard and IPsec at a conceptual level.
2. Record one troubleshooting dependency for secure tunnels.

---

#### Exercise 12.9 — Review OpenSCAP Concepts

**Objective**

Understand compliance scanning and benchmark-based assessment.

**Tasks**

1. Document the purpose of OpenSCAP.
2. Record one benchmark source or content type used by OpenSCAP.
3. Compare compliance scanning to vulnerability scanning.
4. Identify one limitation of point-in-time scans.

**Optional Challenge Tasks**

1. Compare CIS-style benchmark thinking to local hardening checklists.
2. Record one case where compliance does not equal operational security.

---

# Capstone Scenarios

Capstones remain after the module sequence and use the same lab environment for incident-style validation, recovery, and rebuild work.

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
4. Apply the least disruptive remediation.
5. Validate restored access.

---

## Scenario 4 — Network Outage Between Lab Nodes

**Situation**

One managed server can reach the internet through NAT, but cannot communicate with the other lab nodes on the host-only network.

**Required Skills**

* interface inspection
* route inspection
* address validation
* firewall review
* connectivity testing

**Tasks**

1. Verify the state of both network interfaces.
2. Confirm addressing on the host-only network.
3. Review routing and local firewall state.
4. Test host-to-host reachability.
5. Restore east-west communication without breaking internet access.

---

## Scenario 5 — Failed Automated Deployment

**Situation**

A baseline automation run did not complete successfully, and two managed nodes are in inconsistent states.

**Required Skills**

* Vagrant workflow review
* Kickstart path validation
* Ansible inventory and playbook review
* logs
* validation discipline

**Tasks**

1. Determine whether the failure originated during `provision`, `install`, or `configure`.
2. Review the `Vagrantfile`, Kickstart delivery path, and Ansible inventory.
3. Identify the first failing step in the workflow.
4. Apply a safe remediation.
5. Re-run validation checks and document the corrected state.

---

## Scenario 6 — Package Installation Failure During Update Window

**Situation**

A critical package update failed and left a service unavailable.

**Required Skills**

* package manager troubleshooting
* repositories
* GPG trust
* logs
* rollback planning

**Tasks**

1. Identify the package operation that failed.
2. Review enabled repositories and package metadata.
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

# Automation Integration

## Automation Objectives

Automation is embedded across the curriculum to reinforce version-controlled infrastructure provisioning, configuration as code, and repeatable operations.

### Integration Goals

* eliminate manual drift
* standardize host configuration
* version changes through Git
* validate infrastructure after each change
* support rapid rebuild after break/fix labs

## Automation Exercise Set

### Automation Exercise A1 — Build the Lab with Vagrant

**Tasks**

1. Initialize the Vagrant working directory.
2. Review the single `Vagrantfile`.
3. Identify the node definitions for `controller`, `server1`, and `server2`.
4. Start the defined VMs.
5. Record the resulting infrastructure state.

---

### Automation Exercise A2 — Parameterize Vagrant Variables

**Tasks**

1. Move VM settings into variables.
2. Add variables for CPU, RAM, hostnames, and synced folder paths.
3. Apply a configuration change using the accepted variable pattern.
4. Record the effect on VM definition behavior.

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

1. Commit the baseline Vagrant and Ansible content.
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
2. Define a simple pipeline concept for linting shell, YAML, and Vagrant-related configuration.
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
2. Rebuild it using Vagrant and Kickstart.
3. Reapply baseline configuration with Ansible.
4. Validate the recovered state.
5. Record the recovery time and lessons learned.

---

# Difficulty Progression

## Progression Model

The curriculum follows a controlled progression:

* early exercises focus on isolated commands and direct verification
* mid-curriculum exercises combine administration tasks with state awareness
* later exercises introduce troubleshooting noise, remediation judgment, and service restoration pressure
* capstones require learners to distinguish root cause from symptoms under operational constraints

Modules 11 and 12 extend breadth after the core path rather than increasing difficulty inside the preserved 10-module sequence.

## Difficulty Bands by Module

| Difficulty Band         | Modules                  | Characteristics                                                                |
| ----------------------- | ------------------------ | ------------------------------------------------------------------------------ |
| foundational fluency    | 1, 2, 4 basics, 5 basics | command fluency, visibility, system interpretation                             |
| core administration     | 3, 5, 6                  | persistence, services, storage, jobs, and recovery                             |
| secure operations       | 7                        | hardening, policy, compliance, and validation                                  |
| modern Linux operations | 8, 9                     | containers, provisioning workflows, automation, and version control            |
| operations readiness    | 10                       | diagnosis, prioritization, restoration, and reporting                          |
| advanced extension      | 11, 12                   | enterprise context, platform depth, identity breadth, and compliance expansion |

## Recommended Learning Path

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

### Phase 4 — Modern Linux Operations

* Module 8
* Module 9
* automation integration labs

### Phase 5 — Operations Readiness

* Module 10
* capstone preparation

### Phase 6 — Advanced Extension

* Module 11
* Module 12

## Progression Rules for Exercise Design

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

### Advanced Extension Exercises

* broader enterprise context
* higher conceptual density
* deeper tooling comparisons
* greater tolerance for platform-specific differences
* enrichment without disruption of the core pacing path

---

# Instructor Guidance

## Recommended Teaching Order

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
12. advanced platform and storage operations
13. advanced network, identity, and security operations
14. capstone scenarios

## Expected Completion Time

| Training Segment                  | Estimated Time   |
| --------------------------------- | ---------------- |
| Lab build and automation baseline | 6 to 10 hours    |
| Modules 1 to 3                    | 12 to 16 hours   |
| Modules 4 to 6                    | 14 to 18 hours   |
| Module 7                          | 12 to 16 hours   |
| Modules 8 and 9                   | 12 to 16 hours   |
| Module 10                         | 8 to 12 hours    |
| Modules 11 and 12                 | 16 to 24 hours   |
| Capstone scenarios                | 10 to 15 hours   |
| Total program estimate            | 106 to 143 hours |

## Suggested Lab Pacing

### Cohort Delivery Model

| Week | Focus                                               |
| ---- | --------------------------------------------------- |
| 1    | lab build, Linux foundations                        |
| 2    | shell, boot, hardware, filesystems                  |
| 3    | storage, backup, networking                         |
| 4    | users, permissions, processes, scheduling           |
| 5    | packages, services, systemd                         |
| 6    | security hardening and firewalls                    |
| 7    | identity, crypto, compliance                        |
| 8    | containers, virtualization, automation              |
| 9    | Python, Git, AI best practices                      |
| 10   | monitoring and troubleshooting                      |
| 11   | advanced platform and storage operations            |
| 12   | advanced network, identity, and security operations |
| 13   | capstones and final validation                      |

### Self-Paced Model

* target 8 to 12 exercises per week through Module 10
* target 4 to 6 advanced-extension exercises per week for Modules 11 and 12
* require lab notes after each module
* require one rebuild of at least one node
* require at least three incident-style writeups before capstones

## Instructor Delivery Notes

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

## Optional Advanced Extensions

### Advanced Lab Extensions

* add a fourth VM for client/service-consumer testing
* implement local DNS caching or authoritative DNS
* deploy NFS and Samba cross-host storage workflows
* build a small libvirt/KVM environment on a nested-capable host
* integrate containerized monitoring tools
* test WireGuard in a multi-node design
* perform OpenSCAP baseline comparison before and after hardening
* build a simple Git-based CI validation pipeline for Vagrant configuration, Ansible, and shell scripts

## Assessment Recommendations

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

### Advanced Readiness Indicators

A learner is ready for advanced follow-on operations work when they can:

* explain enterprise identity and compliance concepts in Linux context
* reason about deeper storage recovery workflows
* compare multiple Linux networking and virtualization models
* integrate advanced concepts without losing procedural discipline

---

# Program Summary

```text
Linux+ Training Program
│
├── Objective Map
├── Lab Architecture
├── Progressive Module Exercises
├── Advanced Extension Modules
├── Capstone Scenarios
├── Automation Integration
├── Difficulty Progression
└── Instructor Notes
```

## Coverage Statement

This program is designed to cover the Linux+ XK0-006 objective set through:

* structured objective mapping
* reproducible lab infrastructure
* progressive hands-on exercises
* integrated advanced-extension modules
* capstone scenarios
* automation-first workflows
* operational troubleshooting practice

The resulting structure removes the standalone gap-coverage section, preserves the integrity of the original 10-module path, and retains full exercise coverage through Modules 11 and 12.

```


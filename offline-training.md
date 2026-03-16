

# Linux Offline Practice Curriculum

- [Assumptions](#assumptions)
- [Exercise 1.1 — Identify System Architecture](#exercise-11--identify-system-architecture)
- [Exercise 1.2 — Inspect CPU Information](#exercise-12--inspect-cpu-information)
- [Exercise 1.3 — Inspect Memory Information](#exercise-13--inspect-memory-information)
- [Exercise 1.4 — Display Hardware Information](#exercise-14--display-hardware-information)
- [Exercise 1.5 — List PCI Devices](#exercise-15--list-pci-devices)
- [Exercise 1.6 — List USB Devices](#exercise-16--list-usb-devices)
- [Exercise 1.7 — Inspect Kernel Modules](#exercise-17--inspect-kernel-modules)
- [Exercise 1.8 — Inspect Boot Messages](#exercise-18--inspect-boot-messages)
- [Exercise 1.9 — Inspect Block Devices](#exercise-19--inspect-block-devices)
- [Exercise 1.10 — Identify Filesystem Types](#exercise-110--identify-filesystem-types)
- [Exercise 1.11 — Inspect Disk Usage](#exercise-111--inspect-disk-usage)
- [Exercise 1.12 — Inspect Mounted Filesystems](#exercise-112--inspect-mounted-filesystems)
- [Exercise 1.13 — Inspect Directory Disk Usage](#exercise-113--inspect-directory-disk-usage)
- [Exercise 1.14 — Identify Largest Log Files](#exercise-114--identify-largest-log-files)
- [Exercise 1.15 — Inspect Partition Table](#exercise-115--inspect-partition-table)
- [Exercise 1.16 — Mount a Temporary Filesystem](#exercise-116--mount-a-temporary-filesystem)
- [Exercise 1.17 — Unmount Filesystem](#exercise-117--unmount-filesystem)
- [Exercise 1.18 — Inspect `/etc/fstab`](#exercise-118--inspect-etcfstab)
- [Exercise 1.19 — Inspect Disk UUIDs](#exercise-119--inspect-disk-uuids)
- [Exercise 1.20 — Inspect System Uptime](#exercise-120--inspect-system-uptime)
- [Exercise 1.21 — Inspect Network Interfaces](#exercise-121--inspect-network-interfaces)
- [Exercise 1.22 — Display IP Address](#exercise-122--display-ip-address)
- [Exercise 1.23 — Display Routing Table](#exercise-123--display-routing-table)
- [Exercise 1.24 — Test Network Connectivity](#exercise-124--test-network-connectivity)
- [Exercise 1.25 — Inspect Listening Ports](#exercise-125--inspect-listening-ports)
- [Exercise 1.26 — Capture Network Traffic](#exercise-126--capture-network-traffic)
- [Exercise 1.27 — Display System Time](#exercise-127--display-system-time)
- [Exercise 1.28 — Inspect System Logs](#exercise-128--inspect-system-logs)
- [Exercise 1.29 — Inspect Boot Logs](#exercise-129--inspect-boot-logs)
- [Exercise 1.30 — Identify Kernel Ring Buffer Messages](#exercise-130--identify-kernel-ring-buffer-messages)
- [Exercise 2.1 — Create User Account](#exercise-21--create-user-account)
- [Exercise 2.2 — Create Group](#exercise-22--create-group)
- [Exercise 2.3 — Add User to Group](#exercise-23--add-user-to-group)
- [Exercise 2.4 — Set User Password](#exercise-24--set-user-password)
- [Exercise 2.5 — Lock User Account](#exercise-25--lock-user-account)
- [Exercise 2.6 — Unlock User Account](#exercise-26--unlock-user-account)
- [Exercise 2.7 — Inspect User Login History](#exercise-27--inspect-user-login-history)
- [Exercise 2.8 — Identify Currently Logged Users](#exercise-28--identify-currently-logged-users)
- [Exercise 2.9 — Inspect File Permissions](#exercise-29--inspect-file-permissions)
- [Exercise 2.10 — Modify File Permissions](#exercise-210--modify-file-permissions)
- [Exercise 2.11 — Create Symbolic Link](#exercise-211--create-symbolic-link)
- [Exercise 2.12 — Create Hard Link](#exercise-212--create-hard-link)
- [Exercise 2.13 — Identify Open Files](#exercise-213--identify-open-files)
- [Exercise 2.14 — Inspect Running Processes](#exercise-214--inspect-running-processes)
- [Exercise 2.15 — Monitor Processes in Real Time](#exercise-215--monitor-processes-in-real-time)
- [Exercise 2.16 — Adjust Process Priority](#exercise-216--adjust-process-priority)
- [Exercise 2.17 — Terminate Process](#exercise-217--terminate-process)
- [Exercise 2.18 — Run Process in Background](#exercise-218--run-process-in-background)
- [Exercise 2.19 — Bring Background Process to Foreground](#exercise-219--bring-background-process-to-foreground)
- [Exercise 2.20 — Schedule Cron Job](#exercise-220--schedule-cron-job)
- [Exercise 2.21 — Schedule One-Time Job](#exercise-221--schedule-one-time-job)
- [Exercise 2.22 — Inspect Services](#exercise-222--inspect-services)
- [Exercise 2.23 — Start Service](#exercise-223--start-service)
- [Exercise 2.24 — Stop Service](#exercise-224--stop-service)
- [Exercise 2.25 — Restart Service](#exercise-225--restart-service)
- [Exercise 2.26 — Enable Service at Boot](#exercise-226--enable-service-at-boot)
- [Exercise 2.27 — Disable Service at Boot](#exercise-227--disable-service-at-boot)
- [Exercise 2.28 — Inspect Logs Using journalctl](#exercise-228--inspect-logs-using-journalctl)
- [Exercise 2.29 — Install Package](#exercise-229--install-package)
- [Exercise 2.30 — Remove Package](#exercise-230--remove-package)
- [Exercise 3.1 — Inspect sudo Configuration](#exercise-31--inspect-sudo-configuration)
- [Exercise 3.2 — Inspect `/etc/sudoers`](#exercise-32--inspect-etcsudoers)
- [Exercise 3.3 — Create a Restricted Directory](#exercise-33--create-a-restricted-directory)
- [Exercise 3.4 — Configure Shared Group Directory](#exercise-34--configure-shared-group-directory)
- [Exercise 3.5 — Inspect File Permissions](#exercise-35--inspect-file-permissions)
- [Exercise 3.6 — Identify World-Writable Files](#exercise-36--identify-world-writable-files)
- [Exercise 3.7 — Identify SUID Files](#exercise-37--identify-suid-files)
- [Exercise 3.8 — Remove SUID Bit](#exercise-38--remove-suid-bit)
- [Exercise 3.9 — Configure Access Control List (ACL)](#exercise-39--configure-access-control-list-acl)
- [Exercise 3.10 — Inspect ACL Settings](#exercise-310--inspect-acl-settings)
- [Exercise 3.11 — Inspect SELinux Status](#exercise-311--inspect-selinux-status)
- [Exercise 3.12 — Inspect SELinux Context](#exercise-312--inspect-selinux-context)
- [Exercise 3.13 — Change SELinux Context](#exercise-313--change-selinux-context)
- [Exercise 3.14 — Restore Default SELinux Context](#exercise-314--restore-default-selinux-context)
- [Exercise 3.15 — Inspect Firewall Status](#exercise-315--inspect-firewall-status)
- [Exercise 3.16 — List Firewall Rules](#exercise-316--list-firewall-rules)
- [Exercise 3.17 — Open Firewall Port](#exercise-317--open-firewall-port)
- [Exercise 3.18 — Remove Firewall Rule](#exercise-318--remove-firewall-rule)
- [Exercise 3.19 — Inspect Listening Services](#exercise-319--inspect-listening-services)
- [Exercise 3.20 — Inspect SSH Configuration](#exercise-320--inspect-ssh-configuration)
- [Exercise 3.21 — Disable SSH Root Login](#exercise-321--disable-ssh-root-login)
- [Exercise 3.22 — Restart SSH Service](#exercise-322--restart-ssh-service)
- [Exercise 3.23 — Generate SSH Key Pair](#exercise-323--generate-ssh-key-pair)
- [Exercise 3.24 — Copy SSH Key](#exercise-324--copy-ssh-key)
- [Exercise 3.25 — Inspect Authentication Logs](#exercise-325--inspect-authentication-logs)
- [Exercise 3.26 — Identify Failed Logins](#exercise-326--identify-failed-logins)
- [Exercise 3.27 — Configure Login Banner](#exercise-327--configure-login-banner)
- [Exercise 3.28 — Encrypt File with GPG](#exercise-328--encrypt-file-with-gpg)
- [Exercise 3.29 — Decrypt File](#exercise-329--decrypt-file)
- [Exercise 3.30 — Inspect Audit Logs](#exercise-330--inspect-audit-logs)
- [Exercise 3.31 — Create Audit Rule](#exercise-331--create-audit-rule)
- [Exercise 3.32 — Identify Open Network Connections](#exercise-332--identify-open-network-connections)
- [Exercise 3.33 — Inspect Running Services](#exercise-333--inspect-running-services)
- [Exercise 3.34 — Identify Privileged Processes](#exercise-334--identify-privileged-processes)
- [Exercise 3.35 — Inspect System Security Updates](#exercise-335--inspect-system-security-updates)
- [Exercise 4.1 — Create Bash Script](#exercise-41--create-bash-script)
- [Exercise 4.2 — Use Script Variables](#exercise-42--use-script-variables)
- [Exercise 4.3 — Script Arguments](#exercise-43--script-arguments)
- [Exercise 4.4 — Conditional Logic](#exercise-44--conditional-logic)
- [Exercise 4.5 — Case Statement](#exercise-45--case-statement)
- [Exercise 4.6 — For Loop](#exercise-46--for-loop)
- [Exercise 4.7 — While Loop](#exercise-47--while-loop)
- [Exercise 4.8 — Until Loop](#exercise-48--until-loop)
- [Exercise 4.9 — Parse Output with grep](#exercise-49--parse-output-with-grep)
- [Exercise 4.10 — Extract Fields with awk](#exercise-410--extract-fields-with-awk)
- [Exercise 4.11 — Replace Text with sed](#exercise-411--replace-text-with-sed)
- [Exercise 4.12 — Sort Log Entries](#exercise-412--sort-log-entries)
- [Exercise 4.13 — Remove Duplicate Lines](#exercise-413--remove-duplicate-lines)
- [Exercise 4.14 — Count Lines in File](#exercise-414--count-lines-in-file)
- [Exercise 4.15 — Redirect Output](#exercise-415--redirect-output)
- [Exercise 4.16 — Append Output](#exercise-416--append-output)
- [Exercise 4.17 — Pipe Commands](#exercise-417--pipe-commands)
- [Exercise 4.18 — Backup Script](#exercise-418--backup-script)
- [Exercise 4.19 — Automated Backup Cron Job](#exercise-419--automated-backup-cron-job)
- [Exercise 4.20 — Cleanup Script](#exercise-420--cleanup-script)
- [Exercise 4.21 — System Health Script](#exercise-421--system-health-script)
- [Exercise 4.22 — Git Repository Initialization](#exercise-422--git-repository-initialization)
- [Exercise 4.23 — Git Commit](#exercise-423--git-commit)
- [Exercise 4.24 — Create Branch](#exercise-424--create-branch)
- [Exercise 4.25 — Merge Branch](#exercise-425--merge-branch)
- [Exercise 4.26 — View Git History](#exercise-426--view-git-history)
- [Exercise 4.27 — Tag Release](#exercise-427--tag-release)
- [Exercise 4.28 — Script Log Monitoring](#exercise-428--script-log-monitoring)
- [Exercise 4.29 — Scheduled Log Monitoring](#exercise-429--scheduled-log-monitoring)
- [Exercise 4.30 — Script Exit Codes](#exercise-430--script-exit-codes)
- [Exercise 5.1 — Diagnose High CPU Usage](#exercise-51--diagnose-high-cpu-usage)
- [Exercise 5.2 — Diagnose High Memory Usage](#exercise-52--diagnose-high-memory-usage)
- [Exercise 5.3 — Diagnose Disk Space Issues](#exercise-53--diagnose-disk-space-issues)
- [Exercise 5.4 — Identify Large Files](#exercise-54--identify-large-files)
- [Exercise 5.5 — Identify Zombie Processes](#exercise-55--identify-zombie-processes)
- [Exercise 5.6 — Diagnose Network Connectivity](#exercise-56--diagnose-network-connectivity)
- [Exercise 5.7 — Diagnose DNS Resolution](#exercise-57--diagnose-dns-resolution)
- [Exercise 5.8 — Inspect Network Interfaces](#exercise-58--inspect-network-interfaces)
- [Exercise 5.9 — Inspect Routing Table](#exercise-59--inspect-routing-table)
- [Exercise 5.10 — Diagnose SSH Connection](#exercise-510--diagnose-ssh-connection)
- [Exercise 5.11 — Diagnose Service Failure](#exercise-511--diagnose-service-failure)
- [Exercise 5.12 — Inspect System Logs](#exercise-512--inspect-system-logs)
- [Exercise 5.13 — Inspect Boot Logs](#exercise-513--inspect-boot-logs)
- [Exercise 5.14 — Diagnose Disk Errors](#exercise-514--diagnose-disk-errors)
- [Exercise 5.15 — Check Filesystem Integrity](#exercise-515--check-filesystem-integrity)
- [Exercise 5.16 — Diagnose Mount Failure](#exercise-516--diagnose-mount-failure)
- [Exercise 5.17 — Diagnose Permission Errors](#exercise-517--diagnose-permission-errors)
- [Exercise 5.18 — Diagnose SELinux Denial](#exercise-518--diagnose-selinux-denial)
- [Exercise 5.19 — Diagnose Firewall Blocking](#exercise-519--diagnose-firewall-blocking)
- [Exercise 5.20 — Diagnose Package Installation Failure](#exercise-520--diagnose-package-installation-failure)
- [Exercise 5.21 — Diagnose Cron Job Failure](#exercise-521--diagnose-cron-job-failure)
- [Exercise 5.22 — Diagnose Container Failure](#exercise-522--diagnose-container-failure)
- [Exercise 5.23 — Diagnose Network Latency](#exercise-523--diagnose-network-latency)
- [Exercise 5.24 — Diagnose Disk I/O Issues](#exercise-524--diagnose-disk-io-issues)
- [Exercise 5.25 — Diagnose Inode Exhaustion](#exercise-525--diagnose-inode-exhaustion)
- [Exercise 5.26 — Diagnose Process Crash](#exercise-526--diagnose-process-crash)
- [Exercise 5.27 — Diagnose Login Failure](#exercise-527--diagnose-login-failure)
- [Exercise 5.28 — Diagnose Service Dependency](#exercise-528--diagnose-service-dependency)
- [Exercise 5.29 — Diagnose Network Port Conflict](#exercise-529--diagnose-network-port-conflict)
- [Exercise 5.30 — Diagnose Log Rotation Issues](#exercise-530--diagnose-log-rotation-issues)
- [Exercise 5.31 — Diagnose Slow Boot](#exercise-531--diagnose-slow-boot)
- [Exercise 5.32 — Inspect System Resource Limits](#exercise-532--inspect-system-resource-limits)
- [Exercise 5.33 — Diagnose Kernel Panic Logs](#exercise-533--diagnose-kernel-panic-logs)
- [Exercise 5.34 — Inspect Hardware Errors](#exercise-534--inspect-hardware-errors)
- [Exercise 5.35 — Perform Full System Health Review](#exercise-535--perform-full-system-health-review)
- [Appendix A — Command Reference (Exercises 1–60)](#appendix-a--command-reference-exercises-160)
- [Appendix B — Command Reference (Exercises 61–155)](#appendix-b--command-reference-exercises-61155)


## Assumptions

- Each VM contains a user named **student**
- The **student** account has **sudo privileges**
- The student understands basic navigation commands:
  - cd
  - mkdir
  - touch
  - ls

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

## Appendix A — Command Reference (Exercises 1–60)

The following commands may be useful for completing the exercises.

1.1  
uname  
hostname  

1.2  
cat /proc/cpuinfo  

1.3  
free  

1.4  
lshw  

1.5  
lspci  

1.6  
lsusb  

1.7  
lsmod  

1.8  
dmesg  

1.9  
lsblk  

1.10  
blkid  

1.11  
df  

1.12  
mount  

1.13  
du  

1.14  
du  
sort  

1.15  
fdisk  

1.16  
mount  

1.17  
umount  

1.18  
cat /etc/fstab  

1.19  
blkid  

1.20  
uptime  

1.21  
ip address  

1.22  
ip address  

1.23  
ip route  

1.24  
ping  

1.25  
ss  

1.26  
tcpdump  

1.27  
date  
timedatectl  

1.28  
journalctl  

1.29  
journalctl -b  

1.30  
dmesg  

2.1  
useradd  

2.2  
groupadd  

2.3  
usermod  

2.4  
passwd  

2.5  
passwd -l  

2.6  
passwd -u  

2.7  
last  

2.8  
w  

2.9  
ls -l  

2.10  
chmod  

2.11  
ln -s  

2.12  
ln  

2.13  
lsof  

2.14  
ps  

2.15  
top  

2.16  
nice  
renice  

2.17  
kill  

2.18  
&  

2.19  
fg  

2.20  
crontab  

2.21  
at  

2.22  
systemctl status  

2.23  
systemctl start  

2.24  
systemctl stop  

2.25  
systemctl restart  

2.26  
systemctl enable  

2.27  
systemctl disable  

2.28  
journalctl  

2.29  
apt install  
dnf install  

2.30  
apt remove  
dnf remove  

## Appendix B — Command Reference (Exercises 61–155)

Common tools that may assist with the exercises.

sudo  
chmod  
chown  
find  
grep  
awk  
sed  
sort  
uniq  
wc  

systemctl  
journalctl  

ip  
ss  
ping  
traceroute  
dig  
nslookup  

tcpdump  

ps  
top  
htop  
kill  

mount  
umount  
lsblk  
blkid  
df  
du  

useradd  
groupadd  
usermod  
passwd  

crontab  
at  

setfacl  
getfacl  

getenforce  
setenforce  
restorecon  

firewall-cmd  
ufw  

ssh  
ssh-keygen  
ssh-copy-id  

gpg  

git  

fsck  

iostat  

uptime  
free  
date  

ulimit
```





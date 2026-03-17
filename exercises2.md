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

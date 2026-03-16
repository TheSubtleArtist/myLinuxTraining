```markdown
# Linux+ Capstone Lab  
# Full Deployment Roadmap  
## Secure Real Estate Management Platform

This roadmap walks through the **complete lifecycle** of building and deploying a secure application platform using:

- Linux system administration
- Infrastructure as Code
- Configuration management
- container orchestration
- application deployment
- security hardening
- operational management

The objective is to move from a **blank laptop to a fully deployed secure application**.

The roadmap is intentionally ordered to prevent architectural confusion and allow the student to focus on **system administration skills**.

---

# Phase 1 — Host System Preparation

## Objective

Prepare the Windows host system to support the entire virtual infrastructure.

---

### Task 1.1 — Install Virtualization Software

Install the virtualization platform.

Requirements:

- Install Oracle VirtualBox
- Install VirtualBox Extension Pack

Verify:

- VirtualBox launches successfully.

---

### Task 1.2 — Create Project Directory Structure

Create a workspace on the host system.

Example structure:

```

linux-capstone/
terraform/
ansible/
kubernetes/
app/
images/
scripts/
docs/

```

---

### Task 1.3 — Download Ubuntu Server ISO

Download the current **Ubuntu Server LTS ISO**.

Store the file in:

```

images/

```

---

### Task 1.4 — Create SSH Keypair for Automation

Generate an SSH keypair that will be used by automation tools.

Store keys in a secure directory.

---

### Task 1.5 — Install Required Host Tools

Install the following tools on the Windows host:

- Terraform
- Ansible (via WSL or control node later)
- Git
- OpenSSH client

Verify installations by running version commands.

---

# Phase 2 — Virtual Network Design

## Objective

Create a secure and functional virtual network architecture.

---

### Task 2.1 — Create Host-Only Network

Create a VirtualBox host-only network.

Example network:

```

192.168.56.0/24

```

---

### Task 2.2 — Document Static IP Address Plan

Define static IP addresses for all nodes.

Example:

| Node | IP |
|-----|-----|
| control-node | 192.168.56.10 |
| gateway | 192.168.56.20 |
| app-node | 192.168.56.30 |
| db-node | 192.168.56.40 |
| k8s-control | 192.168.56.50 |
| k8s-worker | 192.168.56.51 |

---

### Task 2.3 — Configure Dual Network Adapter Model

Each VM must use:

Adapter 1:

```

NAT

```

Adapter 2:

```

Host-only network

```

---

# Phase 3 — Base Virtual Machine Deployment

## Objective

Deploy base Ubuntu servers that will later be managed with automation.

---

### Task 3.1 — Create Control Node VM

VM Specifications:

```

2 CPUs
4 GB RAM
20 GB disk

```

Install Ubuntu Server.

Hostname:

```

control-node

```

---

### Task 3.2 — Configure Static Networking on Control Node

Configure static IP:

```

192.168.56.10

```

Verify connectivity.

---

### Task 3.3 — Create Gateway VM

Specifications:

```

2 CPUs
2 GB RAM
20 GB disk

```

Hostname:

```

gateway

```

---

### Task 3.4 — Create Application Node VM

Specifications:

```

2 CPUs
4 GB RAM
20 GB disk

```

Hostname:

```

app-node

```

---

### Task 3.5 — Create Database Node VM

Specifications:

```

2 CPUs
4 GB RAM
20 GB disk

* additional data disk

```

Hostname:

```

db-node

```

---

### Task 3.6 — Create Kubernetes Control Node

Specifications:

```

2 CPUs
3 GB RAM

```

Hostname:

```

k8s-control

```

---

### Task 3.7 — Create Kubernetes Worker Node

Specifications:

```

2 CPUs
3 GB RAM

```

Hostname:

```

k8s-worker

```

---

# Phase 4 — Base System Configuration

## Objective

Standardize Linux configuration across all nodes.

---

### Task 4.1 — Create Administrative User

Create user:

```

student

```

Grant sudo privileges.

---

### Task 4.2 — Configure SSH Key Authentication

Disable password authentication.

Allow SSH key login.

---

### Task 4.3 — Disable Root SSH Login

Update SSH configuration to disable root login.

---

### Task 4.4 — Update System Packages

Run system updates on all nodes.

---

### Task 4.5 — Configure Hostnames and Hosts File

Ensure all nodes resolve each other.

Edit:

```

/etc/hosts

```

---

# Phase 5 — Terraform Infrastructure Automation

## Objective

Recreate infrastructure using **Infrastructure as Code**.

---

### Task 5.1 — Install Terraform on Control Node

Verify installation.

---

### Task 5.2 — Initialize Terraform Project

Create files:

```

main.tf
variables.tf
outputs.tf

```

---

### Task 5.3 — Create VirtualBox Provider Configuration

Define provider settings.

---

### Task 5.4 — Define VM Resources in Terraform

Define infrastructure resources.

---

### Task 5.5 — Deploy Infrastructure Using Terraform

Run:

```

terraform init
terraform plan
terraform apply

```

---

# Phase 6 — Ansible Configuration Management

## Objective

Automate configuration of all nodes.

---

### Task 6.1 — Install Ansible

Install on control node.

---

### Task 6.2 — Create Ansible Inventory

Define all infrastructure nodes.

---

### Task 6.3 — Configure SSH Access for Ansible

Verify automation connectivity.

---

### Task 6.4 — Create Base Configuration Playbook

Configure:

- packages
- users
- timezone
- firewall baseline

---

### Task 6.5 — Apply Base Playbook

Run configuration across all nodes.

---

# Phase 7 — Storage Configuration

## Objective

Configure persistent storage for database workloads.

---

### Task 7.1 — Partition Database Data Disk

Identify secondary disk.

---

### Task 7.2 — Create LVM Volume

Create:

- physical volume
- volume group
- logical volume

---

### Task 7.3 — Create Filesystem

Format logical volume.

---

### Task 7.4 — Mount Database Storage

Mount at:

```

/var/lib/mongodb

```

---

### Task 7.5 — Configure Persistent Mount

Update:

```

/etc/fstab

```

---

# Phase 8 — Database Deployment

## Objective

Deploy MongoDB database server.

---

### Task 8.1 — Install MongoDB

Install server package.

---

### Task 8.2 — Configure Database Storage Location

Update configuration.

---

### Task 8.3 — Enable Database Authentication

Enable authentication mode.

---

### Task 8.4 — Create Application Database

Create:

```

realestate

```

---

### Task 8.5 — Create Database User

Create application user.

---

# Phase 9 — Messaging Layer

## Objective

Deploy messaging system.

---

### Task 9.1 — Install Messaging Server

Install NATS server.

---

### Task 9.2 — Configure Messaging Service

Configure service startup.

---

### Task 9.3 — Verify Messaging Connectivity

Confirm messaging system is reachable.

---

# Phase 10 — Web Application Deployment

## Objective

Deploy application runtime.

---

### Task 10.1 — Install Python Runtime

Install required Python packages.

---

### Task 10.2 — Deploy Flask Application

Deploy application source code.

---

### Task 10.3 — Configure Application Environment Variables

Define configuration values.

---

### Task 10.4 — Create Systemd Service

Configure application service.

---

### Task 10.5 — Start Application Service

Verify application starts.

---

# Phase 11 — Reverse Proxy Deployment

## Objective

Deploy gateway web server.

---

### Task 11.1 — Install Web Server

Install NGINX.

---

### Task 11.2 — Configure Reverse Proxy

Forward traffic to application node.

---

### Task 11.3 — Configure Logging

Enable access and error logs.

---

# Phase 12 — TLS Deployment

## Objective

Secure web traffic.

---

### Task 12.1 — Create Internal Certificate Authority

Generate CA certificate.

---

### Task 12.2 — Generate Server Certificate

Create certificate for gateway.

---

### Task 12.3 — Configure NGINX TLS

Enable HTTPS.

---

### Task 12.4 — Redirect HTTP to HTTPS

Configure automatic redirect.

---

# Phase 13 — Kubernetes Deployment

## Objective

Deploy container orchestration environment.

---

### Task 13.1 — Install k3s on Control Node

Initialize Kubernetes control plane.

---

### Task 13.2 — Join Worker Node

Add worker node to cluster.

---

### Task 13.3 — Verify Cluster Health

Confirm nodes are active.

---

# Phase 14 — Container Deployment

## Objective

Deploy application containers.

---

### Task 14.1 — Build Container Image

Build application container.

---

### Task 14.2 — Push Image to Local Registry

Store image locally.

---

### Task 14.3 — Create Kubernetes Deployment

Define container deployment.

---

### Task 14.4 — Create Kubernetes Service

Expose container application.

---

# Phase 15 — Security Hardening

## Objective

Secure the entire platform.

---

### Task 15.1 — Configure Firewall

Allow only required ports.

---

### Task 15.2 — Install Fail2Ban

Protect SSH service.

---

### Task 15.3 — Implement Least Privilege Accounts

Review user roles.

---

### Task 15.4 — Secure Secrets

Store secrets using Ansible Vault.

---

# Phase 16 — Monitoring and Logging

## Objective

Establish system observability.

---

### Task 16.1 — Configure System Logging

Centralize logs.

---

### Task 16.2 — Configure Log Rotation

Prevent disk exhaustion.

---

### Task 16.3 — Monitor Resource Usage

Track CPU, memory, and disk.

---

# Phase 17 — Backup Strategy

## Objective

Protect application data.

---

### Task 17.1 — Create Database Backup Script

Automate database backups.

---

### Task 17.2 — Schedule Backup Jobs

Use cron scheduling.

---

### Task 17.3 — Verify Backup Integrity

Test restore procedure.

---

# Phase 18 — Operational Validation

## Objective

Verify the entire system functions.

---

### Task 18.1 — Test Application Access

Verify HTTPS access.

---

### Task 18.2 — Create Property Record

Test database integration.

---

### Task 18.3 — Trigger Messaging Events

Verify messaging layer.

---

### Task 18.4 — Validate Kubernetes Deployment

Confirm containers remain healthy.

---

# Final Outcome

The completed environment provides a **secure distributed application platform** implementing:

- Infrastructure as Code
- Configuration as Code
- container orchestration
- secure web architecture
- automated deployment
- operational monitoring

The student will have built a **production-style Linux platform** entirely from scratch.
```

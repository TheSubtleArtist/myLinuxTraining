# Recommended Architecture Adjustments  
## Host Environment: Windows 11 Laptop (32 GB RAM)

Adding the information that the host system is a **Windows 11 laptop with 32 GB of RAM** allows several improvements to the previously proposed architecture. The environment can now support a slightly larger infrastructure that more closely resembles a real production environment while still remaining manageable for a single-machine lab.

These adjustments improve:

- realism
- performance
- infrastructure training depth
- resiliency
- offline operation

---

# 1. Expanded Virtual Machine Layout

With **32 GB RAM available**, the architecture can support more nodes without overloading the host system.

### Recommended VM Allocation

| VM | Role | RAM | CPUs |
|---|---|---|---|
| control-node | Terraform + Ansible + automation tooling | 4 GB | 2 |
| gateway | Reverse proxy, TLS termination | 2 GB | 2 |
| app-node | Web application runtime | 4 GB | 2 |
| db-node | MongoDB database | 4 GB | 2 |
| k8s-control | Kubernetes control plane | 3 GB | 2 |
| k8s-worker | Kubernetes worker node | 3 GB | 2 |

### Total Estimated Consumption

```

~20 GB RAM

```

This leaves:

```

~12 GB RAM

```

for:

- Windows 11
- VirtualBox overhead
- host OS applications

---

# 2. Improved Kubernetes Topology

Previously a **single-node Kubernetes deployment** was recommended due to resource constraints.

With the new hardware constraints, a **two-node Kubernetes cluster** becomes practical.

### Recommended Distribution

Use:

- k3s (lightweight Kubernetes distribution)

### Node Structure

```

k3s-control
k3s-worker

```

### Benefits

- introduces real **cluster behavior**
- enables **node scheduling**
- enables **high availability experiments**
- supports **future scaling exercises**

---

# 3. Add a Local Container Registry

Because the host system will have **intermittent internet connectivity**, a local container image registry will reduce dependency on external repositories.

### Recommended Tool

Docker Registry (local registry server)

### Deployment Option

Run the registry on:

```

control-node

```

### Benefits

- images downloaded once
- images reused offline
- faster deployments
- improved reproducibility

---

# 4. Improved Networking Architecture

Because the host system is Windows, the recommended network design is **dual interface networking for each VM**.

## Adapter 1

```

NAT

```

Purpose:

- internet access
- OS updates
- container image downloads
- package installation

---

## Adapter 2

```

Host-only network

```

Example network:

```

192.168.56.0/24

```

This becomes the **internal infrastructure network**.

### Example Static IP Plan

| VM | IP Address |
|---|---|
| control-node | 192.168.56.10 |
| gateway | 192.168.56.20 |
| app-node | 192.168.56.30 |
| db-node | 192.168.56.40 |
| k8s-control | 192.168.56.50 |
| k8s-worker | 192.168.56.51 |

### Resulting Network Model

```

Internet
│
NAT Interface
│
Gateway VM
│
Host-only Network
│
All Internal Services

```

This design provides:

- secure isolation
- controlled internet access
- realistic enterprise architecture

---

# 5. Add Local Package Caching

Because the laptop is not continuously connected to the internet, package caching improves reliability and speed.

### Recommended Tool

apt-cacher-ng

### Deployment Location

```

control-node

```

### Benefits

```

Packages downloaded once
Cached for reuse across all VMs
Deployments work offline after first download

```

---

# 6. Improved Storage Training

The available resources allow introduction of **real storage administration tasks**.

### Recommended Disk Layout

Each VM should have:

```

Disk 1 – Operating System
Disk 2 – Application/Data Storage

```

### Training Opportunities

Students can practice:

```

LVM creation
filesystem formatting
mount configuration
persistent mounts
storage expansion

```

### Example

For `db-node`:

```

Disk 2 → /var/lib/mongodb

```

This reinforces Linux+ topics including:

- storage management
- filesystem configuration
- mount automation

---

# 7. Optional Centralized Logging

With the additional system capacity, a centralized logging service can be introduced.

### Option 1 (More Advanced)

Grafana Loki

### Option 2 (Simpler)

rsyslog centralized logging server

### Deployment Location

```

gateway

```

### Benefits

Enables training scenarios involving:

```

log aggregation
incident analysis
cross-system troubleshooting
security investigation

```

---

# 8. TLS Strategy

The TLS strategy remains unchanged and is still appropriate for the lab environment.

### Recommended Tool

OpenSSL

### Implementation Strategy

```

1. Create an internal Certificate Authority
2. Generate server certificates
3. Install CA certificate on all nodes
4. Configure NGINX TLS

```

### Benefits

```

Works without internet access
Teaches PKI fundamentals
Supports certificate lifecycle management

```

---

# 9. Identity and Access Management Enhancements

Because the environment now contains multiple nodes, additional user roles can be introduced.

### Recommended Linux Accounts

| User | Role |
|---|---|
| student | primary administrative user |
| devops | automation and deployment |
| appuser | application runtime account |
| dbadmin | database administration |

### SSH Hardening Example

```

PermitRootLogin no
PasswordAuthentication no
AllowGroups devops admin

```

---

# 10. Secrets Management

To manage credentials securely within the automation pipeline, introduce secrets management.

### Recommended Tool

Ansible Vault

### Secrets Stored

```

database credentials
JWT signing keys
TLS private keys
API credentials

```

---

# 11. Final Optimized Architecture

```

Windows 11 Laptop
32 GB RAM
│
└── Oracle VirtualBox Infrastructure
│
├── control-node
│     Terraform
│     Ansible
│     apt-cacher-ng
│
├── gateway
│     NGINX reverse proxy
│     TLS termination
│
├── app-node
│     Flask web application
│     NATS messaging client
│
├── db-node
│     MongoDB database
│
├── k8s-control
│     k3s Kubernetes control plane
│
└── k8s-worker
Kubernetes container workloads

```

### Messaging Layer

```

NATS

```

---

# 12. Training Capabilities of This Architecture

This environment supports training in:

```

Linux system administration
DevOps automation
Infrastructure as code
configuration management
container orchestration
network security
storage management
incident response
distributed systems

```

All of this is achievable on a **single laptop**.

---

# 13. Snapshot Strategy (Highly Recommended)

Use **VirtualBox snapshots** to support repeatable training scenarios.

### Benefits

```

restore broken systems instantly
simulate incidents
practice troubleshooting repeatedly
reset labs quickly

```

### Example Snapshot Stages

```

snapshot 1 – base OS installed
snapshot 2 – networking configured
snapshot 3 – infrastructure deployed
snapshot 4 – application deployed
snapshot 5 – security hardening complete

```

Snapshots allow the environment to function as a **replayable training platform**.


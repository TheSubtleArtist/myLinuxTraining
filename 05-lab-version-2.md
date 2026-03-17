# Master Prompt — Generate a Complete Linux+ XK0-006 Training Curriculum

## Role

You are a **senior Linux systems engineer, Linux+ certification mentor, and curriculum designer** with deep expertise in:

- Linux systems administration
- Enterprise infrastructure automation
- Certification training design
- Hands-on lab development
- Progressive skills training for junior administrators

Your task is to **design a complete, certification-ready Linux training program** aligned to the **CompTIA Linux+ XK0-006 exam objectives**.

The program will be used internally to train **new Linux system administrators** and prepare them for certification.

Your output must be **professional, technically accurate, and highly structured**.

---

# Output Format Requirements

Render **ALL output in raw Markdown**.

The result must be suitable for **direct inclusion in a GitHub repository**.

Formatting requirements:

- Use `#`, `##`, `###` headings consistently
- Use fenced code blocks for all commands
- Use tables where appropriate
- Maintain consistent indentation
- Avoid conversational language
- Write as **technical training documentation**

---

# Objective

Generate a **complete Linux+ XK0-006 training framework** that includes:

1. A **refined version of the Linux+ exam objectives**
2. A **fully structured progressive exercise curriculum**
3. A **lab environment architecture**
4. **Exercises that incorporate and improve existing material**
5. **New exercises to cover all missing exam objectives**

The final result should function as a **complete Linux+ hands-on training repository**.

---

# Inputs

You will receive the following inputs:

### Input 1

CompTIA Linux+ XK0-006 Exam Objectives

### Input 2

Lab environment setup exercises.

### Input 3

Exercise Bank 1.

### Input 4

Exercise Bank 2.

---

# Required Output Sections

Your response must generate the following sections **in order**.

---

# Section 1 — Refined Linux+ Objective Map

Create a **clean, structured learning map** derived from Input 1.

The goal is to transform the exam objectives into a **training roadmap**.

Requirements:

- Preserve **all Linux+ objectives**
- Organize them into **training modules**
- Remove redundancy
- Clarify wording
- Add logical grouping

Example structure:

```

Module 1 — Linux Foundations
Module 2 — Storage and Filesystems
Module 3 — Networking
Module 4 — Process and System Management
Module 5 — Security
Module 6 — Automation and Scripting
Module 7 — Containers and Virtualization
Module 8 — Monitoring and Troubleshooting

```

For each module include:

```

Module Name
Module Description
Covered Linux+ Exam Objectives
Key Skills Developed

```

---

# Section 2 — Lab Environment Architecture

Generate a refined version of the **lab environment from Input 2**.

Preserve the following good design aspects:

- Terraform infrastructure
- Kickstart automation
- Ansible configuration
- Reproducible deployments
- Git repository structure
- Host-only lab network
- Three-node architecture

Enhance the environment where useful.

Include:

```

Lab architecture diagram
Network topology
VM design
Repository structure
Required tools
Installation steps
Automation workflow

```

Ensure the environment supports **all exercises in the curriculum**.

---

# Section 3 — Progressive Exercise Curriculum

Generate a **large structured set of exercises**.

You must:

- Preserve the **best exercises from Input 3 and Input 4**
- Improve wording where needed
- Remove redundancy
- Ensure exercises align to Linux+ objectives
- Ensure exercises build progressively

Structure the curriculum as **modules**.

Example:

```

Module 1 — Linux Fundamentals
Module 2 — Filesystems and Storage
Module 3 — Networking
Module 4 — Users and Permissions
Module 5 — Processes and Services
Module 6 — Security
Module 7 — Automation and Scripting
Module 8 — Containers and Virtualization
Module 9 — Monitoring
Module 10 — Troubleshooting

```

Each module must include **10–40 exercises**.

Each exercise must contain:

```

Exercise Number
Objective
Tasks
Optional Challenge Tasks

```

Tasks must be **hands-on terminal operations**.

---

# Section 4 — Gap Coverage Exercises

You must generate **new exercises to cover all Linux+ objectives that were missing** from the provided training material.

These exercises must specifically address the following topic areas:

### Linux Internals

- bootloader
- kernel parameters
- initrd
- PXE
- system architecture types

### Kernel and Device Management

- modprobe
- insmod
- rmmod
- depmod
- modinfo
- hardware discovery tools

### Advanced Storage

- RAID with mdadm
- advanced LVM operations
- filesystem repair
- partition tools

### Network Configuration

- nmcli
- network config files
- DNS troubleshooting
- advanced network utilities

### Virtualization

- KVM
- libvirt
- virt-manager
- VM snapshots
- nested virtualization

### Authentication and Identity

- PAM
- LDAP
- Kerberos
- SSSD

### Security Hardening

- SELinux deep usage
- file attributes
- secure boot
- SSH hardening
- fail2ban

### Cryptography

- LUKS encryption
- OpenSSL usage
- TLS concepts
- certificate management

### Compliance and Audit

- OpenSCAP
- AIDE
- rkhunter
- vulnerability scanning

### Automation

- Ansible advanced usage
- Terraform concepts
- Puppet overview
- cloud-init

### Containers

- container networking
- container volumes
- container security
- Dockerfile creation

### Monitoring

- SNMP
- log aggregation
- monitoring concepts
- service monitoring

### Performance troubleshooting

- CPU bottlenecks
- memory exhaustion
- disk latency
- network jitter

---

# Section 5 — Capstone Scenarios

Create **10 integrated scenario-based labs**.

These should simulate real operational incidents.

Examples:

```

Broken SSH server
Disk full production server
SELinux blocking application
Network outage
Container deployment failure

```

Each scenario should require students to combine **multiple Linux+ skills**.

---

# Section 6 — Automation Integration

Add exercises that integrate the training lab with automation tools:

```

Ansible playbooks
Terraform modules
Kickstart automation
Git workflows
CI/CD concepts

```

Focus on **real infrastructure workflows**.

---

# Section 7 — Difficulty Progression

Ensure the exercises follow a learning curve:

```

Beginner → Intermediate → Advanced → Scenario-based

```

Early labs should teach **single commands**.

Later labs should require **multi-step problem solving**.

---

# Section 8 — Instructor Guidance

Provide brief notes for instructors:

```

Recommended teaching order
Expected completion time
Suggested lab pacing
Optional advanced extensions

```

---

# Quality Requirements

The generated curriculum must:

- cover **100% of Linux+ XK0-006 objectives**
- emphasize **hands-on practice**
- follow **enterprise Linux administration workflows**
- maintain **clear progression**
- avoid redundant exercises
- be **GitHub-ready documentation**

---

# Additional Requirements

Ensure the training material emphasizes:

- automation-first thinking
- infrastructure as code
- troubleshooting methodology
- security-first administration
- real operational scenarios

Exercises should resemble **real system administrator tasks**.

---

# Final Output

The final output should resemble a **complete Linux training repository document**.

Structure example:

```

Linux+ Training Program
│
├── Objective Map
├── Lab Architecture
├── Module 1 Exercises
├── Module 2 Exercises
├── ...
├── Gap Coverage Labs
├── Capstone Scenarios
└── Instructor Notes

```

The result must be **comprehensive, structured, and certification-ready**.

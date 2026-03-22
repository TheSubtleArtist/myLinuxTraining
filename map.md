
# Linux+ XK0-006 Training Program - Course Map

- [Linux+ XK0-006 Training Program - Course Map](#linux-xk0-006-training-program---course-map)
  - [Repository Purpose](#repository-purpose)
- [Section 1 — Linux+ Objective Map](#section-1--linux-objective-map)
  - [Training Module Overview](#training-module-overview)
  - [Module 1 — Linux Foundations and System Architecture](#module-1--linux-foundations-and-system-architecture)
  - [Module 2 — Device, Boot, and Kernel Management](#module-2--device-boot-and-kernel-management)
  - [Module 3 — Storage, Filesystems, and Data Protection](#module-3--storage-filesystems-and-data-protection)
  - [Module 4 — Networking and Host Connectivity](#module-4--networking-and-host-connectivity)
  - [Module 5 — Files, Users, Permissions, and Process Control](#module-5--files-users-permissions-and-process-control)
  - [Module 6 — Software, Services, and systemd Operations](#module-6--software-services-and-systemd-operations)
  - [Module 7 — Security, Identity, and Compliance](#module-7--security-identity-and-compliance)
  - [Module 8 — Containers and Virtualization](#module-8--containers-and-virtualization)
  - [Module 9 — Automation, Git, Python, and AI-Assisted Administration](#module-9--automation-git-python-and-ai-assisted-administration)
  - [Module 10 — Monitoring, Performance, and Troubleshooting](#module-10--monitoring-performance-and-troubleshooting)
  - [Module 11 — Advanced Platform and Storage Operations](#module-11--advanced-platform-and-storage-operations)
  - [Module 12 — Advanced Network, Identity, and Security Operations](#module-12--advanced-network-identity-and-security-operations)
- [Section 2 — Difficulty Progression](#section-2--difficulty-progression)
  - [2.1 Progression Model](#21-progression-model)
  - [2.2 Difficulty Bands by Module](#22-difficulty-bands-by-module)
  - [2.3 Recommended Learning Path](#23-recommended-learning-path)
  - [2.4 Progression Rules for Exercise Design](#24-progression-rules-for-exercise-design)
- [Section 3 — Instructor Guidance](#section-3--instructor-guidance)
  - [3.1 Recommended Teaching Order](#31-recommended-teaching-order)
  - [3.2 Expected Completion Time](#32-expected-completion-time)
  - [3.3 Suggested Lab Pacing](#33-suggested-lab-pacing)
  - [3.4 Instructor Delivery Notes](#34-instructor-delivery-notes)
  - [3.5 Optional Advanced Extensions](#35-optional-advanced-extensions)
  - [3.6 Assessment Recommendations](#36-assessment-recommendations)
- [Program Summary](#program-summary)
  - [Coverage Statement](#coverage-statement)

## Repository Purpose

This document defines the Linux+ XK0-006 course map for a hands-on administrator training program intended for direct inclusion in a GitHub repository.

The program is re-engineered around:

- **VirtualBox and Vagrant** for host-side provisioning
- **Kickstart** for installation automation
- **Ansible** for configuration automation
- **Git** for version control and iteration

The course map preserves the original core training flow, module order, pacing model, difficulty progression, and rebuild expectations while replacing the former standalone gap-coverage section with two formal advanced-extension modules.

**Modules 11 and 12 replace the former standalone gap-coverage section by retaining all non-direct-integration exercises in a structured advanced-extension track.**

Use the following lifecycle vocabulary consistently across the repository:

```text
prepare -> provision -> install -> configure -> validate -> snapshot -> rebuild
````

This course map aligns to the rewritten architecture and the revised 12-module curriculum.

---

# Section 1 — Linux+ Objective Map

## Training Module Overview

| Module | Module Name                                             | Primary Linux+ Domains                         |
| ------ | ------------------------------------------------------- | ---------------------------------------------- |
| 1      | Linux Foundations and System Architecture               | 1.1, 1.5                                       |
| 2      | Device, Boot, and Kernel Management                     | 1.1, 1.2, 2.5                                  |
| 3      | Storage, Filesystems, and Data Protection               | 1.3, 1.6                                       |
| 4      | Networking and Host Connectivity                        | 1.4                                            |
| 5      | Files, Users, Permissions, and Process Control          | 2.1, 2.2, 2.3                                  |
| 6      | Software, Services, and systemd Operations              | 2.4, 2.5                                       |
| 7      | Security, Identity, and Compliance                      | 3.1, 3.2, 3.3, 3.4, 3.5, 3.6                   |
| 8      | Containers and Virtualization                           | 1.7, 2.6                                       |
| 9      | Automation, Git, Python, and AI-Assisted Administration | 4.1, 4.2, 4.3, 4.4, 4.5                        |
| 10     | Monitoring, Performance, and Troubleshooting            | 5.1, 5.2, 5.3, 5.4, 5.5                        |
| 11     | Advanced Platform and Storage Operations                | objective reinforcement and advanced extension |
| 12     | Advanced Network, Identity, and Security Operations     | objective reinforcement and advanced extension |

Modules 1 through 10 remain the primary certification-aligned path. Modules 11 and 12 replace the former standalone gap-coverage section by retaining all non-direct-integration exercises in a structured advanced-extension track.

---

## Module 1 — Linux Foundations and System Architecture

### Module Description

Introduces Linux operating concepts, shell usage, distribution families, filesystem hierarchy, licensing, shell environments, command-line utilities, and architecture fundamentals.

### Covered Linux+ Exam Objectives

* **1.1** Explain Basic Linux Concepts

  * boot process overview
  * FHS
  * server architectures
  * distributions
  * GUI stack concepts
  * licensing
* **1.5** Given a scenario, manage files and directories

  * navigation
  * redirection
  * pipes
  * links
  * searching
  * editing

### Outcomes

Learners should be able to:

* navigate Linux systems confidently
* interpret operating system and shell context
* work safely with files, directories, and text streams
* explain architecture and distribution concepts before moving into administration tasks

---

## Module 2 — Device, Boot, and Kernel Management

### Module Description

Builds understanding of the Linux boot process, kernel lifecycle, hardware inspection, module management, runtime parameters, device discovery, and bootloader behavior.

### Covered Linux+ Exam Objectives

* **1.1** Explain Basic Linux Concepts

  * bootloader
  * configuration files
  * kernel parameters
  * initrd/initramfs
  * PXE concepts
* **1.2** Summarize Linux devices

  * hardware interfaces
  * `/proc`
  * `/sys`
  * storage and peripheral discovery
* **2.5** Given a scenario, manage kernel modules

  * view
  * load
  * unload
  * inspect dependencies

### Outcomes

Learners should be able to:

* explain the Linux boot chain
* inspect hardware and kernel state
* work with kernel modules safely
* interpret boot and driver logs during troubleshooting

---

## Module 3 — Storage, Filesystems, and Data Protection

### Module Description

Covers disk layout, partitioning, filesystems, mount management, LVM, RAID fundamentals, backup methods, synchronization, repair concepts, and data-protection workflows.

### Covered Linux+ Exam Objectives

* **1.3** Given a scenario, manage storage in Linux

  * partitions
  * filesystems
  * mounting
  * LVM
  * RAID concepts
* **1.6** Given a scenario, create, modify, and restore backups

  * `tar`
  * `rsync`
  * `dd`
  * backup verification
  * restore workflows

### Outcomes

Learners should be able to:

* inspect and manage Linux storage
* create and verify backups
* expand and repair storage resources
* distinguish between file-level and block-level protection workflows

---

## Module 4 — Networking and Host Connectivity

### Module Description

Develops practical Linux networking skills including interface review, addressing, routing, DNS, NetworkManager usage, packet inspection, persistent connection handling, and connectivity diagnostics.

### Covered Linux+ Exam Objectives

* **1.4** Given a scenario, configure and monitor Linux network services

  * interfaces
  * addresses
  * routes
  * DNS
  * connection management
  * sockets
  * packet capture
  * service testing

### Outcomes

Learners should be able to:

* inspect and configure interfaces safely
* validate routes and DNS behavior
* persist network changes appropriately
* verify host and service reachability across the lab environment

---

## Module 5 — Files, Users, Permissions, and Process Control

### Module Description

Focuses on filesystem objects, links, local user and group administration, permissions, ACLs, process inspection, job control, and scheduled task execution.

### Covered Linux+ Exam Objectives

* **2.1** Given a scenario, manage users and groups

  * create, modify, expire, review
* **2.2** Given a scenario, configure and manage permissions

  * ownership
  * modes
  * ACLs
  * special permissions
  * attributes
* **2.3** Given a scenario, manage processes and jobs

  * process inspection
  * priorities
  * job control
  * scheduling

### Outcomes

Learners should be able to:

* manage local identities correctly
* apply and troubleshoot Linux permission models
* inspect and control running processes
* schedule recurring and one-time administrative work

---

## Module 6 — Software, Services, and systemd Operations

### Module Description

Builds operational skills for package management, repositories, service lifecycle control, journal analysis, host/time management tools, and custom systemd units and timers.

### Covered Linux+ Exam Objectives

* **2.4** Given a scenario, manage software and services

  * repositories
  * package installation
  * package queries
  * removal
  * language package ecosystems
* **2.5** Given a scenario, manage services

  * start
  * stop
  * enable
  * disable
  * logs
  * custom unit behavior

### Outcomes

Learners should be able to:

* manage software sources and packages
* troubleshoot service startup and package issues
* use systemd and the journal effectively
* deploy simple services and timers safely

---

## Module 7 — Security, Identity, and Compliance

### Module Description

Covers privilege delegation, SSH hardening, key-based access, firewall policy, SELinux, PAM, NSS, file protection mechanisms, cryptography, audit visibility, integrity validation, and vulnerability-management concepts.

### Covered Linux+ Exam Objectives

* **3.1** Summarize authorization, authentication, and accounting
* **3.2** Given a scenario, implement and configure firewalls
* **3.3** Given a scenario, configure and execute remote connectivity
* **3.4** Given a scenario, apply operating system hardening
* **3.5** Given a scenario, apply or acquire access controls
* **3.6** Given a scenario, configure and implement encryption

### Outcomes

Learners should be able to:

* secure administrative access
* apply and validate firewall and SELinux policy
* explain PAM and NSS roles in identity and auth flows
* review auth, audit, integrity, and vulnerability evidence
* connect host controls to enterprise security practice

---

## Module 8 — Containers and Virtualization

### Module Description

Introduces virtualization concepts, VM resource models, snapshots, hypervisor types, container lifecycle operations, images, networks, storage, and Linux-native virtualization tooling.

### Covered Linux+ Exam Objectives

* **1.7** Summarize virtualization and cloud concepts

  * hypervisors
  * VM images
  * virtual networking
  * snapshots
  * clones
* **2.6** Given a scenario, manage containers and virtual machines

  * Podman basics
  * container networking
  * persistent storage
  * KVM/libvirt concepts

### Outcomes

Learners should be able to:

* explain VM and container operating models
* run and inspect containerized workloads
* distinguish virtualization network modes
* understand when snapshot, clone, and rebuild workflows are appropriate

---

## Module 9 — Automation, Git, Python, and AI-Assisted Administration

### Module Description

Builds automation fluency through shell scripting, Ansible, Vagrant-driven provisioning workflows, Kickstart deployment awareness, Git workflows, Python basics, and responsible AI-assisted operations.

### Covered Linux+ Exam Objectives

* **4.1** Given a scenario, automate tasks and processes

  * shell scripting
  * variables
  * loops
  * conditions
  * scheduling
* **4.2** Given a scenario, use version control

  * Git initialization
  * commits
  * branching
  * merging
  * tagging
* **4.3** Given a scenario, use infrastructure and configuration automation concepts

  * version-controlled infrastructure provisioning
  * Kickstart
  * Ansible
  * validation and rebuild workflows
* **4.4** Given a scenario, use Python and related tooling

  * virtual environments
  * dependencies
  * simple administration scripts
* **4.5** Given a scenario, evaluate AI-assisted administration safely

  * human validation
  * secure use
  * responsible prompt handling

### Outcomes

Learners should be able to:

* automate repeated administration tasks
* manage infrastructure and configuration workflows through versioned artifacts
* use Vagrant, Kickstart, Ansible, and Git in support of Linux operations
* use Python and AI assistance with review and operational judgment

---

## Module 10 — Monitoring, Performance, and Troubleshooting

### Module Description

Develops a disciplined troubleshooting methodology across performance, services, storage, networking, security, health checks, alert design, and operational monitoring concepts.

### Covered Linux+ Exam Objectives

* **5.1** Given a scenario, analyze system properties and remediate accordingly
* **5.2** Given a scenario, analyze resource utilization and remediate accordingly
* **5.3** Given a scenario, analyze services and remediate accordingly
* **5.4** Given a scenario, analyze security issues and remediate accordingly
* **5.5** Given a scenario, analyze network issues and remediate accordingly

### Outcomes

Learners should be able to:

* collect and interpret system health data
* isolate root cause across CPU, memory, disk, network, and services
* connect metrics, alerts, and service behavior
* restore stable service under realistic operational constraints

---

## Module 11 — Advanced Platform and Storage Operations

### Module Description

Provides a structured advanced-extension module for platform-depth and storage-depth topics that were previously separated as gap coverage. It includes enterprise-relevant topics that are valuable for breadth and operational maturity but are intentionally kept outside the core 10-module flow.

### Focus Areas

* PXE workflow concepts
* module dependency refresh with `depmod`
* advanced hardware discovery
* RAID degradation and recovery
* advanced LVM operations
* network mounts
* KVM and libvirt concepts

### Outcomes

Learners should be able to:

* explain advanced Linux boot and provisioning concepts
* inspect hardware with deeper operational tooling
* recover degraded storage resources
* perform advanced LVM workflows
* understand shared storage patterns
* compare desktop-hosted and Linux-native virtualization models

### Position in Program

Module 11 follows the core path and functions as an advanced extension that preserves full coverage without overloading the pacing of Modules 1 through 10.

---

## Module 12 — Advanced Network, Identity, and Security Operations

### Module Description

Provides a structured advanced-extension module for cross-platform networking, enterprise identity, encryption, and compliance topics that were previously separated as gap coverage.

### Focus Areas

* Netplan model review
* advanced network diagnostics
* DNS troubleshooting workflows
* LDAP concepts
* Kerberos concepts
* firewall framework comparison
* LUKS concepts
* WireGuard concepts
* OpenSCAP concepts

### Outcomes

Learners should be able to:

* compare Linux networking frameworks and advanced diagnostics
* explain centralized identity systems and Kerberos workflows
* connect encryption and secure tunnels to Linux operations
* evaluate advanced security and compliance tooling

### Position in Program

Module 12 follows Module 11 and completes the advanced extension track that replaces the former standalone gap-coverage section.

---

# Section 2 — Difficulty Progression

## 2.1 Progression Model

The program uses a deliberate progression from low-risk command execution to multi-host administration and incident-style remediation.

### Progression Principles

* early work emphasizes direct visibility and short feedback loops
* mid-program work introduces persistence, state, coordination, and recovery
* late work introduces ambiguity, noisy symptoms, and justified remediation
* capstones require complete workflows, not isolated commands

The lab architecture supports this progression through the standard lifecycle:

```text
prepare -> provision -> install -> configure -> validate -> snapshot -> rebuild
```

Learners first observe and validate, then configure and automate, then troubleshoot, snapshot, and rebuild.

Modules 11 and 12 extend coverage after the core path instead of interrupting it.

---

## 2.2 Difficulty Bands by Module

| Difficulty Band         | Characteristics                                                                  | Primary Modules |
| ----------------------- | -------------------------------------------------------------------------------- | --------------- |
| foundational fluency    | command usage, shell interpretation, direct system visibility                    | 1, 2            |
| core administration     | storage, networking, permissions, services, persistence                          | 3, 4, 5, 6      |
| secure operations       | hardening, identity, encryption, compliance, validation                          | 7               |
| modern Linux operations | containers, virtualization, automation, version control                          | 8, 9            |
| operations readiness    | performance analysis, troubleshooting, incident response                         | 10              |
| advanced extension      | breadth expansion, enterprise concepts, platform-depth and security-depth topics | 11, 12          |

### Difficulty Notes

* **foundational fluency** emphasizes command accuracy and confidence
* **core administration** emphasizes repeatable system changes and validation
* **secure operations** emphasizes control application and policy awareness
* **modern Linux operations** emphasizes automation-first administration
* **operations readiness** emphasizes diagnosis, prioritization, restoration, and reporting
* **advanced extension** emphasizes breadth, enterprise context, and deeper conceptual or operational coverage

---

## 2.3 Recommended Learning Path

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

This path preserves the original core sequence and places the former gap-coverage material after the primary certification-aligned path.

---

## 2.4 Progression Rules for Exercise Design

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

# Section 3 — Instructor Guidance

## 3.1 Recommended Teaching Order

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

This preserves the original primary teaching order through Module 10 and replaces the former standalone gap-coverage section with Modules 11 and 12.

---

## 3.2 Expected Completion Time

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

The time previously assigned to gap coverage is preserved by converting that material into Modules 11 and 12 instead of deleting it.

---

## 3.3 Suggested Lab Pacing

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

---

## 3.4 Instructor Delivery Notes

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

These practices remain unchanged and continue to align with the revised architecture and 12-module structure.

---

## 3.5 Optional Advanced Extensions

### Advanced Lab Extensions

* add a fourth VM for client/service-consumer testing
* implement local DNS caching or authoritative DNS
* deploy NFS and Samba cross-host storage workflows
* build a small libvirt/KVM environment on a nested-capable host
* integrate containerized monitoring tools
* test WireGuard in a multi-node design
* perform OpenSCAP baseline comparison before and after hardening
* build a simple Git-based CI validation pipeline for Vagrant configuration, Ansible, and shell scripts

---

## 3.6 Assessment Recommendations

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


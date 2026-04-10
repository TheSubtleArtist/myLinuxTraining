
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


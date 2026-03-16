Design goals of this lab pack:

* **Simulate real incidents** seen by sysadmins, SOC analysts, and security engineers
* Force the student to **combine multiple Linux skills**
* Encourage **investigation rather than command memorization**
* Maintain your rule of **no answers inside scenarios**
* Use **safe investigation sources** such as `/var`, `/etc`, `/proc`, `/usr`
* Avoid destructive operations

# Linux Incident Response Lab Pack

## Overview

These labs simulate real-world operational incidents affecting Linux systems.

Each scenario provides:

- A realistic operational situation
- Investigation tasks
- A defined objective

The student must **identify root cause and propose remediation**.

---

# Category 1 — System Resource Incidents

## Scenario 1 — Server CPU Spike

Situation:

A production server is experiencing **sustained 95% CPU usage**.

Tasks:

1. Identify the process consuming the most CPU.
2. Determine the user that launched the process.
3. Determine how long the process has been running.
4. Decide whether the process should be terminated.

Objective:

Determine whether the process is **legitimate workload or malicious activity**.

---

## Scenario 2 — Memory Exhaustion

Situation:

Users report that applications are crashing due to **out-of-memory errors**.

Tasks:

1. Determine current system memory usage.
2. Identify which process is consuming the most memory.
3. Determine whether swap space is being used.

Objective:

Identify the process responsible for memory exhaustion.

---

## Scenario 3 — Disk Space Full

Situation:

A monitoring system reports that the root filesystem is **100% full**.

Tasks:

1. Identify which filesystem is full.
2. Determine which directory is consuming the most space.
3. Identify large files contributing to the issue.

Objective:

Identify the files responsible for the disk usage spike.

---

## Scenario 4 — Inode Exhaustion

Situation:

Applications report **"No space left on device"**, but disk usage is low.

Tasks:

1. Determine inode usage on all filesystems.
2. Identify the directory containing the largest number of files.

Objective:

Identify cause of inode exhaustion.

---

## Scenario 5 — Disk I/O Bottleneck

Situation:

The server is responding slowly and disk utilization is extremely high.

Tasks:

1. Identify disk I/O usage.
2. Determine which process is generating the I/O load.

Objective:

Identify the process causing disk I/O contention.

---

# Category 2 — Authentication and Security Incidents

## Scenario 6 — Suspicious Login Activity

Situation:

The security team suspects **unauthorized login attempts**.

Tasks:

1. Review authentication logs.
2. Identify failed login attempts.
3. Identify the source IP addresses involved.

Objective:

Determine whether brute-force login attempts occurred.

---

## Scenario 7 — Unauthorized Root Access

Situation:

Root login occurred outside of normal maintenance hours.

Tasks:

1. Identify when the root login occurred.
2. Determine which IP address initiated the session.

Objective:

Determine if the login was legitimate.

---

## Scenario 8 — SSH Brute Force Attack

Situation:

Firewall monitoring reports repeated login attempts against SSH.

Tasks:

1. Review logs for failed authentication attempts.
2. Identify the most frequent attacking IP address.

Objective:

Confirm brute force activity.

---

## Scenario 9 — Suspicious SUID Files

Situation:

Security audit reports unusual SUID binaries.

Tasks:

1. Identify all SUID files on the system.
2. Identify any located outside standard directories.

Objective:

Identify potential privilege escalation vectors.

---

## Scenario 10 — World-Writable File Risk

Situation:

A security audit indicates risky file permissions.

Tasks:

1. Search `/var` for world-writable files.
2. Identify any files that should not have these permissions.

Objective:

Identify potential security exposure.

---

# Category 3 — Network Incidents

## Scenario 11 — Unexpected Listening Port

Situation:

Network monitoring detects **port 4444 listening** on the server.

Tasks:

1. Identify the process bound to port 4444.
2. Determine which user started the process.

Objective:

Identify whether the service is legitimate.

---

## Scenario 12 — Suspicious Outbound Traffic

Situation:

Network monitoring reports **connections to unknown external hosts**.

Tasks:

1. Identify active outbound connections.
2. Identify the processes responsible.

Objective:

Determine whether a process is communicating externally.

---

## Scenario 13 — DNS Failure

Situation:

Users cannot resolve external domain names.

Tasks:

1. Verify DNS resolution.
2. Inspect resolver configuration.

Objective:

Identify DNS configuration issue.

---

## Scenario 14 — Default Gateway Misconfiguration

Situation:

Servers cannot reach external networks.

Tasks:

1. Inspect routing table.
2. Identify default route.

Objective:

Identify incorrect routing configuration.

---

## Scenario 15 — Network Interface Down

Situation:

Server loses network connectivity.

Tasks:

1. Inspect network interface status.
2. Identify whether interface is down.

Objective:

Determine cause of interface failure.

---

# Category 4 — Service Failure Incidents

## Scenario 16 — SSH Service Down

Situation:

Administrators cannot connect via SSH.

Tasks:

1. Inspect SSH service status.
2. Inspect service logs.

Objective:

Identify cause of SSH failure.

---

## Scenario 17 — Web Server Failure

Situation:

A web server returns **HTTP 500 errors**.

Tasks:

1. Inspect web server logs in `/var/log`.
2. Identify recent errors.

Objective:

Determine cause of web service failure.

---

## Scenario 18 — Service Restart Loop

Situation:

A systemd service continuously restarts.

Tasks:

1. Inspect service status.
2. Review service logs.

Objective:

Determine why service repeatedly crashes.

---

## Scenario 19 — Failed Boot Service

Situation:

A system service fails during system startup.

Tasks:

1. Inspect boot logs.
2. Identify the failed service.

Objective:

Determine reason for boot failure.

---

## Scenario 20 — Cron Job Failure

Situation:

A scheduled backup job did not run overnight.

Tasks:

1. Inspect cron configuration.
2. Review system logs for cron activity.

Objective:

Determine why the scheduled task did not execute.

---

# Category 5 — Log Analysis Incidents

## Scenario 21 — Application Crash

Situation:

An application crashes repeatedly.

Tasks:

1. Inspect application logs in `/var/log`.
2. Identify error messages preceding the crash.

Objective:

Identify root cause of crash.

---

## Scenario 22 — Segmentation Fault

Situation:

System logs report **segmentation faults**.

Tasks:

1. Identify affected application.
2. Inspect related log entries.

Objective:

Identify which application is crashing.

---

## Scenario 23 — Kernel Error Messages

Situation:

Kernel messages indicate possible hardware issues.

Tasks:

1. Inspect kernel ring buffer.
2. Identify disk or hardware errors.

Objective:

Determine whether hardware failure is likely.

---

## Scenario 24 — Log Rotation Failure

Situation:

Logs have grown excessively large.

Tasks:

1. Inspect log rotation configuration.
2. Identify why rotation did not occur.

Objective:

Determine cause of log growth.

---

## Scenario 25 — Missing Logs

Situation:

Expected logs are not present in `/var/log`.

Tasks:

1. Verify log configuration.
2. Identify which service generates those logs.

Objective:

Determine why logs are missing.

---

# Category 6 — Configuration Errors

## Scenario 26 — Broken Package Installation

Situation:

Package installation fails repeatedly.

Tasks:

1. Inspect package manager logs.
2. Identify error messages.

Objective:

Identify installation failure cause.

---

## Scenario 27 — Broken Repository Configuration

Situation:

Package updates cannot reach repositories.

Tasks:

1. Inspect repository configuration files.
2. Identify incorrect entries.

Objective:

Identify configuration error.

---

## Scenario 28 — Permission Denied Errors

Situation:

An application cannot read a configuration file in `/etc`.

Tasks:

1. Inspect file permissions.
2. Inspect file ownership.

Objective:

Identify the permission issue.

---

## Scenario 29 — SELinux Blocking Application

Situation:

Application fails despite correct permissions.

Tasks:

1. Identify SELinux mode.
2. Inspect SELinux denial logs.

Objective:

Determine whether SELinux is blocking the application.

---

## Scenario 30 — Firewall Blocking Service

Situation:

Users cannot reach a service running on port 8080.

Tasks:

1. Verify the service is listening.
2. Inspect firewall rules.

Objective:

Determine if firewall is blocking access.

---

# Category 7 — System Stability Incidents

## Scenario 31 — Slow Boot Time

Situation:

Server boot time increased dramatically.

Tasks:

1. Analyze boot logs.
2. Identify slow services.

Objective:

Identify cause of slow boot.

---

## Scenario 32 — Zombie Processes

Situation:

Monitoring detects zombie processes.

Tasks:

1. Identify zombie processes.
2. Identify parent process.

Objective:

Determine root cause.

---

## Scenario 33 — File Descriptor Exhaustion

Situation:

Applications fail with **Too many open files**.

Tasks:

1. Inspect system file descriptor limits.
2. Identify processes with many open files.

Objective:

Determine which process exhausted descriptors.

---

## Scenario 34 — System Time Drift

Situation:

Servers display incorrect system time.

Tasks:

1. Inspect system time configuration.
2. Identify NTP configuration.

Objective:

Determine time synchronization issue.

---

## Scenario 35 — System Load Spike

Situation:

Load average increases dramatically.

Tasks:

1. Inspect running processes.
2. Identify resource-heavy tasks.

Objective:

Determine cause of load spike.

---

# Category 8 — Security Investigation Incidents

## Scenario 36 — Suspicious Binary

Situation:

An unknown binary appears in `/tmp`.

Tasks:

1. Identify file ownership.
2. Inspect file execution permissions.

Objective:

Determine whether binary is suspicious.

---

## Scenario 37 — Unexpected Scheduled Task

Situation:

An unknown cron job exists.

Tasks:

1. Inspect cron jobs for all users.
2. Identify suspicious entries.

Objective:

Determine who created the job.

---

## Scenario 38 — Unauthorized File Modification

Situation:

Critical configuration file `/etc/passwd` changed.

Tasks:

1. Identify modification time.
2. Inspect logs for related activity.

Objective:

Determine potential cause.

---

## Scenario 39 — Suspicious Network Listener

Situation:

A process is listening on a high-numbered port.

Tasks:

1. Identify the process.
2. Determine executable location.

Objective:

Determine legitimacy.

---

## Scenario 40 — Full System Investigation

Situation:

A security alert indicates possible compromise.

Tasks:

1. Inspect running processes.
2. Inspect network connections.
3. Inspect authentication logs.
4. Inspect system logs.

Objective:

Produce a **brief incident report summarizing findings**.


---

## Why This Lab Pack Is Extremely Valuable

This pack forces you to use **multiple skill areas simultaneously**:

| Skill                   | Used In                 |
| ----------------------- | ----------------------- |
| Process analysis        | CPU / memory incidents  |
| Filesystem analysis     | disk incidents          |
| Log analysis            | almost every scenario   |
| Networking              | connectivity / firewall |
| Security auditing       | privilege / login       |
| Service troubleshooting | systemd failures        |

This mirrors the **actual workflow of**:

* Linux System Administrators
* SOC Analysts
* Incident Responders
* DevSecOps Engineers

---

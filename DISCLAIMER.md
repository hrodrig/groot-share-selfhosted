# Disclaimer — use at your own risk

**Last updated:** 2026-08-13

This repository (`groot-share-selfhosted`) provides **deployment manifests, scripts, and documentation only**. It is **not** a managed service, hosted product, or data-processing service operated by the maintainers on your behalf.

## Use at your own risk

By downloading, cloning, configuring, or running anything described in this repository (Compose stacks, Helm charts, systemd units, examples, or docs), you agree that you do so **entirely at your own risk**.

## Your data is your responsibility

You alone are responsible for:

- All **data** you store, process, or transmit with **gfs** (groot `.tar.gz` archives, SQLite, audit logs, secrets, credentials, personal or customer data)
- Choosing where data lives (including **`GFS_HOST_DATA`**, volumes, disks, S3-compatible buckets, and backups)
- Access control, encryption, retention, deletion, and compliance with laws applicable to **your** use
- Securing bootstrap passwords, API keys, `AWS_*` credentials, and TLS for **your** deployments

**The maintainers are not responsible for your data** — including loss, corruption, unauthorized access, disclosure, ransomware, misconfiguration, or incomplete backups — whether caused by software defects, operator error, third-party infrastructure, or misuse.

## Improper / unsuitable use

You are responsible for ensuring that your use is lawful and appropriate. The maintainers are **not** liable for:

- Misuse, abuse, or illegal use of the software or these manifests
- Running workloads you do not understand or have not tested
- Exposing the gfs UI or upload API to the internet without adequate controls
- Using example / lab defaults (weak bootstrap passwords, published ports, `GFS_COOKIE_SECURE=false`) in production
- Running on a VPS or bare metal without hardening the host (SSH, firewall, updates, backups)
- Putting long-lived bucket credentials on laptops (gfs exists so those keys stay on the VPS)
- Damage arising from following outdated, incomplete, or environment-specific guidance without your own validation

For **self-managed VPS** hardening ideas (recommendations only — you validate and apply), see the family docs at [gghstats-selfhosted `run/vps-recommended`](https://github.com/hrodrig/gghstats-selfhosted/tree/main/run/vps-recommended).

## No warranty / limitation of liability

This material is provided **“AS IS”** and **“AS AVAILABLE”**, without warranty of any kind, express or implied, including but not limited to merchantability, fitness for a particular purpose, and non-infringement — consistent with the [MIT License](./LICENSE).

**To the maximum extent permitted by applicable law**, the authors and copyright holders shall **not** be liable for any claim, damages, or other liability — whether in contract, tort, or otherwise — arising from use of this repository, the related gfs software, or inability to use them, including but not limited to loss of data, loss of profits, business interruption, or security incidents.

## Release and acknowledgment

By using this repository you acknowledge that:

1. You have read this disclaimer and the [MIT License](./LICENSE).
2. You accept **full operational and data responsibility** for your deployments.
3. You **release** the maintainers from claims related to your data, configuration choices, and use of these materials, to the extent permitted by law.

If you do not agree, **do not use** these manifests or run the software based on them.

## Security reports

Vulnerability reports for this repository: see [SECURITY.md](./SECURITY.md).  
Application issues belong in **[groot-share](https://github.com/hrodrig/groot-share)** (binary **gfs**).

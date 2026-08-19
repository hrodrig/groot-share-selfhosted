# Changelog

All notable changes to **groot-share-selfhosted** (deployment manifests, docs, and tooling for this repository only) are documented here. For the **gfs** application, see [groot-share CHANGELOG](https://github.com/hrodrig/groot-share/blob/main/CHANGELOG.md).

Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added

- In-tree **`run/vps-recommended/`** (optional Debian/Ubuntu host baseline + Ansible). Does not install gfs. Compose **minimal** is loopback/lab — UFW defaults stay 22/80/443.

## [0.1.1] - 2026-08-13

### Changed

- Default app pin **`GFS_VERSION=v0.2.1`** (`ghcr.io/hrodrig/gfs`).
- Pass gfs v0.2.1 env through Compose, Helm, and `docker run`: `GFS_BOOTSTRAP_ADMIN_NAME`, `GFS_LOGIN_SIMPLE`, `GFS_BRAND_SUB`, `GFS_FOOTER`.

## [0.1.0] - 2026-08-13

### Added

- Family operator repo for **gfs**: Compose **minimal** + **Traefik**, `docker run`, standalone / systemd, Helm chart **`gfs`**.
- **`GFS_HOST_DATA`** outside the clone; **`run/scripts/compose-stack.sh`** (`minimal` | `traefik`).
- Topologies **`vps`** (disk home) and **`vps-s3`** (bucket home; `AWS_*` on the VPS only).
- Community files: LICENSE, DISCLAIMER, CONTRIBUTING, SECURITY, CODE_OF_CONDUCT, AGENTS, ROADMAP.
- CI: Helm lint + kubeconform; chart-releaser workflow for `v*` tags.
- Default app pin **`GFS_VERSION=v0.2.0`** (`ghcr.io/hrodrig/gfs`).
- README hero (`assets/groot-share-selfhosted-hero.png`); problem / solution / alternatives sections that point at [groot-share ALTERNATIVES](https://github.com/hrodrig/groot-share/blob/main/docs/ALTERNATIVES.md).
- Favicon set: gfs crate mark under [`assets/favicons/`](assets/favicons/); Helm Pages landing + `Chart.yaml` `icon`.

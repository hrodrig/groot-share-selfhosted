# Changelog

All notable changes to **groot-share-selfhosted** (deployment manifests, docs, and tooling for this repository only) are documented here. For the **gfs** application, see [groot-share CHANGELOG](https://github.com/hrodrig/groot-share/blob/main/CHANGELOG.md).

Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

## [0.3.0] - 2026-08-25

### Changed

- Bump app pin **`GFS_VERSION=v0.7.0`** (`ghcr.io/hrodrig/gfs`) across Compose (`minimal`, `traefik`), Helm (`values.yaml`, `Chart.yaml` `appVersion`), `docker run`, standalone/systemd, and all docs.
- Helm chart **`version`** → **`0.3.0`** (kept in step with repo `VERSION`).
- **`VERSION`** → **`0.3.0`**; README version badge.

## [0.2.0] - 2026-08-21

### Changed

- Bump app pin **`GFS_VERSION=v0.5.0`** (`ghcr.io/hrodrig/gfs`) across Compose (`minimal`, `traefik`), Helm (`values.yaml`, `Chart.yaml` `appVersion`), `docker run`, standalone/systemd, and all docs.
- **`VERSION`** → **`0.2.0`**; README version badge + `image.tag` examples; ROADMAP current focus.
- Standalone Linux README: drop the non-existent `.deb` asset — gfs ships `.tar.gz` only (GoReleaser); document `tar` + `install` instead of `dpkg`.

### Added

- In-tree **`run/vps-recommended/`** (optional Debian/Ubuntu host baseline + Ansible). Does not install gfs. Compose **minimal** is loopback/lab — UFW defaults stay 22/80/443.

### Fixed

- Traefik path docs: first-boot `mkdir` / `chown 65532:$USER` + `chmod 2775` / bootstrap / `GFS_TOPOLOGY=vps`, plus fail-closed log table (SQLite UID **65532**, empty bootstrap, `vps-s3` without bucket). `chown -R 65532:65532` locks the operator out of `.env`.
- Document chrome env on the Traefik path: `GFS_BRAND_SUB`, `GFS_FOOTER`, `GFS_LOGIN_SIMPLE`.

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

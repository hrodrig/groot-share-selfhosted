# groot-share-selfhosted Roadmap

Deployment companion for **[gfs](https://github.com/hrodrig/groot-share)** (VPS / `vps-s3` door for groot archives).  
Design: [docs/superpowers/specs/2026-08-13-groot-share-selfhosted-design.md](./docs/superpowers/specs/2026-08-13-groot-share-selfhosted-design.md)

**Status key:** ✅ done · ⬜ pending · 🔒 blocked on upstream product

---

## Current focus

v0.1.0 tagged. Next: Helm Pages live after first chart-releaser run; SFTP inbox volume docs when gfs Phase 8 ships.

---

## Band 0 — Scaffold (MVP)

| ID | Item | Status |
|----|------|--------|
| GSH-001 | Family layout: whitelist `.gitignore`, community files, `VERSION` `0.1.0` | ✅ |
| GSH-002 | Design doc under `docs/superpowers/specs/` | ✅ |
| GSH-003 | Pick-a-path README (native + containers; S3-only out of scope) | ✅ |
| GSH-004 | Compose minimal (`vps`) + Traefik HTTPS | ✅ |
| GSH-005 | `GFS_HOST_DATA` outside clone + `run/scripts/compose-stack.sh` | ✅ |
| GSH-006 | Standalone / docker run docs (linux, macos, windows) | ✅ |
| GSH-007 | Helm chart `run/kubernetes/helm/gfs/` + `make release-check` | ✅ |
| GSH-008 | First commit + GitHub remote publish | ✅ |

---

## Band 1 — Operator polish

| ID | Item | Status |
|----|------|--------|
| GSH-010 | README hero asset (no character/mascot imagery) | ✅ |
| GSH-011 | Cross-link groot-share README Deploy → this repo (live URL) | ⬜ |
| GSH-012 | Smoke recipe: `/healthz` + `/readyz` after Compose up | ⬜ |
| GSH-013 | Document SFTP inbox bind-mount when gfs Phase 8 (`GFS_SFTP_INBOX`) ships | 🔒 gfs Phase 8 |
| GSH-014 | Optional observability overlay (link gghstats-selfhosted pattern; do not copy Authelia) | ⬜ |
| GSH-015 | VPS hardening: in-tree `run/vps-recommended` (host baseline; optional Ansible) | ✅ |

---

## Band 2 — Kubernetes publish

| ID | Item | Status |
|----|------|--------|
| GSH-020 | Chart lint + kubeconform in CI | ✅ |
| GSH-021 | chart-releaser / GitHub Pages on first `v*` tag | ✅ workflow; needs public repo + tag |
| GSH-022 | Ingress example (Host-based; no app `BASE_PATH`) | ⬜ |

---

## Out of scope (forever / other repos)

| Topic | Where |
|-------|--------|
| Topology **S3 only** (no gfs process) | [groot-selfhosted `run/examples/s3-contabo`](https://github.com/hrodrig/groot-selfhosted/tree/main/run/examples/s3-contabo) |
| CronJob / bastion **collect** | [groot-selfhosted](https://github.com/hrodrig/groot-selfhosted) |
| In-cluster Job trigger | [groot-trigger](https://github.com/hrodrig/groot-trigger) |
| gfs application code | [groot-share](https://github.com/hrodrig/groot-share) |

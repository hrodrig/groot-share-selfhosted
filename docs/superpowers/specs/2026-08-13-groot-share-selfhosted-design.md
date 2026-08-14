# groot-share-selfhosted — design

**Date:** 2026-08-13  
**Status:** Implemented in-repo (v0.1.0 scaffold)

## Problem

**gfs** (repo **groot-share**) is the VPS web/API door for groot `.tar.gz` archives. Operators need Compose, systemd, `docker run`, and Helm — not a second packaging dialect and not CronJob collect playbooks.

## Scope

| In | Out |
|----|-----|
| Deploy **gfs** on a VPS or cluster: topologies **`vps`** and **`vps-s3`** | Topology **S3 only** (no gfs process) |
| Secrets + SQLite + local archives under **`GFS_HOST_DATA`** outside the clone | App source, GoReleaser, distroless **build** (groot-share) |
| Traefik + Let’s Encrypt for HTTPS | Authelia (gfs has session + api_key) |
| Helm chart name **`gfs`**, image **`ghcr.io/hrodrig/gfs`** | Observability stack in v0.1.0 |

## Layout (family)

Same idea as **gfire-selfhosted** / **gghstats-selfhosted**:

```text
run/common/.env.example
run/scripts/compose-stack.sh    # minimal | traefik
run/docker-compose/{minimal,traefik}/
run/docker/
run/standalone/{linux,macos,windows}/
run/examples/{vps,vps-s3}/
run/kubernetes/helm/gfs/
```

## Config contract

App env is **gfs** SPEC §5 (`GFS_*`). Stack extras:

- **`GFS_HOST_DATA`** — host directory (Compose bind-mount → `/data`)
- **`GFS_VERSION`** — image tag (not this repo’s `VERSION`)
- **`GFS_HOSTNAME`** / **`ACME_EMAIL`** — Traefik only
- **`GFS_DATA_DIR=/data`** inside the container
- Distroless **UID/GID 65532** must own the host data dir

Fail closed: empty bootstrap on first start; `vps-s3` without bucket + `AWS_*`.

## Versioning

| Field | Meaning |
|-------|---------|
| Root `VERSION` | This infra repo (`v` tags on `main`) |
| `GFS_VERSION` | Upstream gfs image |
| Chart `version` | Helm package |
| Chart `appVersion` | App line (no `v`) |

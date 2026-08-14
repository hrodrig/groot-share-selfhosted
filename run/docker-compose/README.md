# Docker Compose

| Stack | File | When |
|-------|------|------|
| **minimal** | [minimal/](minimal/) | Lab or LAN; publishes `GFS_HOST_PORT` |
| **traefik** | [traefik/](traefik/) | Public HTTPS (80/443) |

Always pass **`--env-file "${GFS_HOST_DATA}/.env"`** or use **[`../scripts/compose-stack.sh`](../scripts/compose-stack.sh)**.

Topology **`vps-s3`:** set `GFS_TOPOLOGY` + `GFS_S3_*` + `AWS_*` in that `.env`. Same Compose files.

Disclaimer: [DISCLAIMER.md](../../DISCLAIMER.md).

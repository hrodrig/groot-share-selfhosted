# run/ — operator index

Deployment material for **gfs**. App contract: [groot-share SPEC](https://github.com/hrodrig/groot-share/blob/main/docs/SPECIFICATIONS.md).

| Path | Role |
|------|------|
| [common/](common/) | `.env.example` → `${GFS_HOST_DATA}/.env` |
| [scripts/compose-stack.sh](scripts/compose-stack.sh) | `minimal` \| `traefik` |
| [docker/](docker/) | `docker run` |
| [docker-compose/minimal/](docker-compose/minimal/) | One service, host port |
| [docker-compose/traefik/](docker-compose/traefik/) | HTTPS + Let’s Encrypt |
| [standalone/](standalone/) | Binary + systemd |
| [examples/vps/](examples/vps/) | Topology `vps` checklist |
| [examples/vps-s3/](examples/vps-s3/) | Topology `vps-s3` checklist |
| [vps-recommended/](vps-recommended/) | Optional host baseline (Ansible). Does **not** install gfs. |
| [kubernetes/helm/gfs/](kubernetes/helm/gfs/) | Helm chart |

**Not here:** S3-only (no gfs) and CronJob collect → [groot-selfhosted](https://github.com/hrodrig/groot-selfhosted).

Disclaimer: [DISCLAIMER.md](../DISCLAIMER.md).

# Topology `vps`

Archives live on the VPS disk (`GFS_DATA_DIR` / `${GFS_HOST_DATA}`).

1. Harden the host ([vps-recommended](../../vps-recommended/)).
2. Copy [`run/common/.env.example`](../../common/.env.example) → `${GFS_HOST_DATA}/.env`.
3. Set `GFS_TOPOLOGY=vps`, `GFS_BOOTSTRAP_*` (min 8 chars), `GFS_HOST_DATA`.
4. `chown 65532:$USER` and `chmod 2775` on the **data directory** (not `-R`) if using Compose / Docker. UID **65532** writes SQLite; your user still edits `.env`. `chown -R 65532:65532` locks you out of nano (`Directory … is not writable`).
5. HTTPS: follow [`run/docker-compose/traefik/README.md`](../../docker-compose/traefik/README.md). Lab only: [`minimal`](../../docker-compose/minimal/README.md).
6. After first login, remove bootstrap env and recreate the process.
7. Create an **uploader** API key in the UI for laptops / bastions (`POST /v1/archives`).

Bastion collect still uses [groot-selfhosted](https://github.com/hrodrig/groot-selfhosted) — point uploads at this gfs URL, not at a bucket.

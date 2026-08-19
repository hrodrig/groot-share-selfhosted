# Topology `vps`

Archives live on the VPS disk (`GFS_DATA_DIR` / `${GFS_HOST_DATA}`).

1. Harden the host ([vps-recommended](../../vps-recommended/)).
2. Copy [`run/common/.env.example`](../../common/.env.example) → `${GFS_HOST_DATA}/.env`.
3. Set `GFS_TOPOLOGY=vps`, `GFS_BOOTSTRAP_*` (min 8 chars), `GFS_HOST_DATA`.
4. `chown 65532:65532` the data dir if using Compose / Docker.
5. `./run/scripts/compose-stack.sh minimal up -d` (or Traefik / systemd).
6. After first login, remove bootstrap env and recreate the process.
7. Create an **uploader** API key in the UI for laptops / bastions (`POST /v1/archives`).

Bastion collect still uses [groot-selfhosted](https://github.com/hrodrig/groot-selfhosted) — point uploads at this gfs URL, not at a bucket.

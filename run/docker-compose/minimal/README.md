# Compose minimal

One **gfs** container. Host port **`${GFS_HOST_PORT:-8080}`**. Topology **`vps`** by default.

**Not a public edge.** Loopback / lab (`127.0.0.1`). For HTTPS on a VPS use [Traefik](../traefik/). Host baseline: [vps-recommended](../../vps-recommended/).

```bash
export GFS_HOST_DATA=/home/gfs/gfs-data
mkdir -p "$GFS_HOST_DATA"
sudo chown 65532:"$USER" "$GFS_HOST_DATA"
sudo chmod 2775 "$GFS_HOST_DATA"
cp ../../common/.env.example "${GFS_HOST_DATA}/.env"
# edit bootstrap + GFS_HOST_DATA

../../scripts/compose-stack.sh minimal up -d
curl -sS http://127.0.0.1:8080/healthz
```

**Remove:** `../../scripts/compose-stack.sh minimal down`

Host directory: owner **65532**, group **your user**, mode **2775** (SQLite + editing `.env`). Do not `chown -R 65532:65532`.

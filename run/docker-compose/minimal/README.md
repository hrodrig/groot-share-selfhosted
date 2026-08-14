# Compose minimal

One **gfs** container. Host port **`${GFS_HOST_PORT:-8080}`**. Topology **`vps`** by default.

```bash
export GFS_HOST_DATA=/home/gfs/gfs-data
mkdir -p "$GFS_HOST_DATA"
sudo chown 65532:65532 "$GFS_HOST_DATA"
cp ../../common/.env.example "${GFS_HOST_DATA}/.env"
# edit bootstrap + GFS_HOST_DATA

../../scripts/compose-stack.sh minimal up -d
curl -sS http://127.0.0.1:8080/healthz
```

**Remove:** `../../scripts/compose-stack.sh minimal down`

Host directory must be writable by UID **65532** (distroless nonroot).

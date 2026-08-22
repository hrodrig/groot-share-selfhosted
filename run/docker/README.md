# Docker single container

**Goal:** one gfs container, no Compose file. Distroless image UID **65532**.

```bash
export GFS_HOST_DATA=/home/gfs/gfs-data
mkdir -p "$GFS_HOST_DATA"
sudo chown 65532:"$USER" "$GFS_HOST_DATA"
sudo chmod 2775 "$GFS_HOST_DATA"

docker run -d --name gfs \
  --user 65532:65532 \
  -p 8080:8080 \
  -e GFS_TOPOLOGY=vps \
  -e GFS_DATA_DIR=/data \
  -e GFS_LISTEN=:8080 \
  -e GFS_BOOTSTRAP_ADMIN=your-admin \
  -e GFS_BOOTSTRAP_PASSWORD=a-long-unique-password \
  -e GFS_BOOTSTRAP_ADMIN_NAME=Administrator \
  -e GFS_COOKIE_SECURE=false \
  -v "${GFS_HOST_DATA}:/data" \
  ghcr.io/hrodrig/gfs:v0.5.0
```

Image tags: [gfs packages](https://github.com/hrodrig/groot-share/pkgs/container/gfs) / [groot-share releases](https://github.com/hrodrig/groot-share/releases). Match **`GFS_VERSION`** in [`../common/.env.example`](../common/.env.example).

**Check:** `curl -sS http://127.0.0.1:8080/healthz`

**Remove:** `docker stop gfs && docker rm gfs`

For HTTPS, prefer [Compose Traefik](../docker-compose/traefik/).

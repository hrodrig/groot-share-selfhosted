# Compose Traefik HTTPS

gfs behind Traefik. Set **`GFS_HOSTNAME`**, **`ACME_EMAIL`**, and **`GFS_COOKIE_SECURE=true`** in `${GFS_HOST_DATA}/.env`.

```bash
export GFS_HOST_DATA=/home/gfs/gfs-data
./run/scripts/compose-stack.sh traefik up -d
```

**Check:** `curl -sS https://your-hostname/healthz`

**Remove:** `./run/scripts/compose-stack.sh traefik down`

Docker socket is mounted read-only for Traefik’s Docker provider. Harden the host; see [gghstats-selfhosted vps-recommended](https://github.com/hrodrig/gghstats-selfhosted/tree/main/run/vps-recommended).

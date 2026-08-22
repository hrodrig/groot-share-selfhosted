# Shared env template

Copy **[`.env.example`](.env.example)** to **`${GFS_HOST_DATA}/.env`**.

That host directory is bind-mounted to **`/data`** in Compose and `docker run`. The app reads **`GFS_DATA_DIR=/data`**.

Chrome (optional, gfs ≥ v0.5.0): **`GFS_BRAND_SUB`** (app-bar tag; `-` hides), **`GFS_FOOTER`** (authenticated footer; `-` hides), **`GFS_LOGIN_SIMPLE=true`** (plain `/login`). See [Traefik README](../docker-compose/traefik/README.md#chrome-optional).

See [run/README.md](../README.md) and [DISCLAIMER.md](../../DISCLAIMER.md).

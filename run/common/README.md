# Shared env template

Copy **[`.env.example`](.env.example)** to **`${GFS_HOST_DATA}/.env`**.

That host directory is bind-mounted to **`/data`** in Compose and `docker run`. The app reads **`GFS_DATA_DIR=/data`**.

See [run/README.md](../README.md) and [DISCLAIMER.md](../../DISCLAIMER.md).

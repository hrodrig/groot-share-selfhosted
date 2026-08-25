# Linux (standalone binary and packages)

← [Standalone overview](../README.md) · [Repository README](../../../README.md).

Native Linux install — **not** Docker. Prefer packages over compiling.

---

## Install order on Linux

| Order | Method | Notes |
|-------|--------|--------|
| 1 | **`.deb`** (Debian / Ubuntu) | When published on [groot-share Releases](https://github.com/hrodrig/groot-share/releases) |
| 2 | **`.rpm`** (Fedora / RHEL / Alma / Rocky) | Same |
| 3 | **Tarball** from Releases | `gfs_*_linux_*.tar.gz` |
| 4 | **Build from source** | Last resort |

Containers: [docker](../../docker/) / [Compose](../../docker-compose/).

---

## Linux (tarball)

Replace version / arch as needed:

```bash
wget -q -O /tmp/gfs_v0.7.0_linux_amd64.tar.gz \
  https://github.com/hrodrig/groot-share/releases/download/v0.7.0/gfs_v0.7.0_linux_amd64.tar.gz
tar -xzf /tmp/gfs_v0.7.0_linux_amd64.tar.gz
sudo install -m 0755 gfs /usr/local/bin/gfs
```

> gfs ships `.tar.gz` archives (GoReleaser) — there is no `.deb` asset. See the [tarball](#tarball) notes below for the full install flow.

---

## Tarball

1. Download `gfs_*_linux_*.tar.gz` from [groot-share Releases](https://github.com/hrodrig/groot-share/releases).
2. Install the binary (example: `/usr/local/bin/gfs`).
3. Copy env template to **`/etc/gfs/gfs.env`** (not world-readable). Set `GFS_TOPOLOGY`, `GFS_DATA_DIR`, `GFS_BOOTSTRAP_*`.
4. Create the data directory and a dedicated user (or run as a locked-down service user).
5. Install the unit:

```bash
sudo install -d -m 0750 /var/lib/gfs /etc/gfs
sudo cp gfs.service /etc/systemd/system/gfs.service
sudo systemctl daemon-reload
sudo systemctl enable --now gfs
```

Unit file in this directory: [`gfs.service`](gfs.service).

**Check:** `curl -sS http://127.0.0.1:8080/healthz`

---

## From source (last resort)

```bash
git clone https://github.com/hrodrig/groot-share.git && cd groot-share
git checkout v0.7.0
make build
export GFS_TOPOLOGY=vps GFS_DATA_DIR=/var/lib/gfs
./bin/gfs
```

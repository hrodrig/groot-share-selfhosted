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

## Debian / Ubuntu (`.deb`)

**When available** on Releases (replace version / arch):

```bash
wget -q -O /tmp/gfs.deb \
  https://github.com/hrodrig/groot-share/releases/download/v0.2.1/gfs_0.2.1_linux_amd64.deb
sudo dpkg -i /tmp/gfs.deb
```

> If the `.deb` asset is missing for a tag, use the [tarball](#tarball).

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
git checkout v0.2.1
make build
export GFS_TOPOLOGY=vps GFS_DATA_DIR=/var/lib/gfs
./bin/gfs
```

# macOS (standalone)

← [Standalone overview](../README.md).

**Preferred order:** release tarball (darwin amd64 / arm64) → build from source (last).

1. Download the **darwin** archive from [groot-share Releases](https://github.com/hrodrig/groot-share/releases).
2. Extract; clear quarantine if needed: `xattr -d com.apple.quarantine ./gfs`.
3. Export `GFS_TOPOLOGY=vps` and `GFS_DATA_DIR` (writable directory), plus `GFS_BOOTSTRAP_*` on first start.
4. Run `./gfs`. Open http://127.0.0.1:8080/login.

Long-running server on a Mac host: prefer **Docker / Compose** under `run/`.

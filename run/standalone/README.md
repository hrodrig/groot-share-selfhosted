# Standalone (native binary)

Run **gfs** without Docker. Prefer packages / release archives over compiling.

| Platform | Doc |
|----------|-----|
| Linux (systemd, `.deb`/`.rpm`, tarball) | [linux/](linux/README.md) |
| macOS | [macos/](macos/README.md) |
| Windows | [windows/](windows/README.md) |

Config is environment-only (`GFS_*`). See [groot-share `.env.example`](https://github.com/hrodrig/groot-share/blob/main/.env.example) and [SPEC §5](https://github.com/hrodrig/groot-share/blob/main/docs/SPECIFICATIONS.md).

**Build from source (last resort):** clone [groot-share](https://github.com/hrodrig/groot-share), checkout a release tag, `make build`, run `./bin/gfs`.

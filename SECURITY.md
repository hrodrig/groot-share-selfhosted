# Security Policy

## Supported Versions

We support the **latest release** and the active development branch with
security updates. We use [semantic versioning](https://semver.org/)
(MAJOR.MINOR.PATCH).

| Version | Supported |
| ------- | --------- |
| Latest release | :white_check_mark: |
| Older releases | :x: |

When a vulnerability is fixed, we release a new patch version. Please upgrade
to the latest release to receive security fixes.

## Reporting a Vulnerability

**Do not open a public issue** for security vulnerabilities.

- **Preferred:** Use [GitHub Security Advisories](https://github.com/hrodrig/groot-share-selfhosted/security/advisories/new) to report privately.
- **Alternative:** Contact the maintainer via [github.com/hrodrig](https://github.com/hrodrig) with:
  - clear description
  - impact
  - steps to reproduce

## What to expect

- We acknowledge your report as soon as possible.
- We investigate and work on a fix.
- We credit reporters who want credit (unless you prefer anonymity).

Application vulnerabilities in **gfs** should be reported against **[groot-share](https://github.com/hrodrig/groot-share)**.

## Operator notes

- Keep **`AWS_*`** on the VPS (or in a Kubernetes Secret) only. Do not copy bucket keys to laptops.
- After the first successful start, drop **`GFS_BOOTSTRAP_*`** from the unit / Compose env (gfs ignores them once users exist).
- Topology **`s3`** alone is invalid — gfs refuses to start. Use [groot-selfhosted](https://github.com/hrodrig/groot-selfhosted) for S3-only.

## Host / kernel — CVE-2026-98432

Operators own the **VPS / node kernel**. Keep Linux hosts patched.

**[CVE-2026-98432](https://nvd.nist.gov/vuln/detail/CVE-2026-98432)** (Linux IPv4 TCP UAF; public PoCs abuse MPTCP listeners):

- **gfs is an HTTP listener** (unlike typical `groot collect`). Go 1.24+ enables Multipath TCP on Linux listeners by default (`GODEBUG multipathtcp=2`).
- Upstream **[groot-share](https://github.com/hrodrig/groot-share)** disables MPTCP in the binary (`SetMultipathTCP(false)`) and via `go.mod` `godebug multipathtcp=0` (see that repo’s `SECURITY.md`). Pin a gfs image that includes that mitigation when available.
- These manifests set **`GODEBUG=multipathtcp=0`** (Compose, Helm, systemd) as defense in depth and for older image tags.
- **A patched kernel remains the real fix** — plain IPv4 TCP can still reach the underlying race. Fixed lines include `5.10.272`, `5.15.223`, `6.1.190`, `6.6.159`, `6.12.113`, `6.18.56`, `7.2.10`, `7.3` or later ([Go announce](https://groups.google.com/g/golang-announce/c/PCoQcdxoScw)).

Binding to loopback does **not** disable MPTCP.

## Disclaimer

Self-hosting and data handling are **your** responsibility. See [DISCLAIMER.md](./DISCLAIMER.md).

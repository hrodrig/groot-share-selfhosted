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

## Disclaimer

Self-hosting and data handling are **your** responsibility. See [DISCLAIMER.md](./DISCLAIMER.md).

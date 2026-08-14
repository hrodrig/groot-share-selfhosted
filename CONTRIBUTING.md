# Contributing to groot-share-selfhosted

Thank you for helping improve these deployment manifests.

## How to contribute

- **Issues:** Use [GitHub Issues](https://github.com/hrodrig/groot-share-selfhosted/issues) for bugs, doc gaps, or manifest improvements (Compose, Helm, systemd).
- **Pull requests:** Open PRs against **`develop`**. Keep changes focused.
- **Application behavior** (HTTP API, auth, retention, UI): contribute in **[groot-share](https://github.com/hrodrig/groot-share)** — this repo is **infrastructure only**.

## Checks before submitting

- Paths under **`run/`** match the documented layout.
- From the clone root: **`make release-check`** (Compose **`config`**; Helm lint + template + kubeconform).
- **English** for README and comments.
- If you bump **[`VERSION`](VERSION)**, keep the README **Version** badge and **CHANGELOG** aligned.
- **`.gitignore`** is deny-all + whitelist — new top-level paths need an explicit `!` allow rule.
- Do not commit live **`.env`**, bootstrap passwords, or `AWS_*` keys.

## Git flow

- Day-to-day work on **`develop`**.
- **`main`** holds reviewed snapshots; annotated tags **`v<semver>`** on **`main`** for infra releases.

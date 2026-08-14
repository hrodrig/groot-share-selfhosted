# Agent Guidelines (groot-share-selfhosted)

- Use **English** for all project artifacts (code, comments, commit messages, docs, README).
- **Disclaimer:** keep **[DISCLAIMER.md](DISCLAIMER.md)** linked from README and operator entry points (Compose docs, `.env.example`, `compose-stack.sh` help). Do not weaken “use at your own risk / your data is your responsibility” language without explicit user approval.
- **Backlog:** track work in **[ROADMAP.md](ROADMAP.md)** (`GSH-*` band IDs). Do not invent parallel private todo lists for this repo.
- **Scope:** **groot-share-selfhosted** owns deployment (Compose, Helm, systemd, **`run/`**, runbooks) for **gfs**. Application source lives in **[groot-share](https://github.com/hrodrig/groot-share)** (binary / image **gfs**, `ghcr.io/hrodrig/gfs`).
- **Not this repo:** CronJob / bastion collect, topology **S3 only** (no gfs process) — those stay in **[groot-selfhosted](https://github.com/hrodrig/groot-selfhosted)**. In-cluster Job trigger → **[groot-trigger](https://github.com/hrodrig/groot-trigger)**.
- Follow **git flow**: work on `develop`; **`main`** for production snapshots; annotated tags **`v<semver>`** on **`main`** for infra releases (see root **`VERSION`**).
- **`VERSION`** (repository root): canonical **groot-share-selfhosted** semver (`0.1.0` style, no `v`). When it changes, align the README **Version** badge and **CHANGELOG**. **`Chart.yaml` `version:`** tracks the Helm package only — bump when **`run/kubernetes/helm/gfs/`** changes materially.
- **`GFS_HOST_DATA` (required for Compose ops):** absolute directory **outside** this clone holding live **`.env`** and durable SQLite / archive files. Updating this repo must never overwrite operator settings.
- Prefer **`./run/scripts/compose-stack.sh`** so Compose always uses **`${GFS_HOST_DATA}/.env`**. Stacks: `minimal` | `traefik`.
- Env prefixes: **`GFS_*`** (app, from [groot-share SPEC §5](https://github.com/hrodrig/groot-share/blob/main/docs/SPECIFICATIONS.md)) · **`GFS_HOST_DATA`** / **`GFS_VERSION`** / **`GFS_HOSTNAME`** (this stack) · **`AWS_*`** on the VPS only for topology **`vps-s3`**.
- **`GFS_VERSION`** pins the OCI image. Not the same field as this repo’s **`VERSION`**.
- **First admin:** `GFS_BOOTSTRAP_*` required when the user table is empty. **No** well-known default password in committed files.
- **`.gitignore`** is deny-all + whitelist. New root files need an explicit `!` allow rule. Ignore live **`.env`** and in-repo **`data/release-check/`**.
- Do not commit without first showing the proposed commit message and getting **explicit user approval**.

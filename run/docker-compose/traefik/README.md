# Compose Traefik HTTPS

gfs behind Traefik (TLS + HTTP→HTTPS). **Not** Compose [minimal](../minimal/) — that stack is loopback/lab.

**Prerequisites:** DNS **A/AAAA** for `GFS_HOSTNAME` → this host; ports **80** and **443** reachable (ACME HTTP-01). Host baseline: [vps-recommended](../../vps-recommended/).

## First boot

```bash
export GFS_HOST_DATA=/home/gfs/gfs-data   # outside the clone; yours may be /home/cbpi/gfs-data
mkdir -p "$GFS_HOST_DATA"
sudo chown 65532:"$USER" "$GFS_HOST_DATA"
sudo chmod 2775 "$GFS_HOST_DATA"
cp ../../common/.env.example "${GFS_HOST_DATA}/.env"
chmod 600 "${GFS_HOST_DATA}/.env"
```

Edit **`${GFS_HOST_DATA}/.env`**:

| Must set | Why |
|----------|-----|
| `GFS_HOST_DATA` | Same absolute path as above |
| `GFS_HOSTNAME` | Public DNS name |
| `ACME_EMAIL` | Let’s Encrypt |
| `GFS_COOKIE_SECURE=true` | HTTPS |
| `GFS_BOOTSTRAP_ADMIN` / `GFS_BOOTSTRAP_PASSWORD` | Min 8 chars. Empty user table → fail closed |
| `GFS_TOPOLOGY=vps` | Default. Do **not** set `vps-s3` unless bucket + `AWS_*` are filled |

Then:

```bash
export GFS_HOST_DATA=/home/gfs/gfs-data
../../scripts/compose-stack.sh traefik up -d
```

From clone root: `./run/scripts/compose-stack.sh traefik up -d`.

**Check:** `curl -sS https://your-hostname/healthz`

Open **https://your-hostname/login** with bootstrap. After first start, drop **`GFS_BOOTSTRAP_*`** from `.env` and `up -d` again (`restart` does not reload env).

## Chrome (optional)

Compose already forwards these from `.env` (gfs **≥ v0.5.0**). Empty = gfs defaults. After edits: `up -d`, not `restart`.

| Var | Effect |
|-----|--------|
| `GFS_BRAND_SUB` | App-bar tag after the wordmark. Default `archive door`. Your text (e.g. `ACME CORP`). `-` hides. |
| `GFS_FOOTER` | Authenticated footer. Default family line. Plain text replaces it. `-` hides. |
| `GFS_LOGIN_SIMPLE=true` | `/login` is a white form only (no hero / gfs title / favicon). |

## Security (recommended in production)

| Var | Effect |
|-----|--------|
| `GFS_BASE_URL` | Public base URL (e.g. `https://gfs.example.com`). gfs uses it verbatim for share links and ignores `X-Forwarded-Proto`/`Host`, so an untrusted client cannot poison share URLs. Empty → derived from the request (only safe behind the Traefik Docker provider that overwrites those headers). |
| `GFS_LOGIN_RATE_LIMIT` | Cap POST `/login` per IP and per username, `"count/period"` (default `20/1m`). `0` disables. |

Retention (`GFS_KEEP_LAST`, `GFS_MAX_AGE_DAYS`, `GFS_RETENTION_EVERY`, `GFS_STAGING_GRACE`) is also forwarded. Duration vars (`*_EVERY`, `*_GRACE`) use Go duration syntax and **require a unit suffix** (`1h`, `30m`); a bare number falls back to the default silently.

Example in `${GFS_HOST_DATA}/.env`:

```bash
GFS_BRAND_SUB=your site tag
GFS_FOOTER=-
# GFS_LOGIN_SIMPLE=true
```

No HTML header/footer: strings only. Contract: [groot-share SPEC §5](https://github.com/hrodrig/groot-share/blob/main/docs/SPECIFICATIONS.md).

**Remove:** `../../scripts/compose-stack.sh traefik down`

## Distroless UID

Image runs as **65532:65532**. SQLite is `${GFS_HOST_DATA}/gfs.db` (inside the container: `/data/gfs.db`).

The **directory** must be writable by **both** UID **65532** (gfs) and your SSH user (editing `.env`). Do **not** `chown -R 65532:65532` — nano then fails with `Directory '…/gfs-data' is not writable`.

```bash
sudo chown 65532:"$USER" "$GFS_HOST_DATA"
sudo chmod 2775 "$GFS_HOST_DATA"
sudo chown "$USER:$USER" "${GFS_HOST_DATA}/.env"
sudo chmod 600 "${GFS_HOST_DATA}/.env"
```

Owner **65532** → SQLite. Group **your user** → you can save `.env`. `2775` setgid keeps new files in that group.

## If gfs exits 1 (fail closed)

| Log | Meaning |
|-----|---------|
| `GFS_S3_BUCKET is required for topology vps-s3` | `.env` has `GFS_TOPOLOGY=vps-s3` without bucket + `AWS_*`. Use `vps` or fill S3. |
| `unable to open database file (14)` | Data dir not writable by UID **65532**. See above. |
| `GFS_BOOTSTRAP_ADMIN and GFS_BOOTSTRAP_PASSWORD are required when the user table is empty` | First boot: set both in `.env` (min 8 chars). Ignored once users exist. |

Docker socket is mounted read-only for Traefik’s Docker provider.

# Helm chart: gfs

Deploys **`ghcr.io/hrodrig/gfs`** with a PVC at `/data` and a bootstrap Secret.

## Install (sketch)

```bash
kubectl create namespace gfs
kubectl create secret generic gfs-bootstrap -n gfs \
  --from-literal=GFS_BOOTSTRAP_ADMIN='your-admin' \
  --from-literal=GFS_BOOTSTRAP_PASSWORD='a-long-unique-password' \
  --from-literal=GFS_BOOTSTRAP_ADMIN_NAME='Administrator'

helm upgrade --install gfs ./run/kubernetes/helm/gfs \
  --namespace gfs \
  --set bootstrap.existingSecret=gfs-bootstrap \
  --set image.tag=v0.5.0
```

## Values highlights

| Key | Default | Notes |
|-----|---------|-------|
| `replicaCount` | `1` | SQLite — do not scale without shared storage |
| `image.tag` | `v0.5.0` | Pin to groot-share release |
| `topology` | `vps` | `vps` or `vps-s3` |
| `bootstrap.existingSecret` | `""` | Preferred over inline admin/password |
| `bootstrap.name` | `""` | First admin display name (gfs default `Administrator`) |
| `s3.existingSecret` | `""` | Required keys when `topology=vps-s3` |
| `env.loginSimple` | `"false"` | `true`: white `/login` (no product chrome) |
| `env.brandSub` | `""` | App-bar tag (default `archive door`). `-` hides |
| `env.footer` | `""` | Footer text (default family links). `-` hides |

## Validate

```bash
make release-check
```

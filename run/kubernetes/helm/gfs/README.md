# Helm chart: gfs

Deploys **`ghcr.io/hrodrig/gfs`** with a PVC at `/data` and a bootstrap Secret.

## Install (sketch)

```bash
kubectl create namespace gfs
kubectl create secret generic gfs-bootstrap -n gfs \
  --from-literal=GFS_BOOTSTRAP_ADMIN='your-admin' \
  --from-literal=GFS_BOOTSTRAP_PASSWORD='a-long-unique-password'

helm upgrade --install gfs ./run/kubernetes/helm/gfs \
  --namespace gfs \
  --set bootstrap.existingSecret=gfs-bootstrap \
  --set image.tag=v0.2.0
```

## Values highlights

| Key | Default | Notes |
|-----|---------|-------|
| `replicaCount` | `1` | SQLite — do not scale without shared storage |
| `image.tag` | `v0.2.0` | Pin to groot-share release |
| `topology` | `vps` | `vps` or `vps-s3` |
| `bootstrap.existingSecret` | `""` | Preferred over inline admin/password |
| `s3.existingSecret` | `""` | Required keys when `topology=vps-s3` |

## Validate

```bash
make release-check
```

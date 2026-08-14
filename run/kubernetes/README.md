# Kubernetes

| Path | Role |
|------|------|
| [helm/gfs/](helm/gfs/) | Chart **gfs** (preferred) |
| [manifests/](manifests/) | Prefer `helm template` |
| [gh-pages-landing/](gh-pages-landing/) | Pages landing for Helm repo |

Replica count is **1** by default (SQLite + local disk). Do not scale replicas on topology `vps` without shared storage.

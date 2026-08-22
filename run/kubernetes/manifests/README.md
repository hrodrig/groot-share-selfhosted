# Flat manifests

Prefer rendering the chart:

```bash
helm template gfs ../helm/gfs \
  --namespace gfs \
  --set bootstrap.existingSecret=gfs-bootstrap \
  --set image.tag=v0.5.0
```

Do not hand-maintain a second YAML dialect.

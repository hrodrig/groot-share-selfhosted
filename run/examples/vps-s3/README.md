# Topology `vps-s3`

Bucket is **home**. gfs HTTP ingest transits staging → prefix. Cluster **`groot upload.s3`** to the same prefix is preferred (multi-GB skips the VPS). Laptops/bastions should **not** hold long-lived `AWS_*`.

1. Same host steps as [vps](../vps/README.md).
2. In `${GFS_HOST_DATA}/.env`:

   ```bash
   GFS_TOPOLOGY=vps-s3
   GFS_S3_BUCKET=your-bucket
   GFS_S3_REGION=us-east-1
   GFS_S3_ENDPOINT=https://your-s3-compatible-endpoint
   GFS_S3_PREFIX=captures/
   GFS_S3_PATH_STYLE=true
   AWS_ACCESS_KEY_ID=...
   AWS_SECRET_ACCESS_KEY=...
   ```

3. Fail closed: gfs will not start without bucket + both AWS keys.
4. Cluster / trigger: configure groot `upload.s3` with the **same** prefix. gfs lists whatever keys already land there.
5. S3-only (no gfs process) is a different topology — use [groot-selfhosted s3-contabo](https://github.com/hrodrig/groot-selfhosted/tree/main/run/examples/s3-contabo).

Vendor-specific bucket setup (Contabo path-style, MinIO, R2, …) stays in **groot-selfhosted** examples; this file only wires **gfs**.

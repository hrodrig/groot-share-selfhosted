# Favicons

Same **gfs crate** mark as [groot-share `assets/favicons`](https://github.com/hrodrig/groot-share/tree/main/assets/favicons). This repo deploys that app — do not invent a second logo.

**Source:** [`favicon.svg`](favicon.svg). Rasters are generated from it.

```bash
SVG=assets/favicons/favicon.svg
rsvg-convert -w 16  -h 16  "$SVG" -o assets/favicons/favicon-16x16.png
rsvg-convert -w 32  -h 32  "$SVG" -o assets/favicons/favicon-32x32.png
rsvg-convert -w 180 -h 180 "$SVG" -o assets/favicons/apple-touch-icon.png
rsvg-convert -w 192 -h 192 "$SVG" -o assets/favicons/android-chrome-192x192.png
rsvg-convert -w 512 -h 512 "$SVG" -o assets/favicons/android-chrome-512x512.png
magick assets/favicons/favicon-16x16.png assets/favicons/favicon-32x32.png assets/favicons/favicon.ico
```

Helm Pages landing copies **svg + ico + 32px** from here into [`run/kubernetes/gh-pages-landing/`](../../run/kubernetes/gh-pages-landing/). After changing the SVG, regenerate rasters and recopy those three files.

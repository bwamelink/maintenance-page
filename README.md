# Maintenance Page — Anders Luisteren

Lightweight, zero-dependency static maintenance page for **Anders Luisteren** ([andersluisteren.com](https://andersluisteren.com)), pre-configured for **Coolify** / Docker to protect Google SEO rankings during maintenance.

## Features
- **Google SEO Safe (`503 Service Unavailable`)**: `nginx.conf` returns HTTP status `503` along with `Retry-After: 3600` and `Cache-Control: no-store` on **every URL** (`/*`). This tells Googlebot the downtime is temporary and preserves all indexed pages and rankings.
- **Coolify Healthcheck Ready (`/health`)**: Exposes `/health` returning `200 OK` (and a built-in Docker `HEALTHCHECK`) so Coolify/Traefik sees the container as healthy while visitors and bots receive `503`.
- **Single-file (`index.html`)**: Inline CSS and SVG with zero external dependencies so it works reliably during outages.
- **Responsive & Accessible**: Clean layout for mobile and desktop with automatic light/dark mode (`prefers-color-scheme`).

## Deploying on Coolify
1. Create a new resource in Coolify from this GitHub repository (`bwamelink/maintenance-page`).
2. Select **Dockerfile** as the Build Pack (port `80`).
3. If configuring a custom Healthcheck Path in Coolify UI, set it to `/health` (returns `200 OK`).
4. Deploy! Every other route (`/` and any subpage) will serve `index.html` with `503 Service Unavailable` and `Retry-After: 3600`.

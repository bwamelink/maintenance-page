FROM nginx:alpine

# Remove default nginx config and replace with our 503 maintenance config
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy static maintenance page
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

# Built-in healthcheck against /health (which returns 200 OK while all other routes return 503)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1/health || exit 1

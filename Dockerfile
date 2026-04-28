FROM nginx:1.27-alpine AS base

LABEL maintainer="Luiz Felipe Cibulski"

# Copia o HTML como template 
COPY index.html /usr/share/nginx/html/index.html.tmpl

# Copia e dá permissão ao entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expõe a porta padrão HTTP
EXPOSE 80

# Health check nativo do Docker
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost/health || exit 1

# Entrypoint injeta as envs e inicia o nginx
ENTRYPOINT ["/entrypoint.sh"]

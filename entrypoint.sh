#!/bin/sh
set -e

ENV="TESTE"

# Injeta as variáveis no HTML de template → arquivo servido
sed \
  -e "s|__ENV__|${ENV}|g" \
  /usr/share/nginx/html/index.html.tmpl > /usr/share/nginx/html/index.html

echo ">> HTML gerado com sucesso!"

# Inicia o nginx em foreground
exec nginx -g "daemon off;"

#!/bin/sh
set -e

# Generate web server config
mkdir -p "$OUTDIR"
for file in $(cd "$INDIR" && echo *); do
    envsubst "$(sh -c 'compgen -v' | xargs printf '$%s ')" < \
        "$INDIR/$file" >                                     \
        "$OUTDIR/$file"
done

[ -n "$SSL_DOMAIN" ] && DOMAIN="$SSL_DOMAIN"

# Generate certificates
certbot -n certonly \
    --standalone    \
    --agree-tos     \
    --no-eff-email  \
    -m "$EMAIL"     \
    -d "$DOMAIN"    \

#!/bin/bash
set -e

# Generate web server config
mkdir -p "$OUTDIR"
for file in $(cd "$INDIR" && echo *); do
    envsubst "$(bash -c 'compgen -v' | xargs printf '$%s ')" < "$INDIR/$file" > "$OUTDIR/$file"
done

# Generate certificates
CERTBOT="certbot certonly --standalone --agree-tos --no-eff-email"

for domain in $DOMAIN; do
    CERTBOT+=" -d $domain"
done

$CERTBOT

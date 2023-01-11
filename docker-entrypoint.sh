#!/bin/sh -e

# Generate web server config
mkdir -p "$OUTDIR"
for file in $(cd "$INDIR" && echo *); do
    envsubst "$(compgen -v | xargs printf '$%s ')" < \
        "$INDIR/$file" > "$OUTDIR/$file"
done

# Generate certificates
exec "$*"

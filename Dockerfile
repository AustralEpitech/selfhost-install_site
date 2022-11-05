FROM certbot/certbot
RUN apk add --no-cache \
        bash           \
        gettext
COPY docker-entrypoint.sh /usr/local/bin/
ENV INDIR=/web               \
    OUTDIR=/sites-availables
VOLUME "$OUTDIR"
ENTRYPOINT ["docker-entrypoint.sh"]

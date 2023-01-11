FROM debian:11
RUN apt-get update && apt-get install -y \
        certbot                          \
        python3-certbot-nginx            \
    && rm -rf /var/lib/apt/ /var/cache/
COPY docker-entrypoint.sh /usr/local/bin/
ENV INDIR=/web \
    OUTDIR=/sites-availables
VOLUME "$OUTDIR"
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["certbot",       \
    "-ncertonly",     \
    "--standalone",   \
    "--agree-tos",    \
    "--no-eff-email", \
    "-m$EMAIL",       \
    "-d$BASE_URL"     \
]

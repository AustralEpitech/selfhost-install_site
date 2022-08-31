FROM certbot/certbot
RUN apk add --no-cache -u bash gettext
COPY docker-entrypoint.sh /
EXPOSE 80
VOLUME /etc/letsencrypt/ /sites-availables/
ENV INDIR=/web/
ENV OUTDIR=/sites-availables/
ENTRYPOINT ["/docker-entrypoint.sh"]

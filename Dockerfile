FROM certbot/certbot
RUN apk add --no-cache -u gettext
COPY docker-entrypoint.sh /
VOLUME /etc/letsencrypt/ /sites-availables/
EXPOSE 80 443
ENV INDIR=/web/
ENV OUTDIR=/sites-availables/
ENTRYPOINT ["/docker-entrypoint.sh"]

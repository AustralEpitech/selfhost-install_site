FROM certbot/certbot
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
VOLUME /etc/letsencrypt /sites-availables
EXPOSE 80 443
ENV INDIR=/input_files
ENV OUTDIR=/sites-availables
ENTRYPOINT /docker-entrypoint.sh

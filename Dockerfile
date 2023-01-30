FROM --platform=$TARGETPLATFORM node:12.16.3-stretch

COPY . /app

WORKDIR /app

RUN npm install -g bower \
    && npm --unsafe-perm --production install \
    && adduser --no-create-home --system  --disabled-password --uid 1200 --shell /usr/sbin/nologin konga \
    && mkdir /app/kongadata /app/.tmp \
    && chown -R 1200:1200 /app/views /app/kongadata /app/.tmp

EXPOSE 1337

VOLUME /app/kongadata

ENTRYPOINT ["/app/start.sh"]

FROM ghcr.io/mega-yfue/aarch64-addon-eufy-sdk-bridge:0.8.2
WORKDIR /app
COPY overlay/ /app/
COPY seed-session.sh /seed-session.sh
CMD ["/bin/sh", "/seed-session.sh"]

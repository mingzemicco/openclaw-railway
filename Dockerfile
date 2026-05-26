FROM ghcr.io/openclaw/openclaw:main
EXPOSE 18789
USER root

WORKDIR /app

ENTRYPOINT if [ -f /data/.openclaw/openclaw.json ]; then \
             sed -i 's/127.0.0.1/0.0.0.0/g' /data/.openclaw/openclaw.json; \
           fi; \
           node /app/dist/index.js

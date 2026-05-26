FROM ghcr.io/openclaw/openclaw:main
EXPOSE 18789
USER root
RUN apt-get update && apt-get install -y socat sed && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ENTRYPOINT socat TCP-LISTEN:18789,fork,reuseaddr TCP:127.0.0.1:18789 & \
           if [ -f /data/.openclaw/openclaw.json ]; then sed -i 's/127.0.0.1/0.0.0.0/g' /data/.openclaw/openclaw.json; fi; \
           node /app/dist/index.js

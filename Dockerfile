FROM ghcr.io/openclaw/openclaw:main
EXPOSE 18789
USER root
WORKDIR /app

ENTRYPOINT if [ -f /data/.openclaw/openclaw.json ]; then \
             sed -i 's/"bind": "loopback"/"bind": "lan"/g' /data/.openclaw/openclaw.json; \
           fi; \
           openclaw gateway

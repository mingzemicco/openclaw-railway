# 直接拉取 OpenClaw 官方已经打包好的最新镜像
FROM ghcr.io/openclaw/openclaw:main

# 暴露 OpenClaw 默认的 Web 端口
EXPOSE 8000

# 保持官方默认的启动命令
CMD ["node", "apps/bot/dist/index.js"]

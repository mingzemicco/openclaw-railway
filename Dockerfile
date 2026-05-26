# 1. 使用官方最新预构建镜像
FROM ghcr.io/openclaw/openclaw:main

# 2. 暴露端口
EXPOSE 8000

# 3. 切换到 root 用户并保持，用绝对权力压制权限问题
USER root
# 4. 安装 socat（轻量级端口转发工具）
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*

# 5. 用一个脚本同时启动 OpenClaw 和 socat 转发器
CMD socat TCP-LISTEN:18789,fork,reuseaddr TCP:127.0.0.1:18789 & \
    node apps/bot/dist/index.js

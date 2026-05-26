# 1. 使用官方最新预构建镜像
FROM ghcr.io/openclaw/openclaw:main

# 2. 暴露端口
EXPOSE 18789

# 3. 切换到 root 权限
USER root

# 4. 安装 socat 和 sed
RUN apt-get update && apt-get install -y socat sed && rm -rf /var/lib/apt/lists/*

# 5. 纯文本格式的前置脚本，完美避开语法解析坑
ENTRYPOINT socat TCP-LISTEN:18789,fork,reuseaddr TCP:127.0.0.1:18789 & \
           if [ -f /data/.openclaw/openclaw.json ]; then sed -i 's/127.0.0.1/0.0.0.0/g' /data/.openclaw/openclaw.json; fi; \
           node apps/bot/dist/index.js

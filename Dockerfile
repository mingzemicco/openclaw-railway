# 1. 使用官方最新预构建镜像
FROM ghcr.io/openclaw/openclaw:main

# 2. 暴露端口
EXPOSE 18789

# 3. 切换到 root 权限
USER root

# 4. 安装 socat 和 sed（用于文本替换）
RUN apt-get update && apt-get install -y socat sed && rm -rf /var/lib/apt/lists/*

# 5. 注入启动前置脚本：强行转发，并确保配置绑定 0.0.0.0
ENTRYPOINT ["/bin/sh", "-c", "socat TCP-LISTEN:18789,fork,reuseaddr TCP:127.0.0.1:18789 & if [ -f /data/.openclaw/openclaw.json ]; then sed -i 's/127.0.0.1/0.0.0.0/g' /data/.openclaw/openclaw.json; fi; exec \"$@\"", \"--\"]

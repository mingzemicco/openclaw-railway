# 1. 使用官方最新预构建镜像
FROM ghcr.io/openclaw/openclaw:main

# 2. 暴露端口
EXPOSE 8000

# 3. 切换到 root 用户并保持，用绝对权力压制权限问题
USER root

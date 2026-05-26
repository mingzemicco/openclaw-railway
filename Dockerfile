# 1. 使用官方最新预构建镜像
FROM ghcr.io/openclaw/openclaw:main

# 2. 暴露端口
EXPOSE 8000

# 3. 切换到 root 用户来修改目录权限
USER root

# 4. 确保 /data 目录存在，并将权限完全开放给所有用户（或 node 用户）
RUN mkdir -p /data && chmod -R 777 /data

# 5. 切换回官方默认的普通用户（通常是 node），保证安全运行
USER node

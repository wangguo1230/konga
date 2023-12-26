# 如果在构建镜像的时候报  integrity checksum failed when using sha1 或 no such file or directory 
# 将package-lock.json 删掉后重试打包。
docker buildx build --platform linux/arm64/v8,linux/amd64 -t zerowgd/konga:1.0.0 . --push
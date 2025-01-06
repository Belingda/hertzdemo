# 选择基础镜像，这里选择Go官方镜像作为基础，版本根据你项目需求定，示例中用1.18版本
FROM golang:1.23.4

# 设置工作目录，后续操作都在此目录下进行，这里设置为 /app
WORKDIR /app

# 将当前目录（也就是包含Dockerfile和Hertz项目代码的目录）下的所有内容复制到镜像内的 /app 目录
COPY . /app

# 安装Hertz相关依赖，运行Go命令安装项目依赖，假设项目有go.mod和go.sum文件用于管理依赖
RUN go mod download

# 构建Hertz项目，将Go代码编译成可执行文件，这里假设主包名为main，可根据实际调整
RUN go build -o hertz_server main.go

# 暴露Hertz服务器运行的端口，Hertz默认端口一般是8888，根据实际项目配置修改端口号
EXPOSE 8080

# 定义容器启动时执行的命令，启动编译好的Hertz可执行文件
CMD ["./hertz_server"]
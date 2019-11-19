# 安装docker

官网 https://docs.docker.com/install/linux/docker-ce/centos/

### 1、安装程序依赖包

`yum-utils`提供 `yum-config-manager`实用程序

`device-mapper-persistent-data` and`lvm2` 提供`devicemapper`存储驱动程序

```shell
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

### 2、设置阿里云镜像源

```shell
sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo 
```

### 3、安装Docker-CE

```shell
sudo yum install docker-ce
```

### 4、启动Docker-CE

```shell
sudo systemctl enable docker
sudo systemctl start docker
```

### 5、[可选]* 为 Docker 建立用户组

docker 命令与 Docker 引擎通讯之间通过 UnixSocket ，但是能够有权限访问 UnixSocket 的用户只有  root 和 docker 用户组的用户才能够进行访问，所以我们需要建立一个 docker 用户组，并且将需要访问 docker  的用户添加到这一个用户组当中来。

#### 1、建立 Docker 用户组

```
sudo groupadd docker
```

#### 2.添加当前用户到 docker 组

```
sudo usermod -aG docker $USER
```

### 6、镜像加速配置

使用 https://cr.console.aliyun.com/#/accelerator 阿里云提供的镜像加速，登录后，左侧列表点击`镜像中心 --> 镜像加速器`找到加速器地址，复制下来。

```shell
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["你的加速器地址"]
}
EOF

#重新加载配置，重启docker服务
sudo systemctl daemon-reload
sudo systemctl restart docker
```



hello-world

```shell
docker run hello-world
```

```shell
[root@hadoop-1 docker]# docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete 
Digest: sha256:c3b4ada4687bbaa170745b3e4dd8ac3f194ca95b2d0518b417fb47e5879d9b5f
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

```




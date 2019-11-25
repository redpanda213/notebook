# Docker 基础命令

## 帮助命令

- docker version
- docker info
- docker --help

## 镜像命令

- docker images
- docker search
- docker pull
  - docker pull hello-world
- docker rmi 
  - docker rmi -f NAME1 NAME2    删除多个
  - docker rmi -f NAME1：TAG    删除一个，TAG为版本
  - docker rmi -f $(docker images -q)   删除全部 、
- docker commit
- docker run 
- docker inspect

## 容器命令

- docker start ID
- docker attach ID
- docker  stop ID
- docker rm ID

退出容器 

- exit  退出并停止容器
- ctrl + P + Q  退出容器但不停止
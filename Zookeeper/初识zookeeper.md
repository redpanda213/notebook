# ZooKeeper

## 一、安装

## 二、配置

```shell
cd /opt/bigdata/zk345/conf
cp zoo.sample.cfg zoo.cfg
vi zoo.cfg
```

```shell
#查看
dataDir=/opt/zkdir#最好自己重新设置一个目录
clientPort=2181#端口号记一下
#最后增加
server.1=192.168.56.110:2888:3888

```

```shell
vi /etc/profile
```

```shell
export ZOOKEEPER_HOME=/opt/bigdata/zk345
export PATH=$PATH:$ZOOKEEPER_HOME/bin
```

```shell
source /etc/profile
```

## 三、运行

```shell
zkServer.sh start#启动zookeeper服务
zkCli.sh#启动zookeeper的小黑窗口
#在看到WatchedEvent state:SyncConnected type:None path:null后
#按Enter，出现[zk: localhost:2181(CONNECTED) 0] 启动成功
```


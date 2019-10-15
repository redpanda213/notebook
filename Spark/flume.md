```shell
bin/flume-ng agent --conf conf -f /opt/bigdata/flume160/conf/file.conf -n wt
./flume-ng agent --conf conf -f /opt/bigdata/flume160/conf/file.conf -n wt -Dflume.root.logger=DEBUG,console


```

```shell
#4
#
kafka-console-consumer.sh --zookeeper 127.0.0.1:2181 --bootstrap-server 127.0.0.1:9092 --topic user_friends

```

```shell
#2
#启动flume监控，并通过flume将文件传输至kafka的消息队列中
bin/flume-ng agent --conf conf -f /opt/bigdata/flume160/conf/file.conf -n wt -Dflume.root.logger=DEBUG,console

```

```shell
#1
#先启动kafka服务
kafka-server-start.sh /opt/bigdata/kafka211/config/server.properties
```

```shell
#3
#创建一个kafka的消息队列，并设置分区和副本数
kafka-topics.sh --create --topic user_friends --zookeeper 127.0.0.1:2181 --partitions 1 --replication-factor 1

```

```shell
chmod 777 -R /opt/data/flumeSpool
chmod 777 -R /opt/data/flume
```

```shell
install -m 777 events.csv /opt/data/flumeSpool
```




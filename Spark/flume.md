# kafka-flume

```shell
#1
#先启动kafka服务
kafka-server-start.sh /opt/bigdata/kafka211/config/server.properties

```

```shell
#2
#开启flume命令，并通过flume将文件传输至kafka的消息队列中
bin/flume-ng agent --conf conf -f /opt/bigdata/flume160/conf/file.conf -n wt -Dflume.root.logger=DEBUG,console

```

```shell
#3
#开启消费者
kafka-console-consumer.sh --zookeeper 127.0.0.1:2181 --bootstrap-server 127.0.0.1:9092 --topic user_friends
```

```shell
#4
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



kafka-console-consumer.sh --topic __consumer_offsets --zookeeper localhost:2181 --formatter "kafka.coordinator.GroupMetadataManager\$OffsetsMessageFormatter" --consumer.config config/consumer.properties --from-beginning


```shell
bin/kafka-console-consumer.sh --topic __consumer_offsets --zookeeper 127.0.0.1:2181 --formatter "kafka.coordinator.GroupMetadataManager\$OffsetsMessageFormatter" --consumer.config ../config/consumer.properties --from-beginning  --delete-consumer-offsets

```

```shell
spark/bin/spark-submit /opt/test_jars/mykafka.jar --class com.kgc.mykafka.MyConsumer
```

**查看topic消息**

```shell
bin/kafka-run-class.sh kafka.tools.GetOffsetShell --topic user_friends --time -1 --broker-list 127.0.0.1:9092 --partitions 0
```

**重置**

```shell
#重置使用前需要在
/kafka/config/server.properties此文件中添加

delete.topic.enable=true

bin/kafka-streams-application-reset.sh --zookeeper 127.0.0.1:2181 --application-id user_friends --input-topics user_friends

```

**---???----**

```shell
kafka-run-class.sh kafka.tools.ConsumerOffsetChecker --broker-info --group $group --topic $topic --zookeeper $zk_host:21
```

查看consumer group

```shell
bin/kafka-consumer-groups.sh --zookeeper 127.0.0.1:2181 --list
```

**查看topic内容**

```shell
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --zookeeper 127.0.0.1:2181 --topic topicName --from-beginning

```

```shell
bin/kafka-topics.sh --zookeeper 127.0.0.1:2181 --list
__consumer_offsets
```

**删除topic**

```
bin/kafka-topics.sh --zookeeper 127.0.0.1:2181 --delete --topic user_friend

```

**查看topic的分区和副本情况**

```
bin/kafka-topics.sh --zookeeper 127.0.0.1:2181 --describe --topic users
```


# Apache Kafka基础

消息源头

- spark
- App
- Nifi
- DB
- Flume
- NoSQL
- micro service
- stream processing
- ......

## 特点

- 消息是可以储存在消息队列中 ，而不会消失
- 高吞吐量 `high-throughput`，横向扩展，
-  分布式 `distributed`，
- 发布/订阅模式 `publish-subscribe`，发布的人不知道谁会来用消息，有点像一个设计模式
- fast
- scalable
- durable
- real-time

## 架构

`kafka architecture`

- producer: 可以向多个topic发布消息，不同的producer可以送一个，或多个topic，与topic多对多关系 producers publish messages to Kafka topics
- topic：
  - kafka cluster
    - broker ：由zookeeper管理 Servers in a Kafka cluster are called Brokers
- customer: Consumers subscribe to Topics and process the feed of published messages

### Topic

- topics：a topic is a category or feed name to which messages are published
- paratitions:：topics 可以分区或备份到多个节点或者brikers上，(key,value)由key分区
- Logs：每个分区都被看代为一个log，即一组有序的消息
- Retention Period：停留时间，kafka消息可以保留一段配置的固定时间，无论消息是否被消费
- 消费者会保留和跟踪在每个log中的它们的位置或偏移量

*删除topic之前需要这样做*

```shell
vi /kafka/config/server.properties
#打开此文件
#更改属性
#delete.topic.enable = true 
```

```shell
#创建topic
kafka-topics.sh --create --topic user_friends --zookeeper 127.0.0.1:2181 --partitions 1 --replication-factor 1
#查看topic
kafka-topics.sh --zookeeper 127.0.0.1:2181 --list
```

### Broker

- brokers 是 kafka集群上的服务
- 每个分区都有一个服务作为一个leader，同时 零个或者多个server作为follows/ISRs
  - leader 处理所有的读和写 的请求
  - follows 被动地备份leader
- 每个服务器充当某些分区的领导者和其他分区的追随者，因此负载非常平衡。

当一个leader挂掉之后，zookeeper可以提升一个在ISR中的replication为leader

`ISR` ：in-sysc relpica  在实际工作中至少有一个，但是会影响吞吐量性能

### Producer

- 生产者发布数据到它们选择的topic中
  - 一个生产者负责选择消息被分配到那个topic的那个分区中
    - Typically by “round-robin”or “semantic-partitioning” by Key
-  Async Publishing (less durable)
- 所有的节点都可以响应元数据请求，例如
  - 哪个服务活着
  - topic的分区的leader在哪里

### Consumer

- consumer消费订阅的消息
- 多个consumers可以从同一个topics中读
- consumers会被组成consumer groups
- 使用consumer 一定要给一个group id，kafka提供消息给一个consumer group 而不是直接提供给一个consumer实例
  - 因此偏移量管理是位于consumer group层级的
- 消息保留在kafka，而不会在它们被消费之后被移除掉

同一时间，一个partition只允许同一个组中的一个consumer读，不允许同组的其他consumer读，允许不属于这个组的其他consumer读。

也就是说，一个consumer可以读多个partitions 但是同一组的多个consumers不可同时读一个partition。

![image-20191114102027327](D:\笔记\北美大数据项目\photo\consumer_partition.png)

在创建一个consumer group中的consumers时是，数量不能多于目标topic中的partition的数量，否则多余的consumers将是浪费，因为它根本没有partition供它读。

多个producer可以同时操作同一个topic，

#### Rebalancing

- Rebalancing（by group coordinator）
  - 一个topic的分区在一个group的consumers中被分配
  - 对于一个组中的consumers的可用性，分区们会被重新分配以致于每个consumer接收到按比例分配的分区

### Zookeeper

- kafka使用zookeeper作为分布式配置存储

  - It forms the backbone of Kafka cluster that continuously monitor the health of the brokers / cluster它构成Kafka集群的主干，持续监控代理/集群的健康状况

- Kafka的初始版本使用ZooKeeper来存储每个消费者的偏移信息；从0.10开始，Kafka有自己的内部偏移存储主题  _consumer_offset_

  ```shell
  [root@elk-2 bin]# ./kafka-topics.sh --zookeeper 127.0.0.1:2181 --list
  __consumer_offsets
  #这个topic存储了offsets信息
  ```

## Kafka APIs

- **producer API**
- **consumer API**
- **streams API**
- **connnect API**

## Message Ordering

- Ordering is only guaranteed within a partition for a topic  消息仅保证在一个topic的一个partition中有序
- 为了确保一个topic的总体有序
  -  If all message must be ordered within one topic, use one partition 
  - If messages can be ordered by certain properties 
    -  Group messages in a partition by Key (defined upon the properties in producer)
    -  Configure exactly one consumer instance per partition within a consumer group 
- note
  - Data within a Partition will be stored in the order in which it is written, therefore data read from a Partition will be read in the order for that partition.

## Message Replication

- Durability can be configured with the Producer configuration 消息持久化可以配置为生产者配置

  **request.required.acks**

  - 0 - producer不会等待任何的ack的返回，确认消息发送完成
  - 1 - producer leader 在备份已经接受到的数据完成后，producer才得到一个ack，确认消息发送完成
  - -1/all - producer会得到ack ，在所有的ISRs 都接收到数据之后

- 还可以配置最小可用ISR，以便在没有足够的副本可用来复制数据时返回错误。

## Data Loss at the Producer

## Data Delivered but Loss in the Cluster

## Data Duplication

## Kafka Use Cases



## 

## 
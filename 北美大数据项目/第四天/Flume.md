# Flume

## Apache Flume is

- 一种将流日志从多种不同来源导入hadoop和其他目的地的服务
- 一种分布式的、可靠的、可用的服务用于高效地收集、总计、

## Flume能做什么

- 处理流数据
- insulate 独立的系统，
- gratantee data delivery 保证数据传递
- scale horizontally 横向扩展



主要目的：传送数据，将数据从数据源出传送到目的地

与kafka做对比，kafka核心是当做一个库，producer不是核心。

## 简单的Flume数据流向

web server 到 flume agent 到 hdfs



## 架构

- flume 配置一个或者多个代理，根据数据情况，网络架构来部署agents

- 一个flume代理是一个JVM进程，

- 每个代理都包含了3个组分

  - source
  - channel
  - sink

  > 从source到channel
  >
  > 从channel到sink 作为两个事务处理，

### source

- 监听外部应用的events，比如web server、
  - 读取数据
  - 解析，转换数据
  - 处理失败
- 不能存储events
- 发送events 到Channel
- spooling directory channel
- built-in APIs

### Channel

- channel 是一个代理中sources 和 sinks之间的交流桥梁
- 存储events 直到它被sink 消费
- built-in support
  - 内存通道
  - 文件通道（检查点机制），checkpoint在数据传送途中发生错误时，再次传输不发生重复发送，从记录的checkpoint处继续发送余下的数据。
  - JDBC 通道
  - spill-able memory channel

### Sink

- 从channel 转移event
- 将event传到外部库，比如HDFS或者它流向下一个agent的Flume source

#### HDFS Sink

- 将events 写入 HDFS

- 一般情况下，导入HDFS会形成很多小文件，可以通过配置调整解决

  - Rollover properties
  - hdfs.rollinterval

  ```shell
  # Flume agent config
  sandbox.sources = eventlog
  sandbox.channels = file_channel
  sandbox.sinks = sink_to_hdfs
  
  # Define / Configure source
  sandbox.sources.eventlog.type = exec
  sandbox.sources.eventlog.command = tail -F --lines=5000 /var/log/eventlog-demo.log
  sandbox.sources.eventlog.restart = true
  sandbox.sources.eventlog.batchSize = 3000
  
  
  # HDFS sinks
  sandbox.sinks.sink_to_hdfs.type = hdfs
  sandbox.sinks.sink_to_hdfs.hdfs.fileType = DataStream
  sandbox.sinks.sink_to_hdfs.hdfs.path = /flume/events
  sandbox.sinks.sink_to_hdfs.hdfs.filePrefix = eventlog
  sandbox.sinks.sink_to_hdfs.hdfs.fileSuffix = .log
  sandbox.sinks.sink_to_hdfs.hdfs.rollSize = 100
  sandbox.sinks.sink_to_hdfs.hdfs.batchSize = 10000
  
  # Use a channel which buffers events in memory
  sandbox.channels.file_channel.type = file
  sandbox.channels.file_channel.checkpointDir = /var/flume/checkpoint
  sandbox.channels.file_channel.dataDirs = /var/flume/data
  
  # Bind the source and sink to the channel
  sandbox.sources.eventlog.channels = file_channel
  sandbox.sinks.sink_to_hdfs.channel = file_channel
  
  ```

  

### 

### 多代理体系结构

存在串联和并联模式

1、多个web server导入多个flume agent ，再汇总到一个agent送出（不同的数据源汇总到一个目的地）

2、在一个agent中，一个source 通过多个channels 传到 对应的sinks，多个sinks送到不同的目的地（同一个数据源送到不同的目的地）

> 一个source可以对应多个channels，一个channel只有一个source，一个channel对应一个sink

## 事务

`Transcation`

- 一个事务由一个Channel实现
- asdf
- flume在内部可以完成事务性处理

## Flume Event

flume 传送的数据单元 ----- event

event---指小而快的数据message，一种简单的数据包，

## Flume适合场景

不适合

- very large events
  - 
- infrequent bulks loads

> `细水长流`


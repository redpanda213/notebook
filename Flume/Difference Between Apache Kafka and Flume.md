##  Difference Between Apache Kafka and Flume

Apache Kafka will process incoming data streams irrespective of their  source and its destination. It is a distributed streaming platform with  capabilities similar to an enterprise messaging system but has unique  capabilities with high levels of sophistication.  With Kafka, users can  publish and subscribe to information as and when they occur. It allows  users to store data streams in a fault-tolerant manner. Irrespective of  the application or use case, Kafka easily factors massive data streams  for [analysis](https://www.educba.com/course/analysis-valuations-special-situations/) in enterprise [Apache Hadoop](https://www.educba.com/apache-hadoop-vs-apache-spark/). Kafka also can render streaming data through a combination of [Apache HBase](https://www.educba.com/apache-hive-vs-apache-hbase/), [Apache Storm](https://www.educba.com/apache-storm-vs-kafka/), and [Apache Spark](https://www.educba.com/apache-spark-for-dummies/) systems and can be used in a variety of application domains. 

kafka将处理传入的数据流，而不管其来源和目的地。它是一个分布式流式处理平台，具有类似于企业邮件系统的功能，但具有独特的功能和高度的成熟度。使用 Kafka，用户可以在信息发生时发布和订阅信息。它允许用户以容错方式存储数据流，无论应用或用例如何，Kafka 都可以轻松将海量数据流用于企业 Apache Hadoop 中的分析。Kafka 还可以通过 Apache HBase、Apache Storm 和 Apache Spark 系统的组合来呈现流数据，并可用于各种应用程序域。

 In simplistic terms, Kafka’s publish-subscribe system is made up of publishers, [Kafka cluster](https://www.educba.com/course/apache-kafka-tutorials/), and consumers/subscribers. Data published by the publisher are stored  as logs. Subscribers can also act as publishers and vice-versa. A  subscriber requests for a subscription and Kafka forwards the data to  the requested subscriber. Typically, there can be numerous publishers  and subscribers on different topics on a Kafka cluster. Likewise, an  application can act as both, a publisher and subscriber. A message  published for a topic can have multiple interested subscribers; the  system processes data for every interested subscriber. Some of the use  cases where Kafka is widely used are: 

 简单来说，Kafka的发布-订阅系统由发布者，Kafka集群和消费者/订阅者组成。 发布者发布的数据存储为日志。 订户还可以充当发布者，反之亦然。 订阅者请求订阅，Kafka将数据转发给请求的订阅者。 通常，在Kafka集群上，可以有许多不同主题的发布者和订阅者。 同样，应用程序既可以充当发布者，也可以充当订阅者。 针对某个主题发布的消息可以有多个感兴趣的订阅者； 系统为每个感兴趣的订户处理数据。 Kafka被广泛使用的一些用例是： 

- Track activities on a website跟踪网站上的活动
- Stream processing流处理
- Collecting and monitoring metrics收集和监控指标
- Log Aggregation   日志汇总 

 [Apache Flume](https://www.educba.com/course/apache-flume/)  is a tool which is used to collect, aggregate and transfer data streams  from different sources to a centralized data store such as [HDFS](https://www.educba.com/course/practical-training-on-hdfs-architecture-and-mapreduce/) (Hadoop Distributed File System). Flume is highly reliable,  configurable and manageable distributed data collection service which is designed to gather streaming data from different web servers to HDFS.  It is also an open source data collection service. 

 Apache Flume是一种工具，用于收集，汇总和从不同来源将数据流传输到集中式数据存储，例如HDFS（Hadoop分布式文件系统）。 Flume是高度可靠，可配置和可管理的分布式数据收集服务，旨在将流数据从不同的Web服务器收集到HDFS。 它也是一个开源数据收集服务。 

Apache Flume is based on streaming data flows and has a flexible architecture. Flume offers highly fault-tolerant, robust and reliable mechanism for fail-over and recovery with the capability to collect data in both batch and in stream modes. Flume’s capabilities **are leveraged by **enterprises to manage high volume streams of data to land in HDFS. For instance, data streams include application logs, sensors and machine data and social media, and so on.  These data, when landed in Hadoop, can be analyzed by running interactive queries in Apache Hive or serve as real-time data for business dashboards in Apache HBase. Some of the features include,

 Apache Flume基于流数据流并具有灵活的体系结构。 Flume提供了高度的容错，稳健的和可靠的机制来进行故障转移和恢复，并具有以批处理和流模式收集数据的能力。 企业**利用**Flume的功能来管理大量数据流，以将其放入HDFS。 例如，数据流包括应用程序日志，传感器和机器数据以及社交媒体，等等。 这些数据放入Hadoop后，可以通过在Apache Hive中运行交互式查询来进行分析，或者用作Apache HBase中业务仪表板的实时数据。 其中一些功能包括： 



- Gather data from multiple sources, and efficiently ingest into HDFS

   收集来自多个来源的数据，并有效地导入HDFS

- A variety of source and destination types are supported

     支持多种源和目标类型

- Flume can be easily customized, reliable, scalable and fault-tolerant

    Flume可以轻松定制，可靠，可扩展且具有容错能力

- Can store data in any centralized store (eg., HDFS, HBase)
     可以将数据存储在任何集中存储（例如HDFS，HBase）中 

### Head to Head Comparison Between Apache Kafka vs Flume 

 ![Apache Kafka vs Flume Infographics](D:\笔记\Spark\Apache-Kafka-vs-Flume.jpg) 

 

### Key Differences between Apache Kafka vs Flume

- Both, Apache Kafka and Flume systems provide reliable, scalable and  high-performance for handling large volumes of data with ease. However, Kafka is a more general purpose system.where multiple publishers and subscribers can share multiple topics.  Contrarily, Flume is a special purpose tool for sending data into HDFS.

   Apache Kafka和Flume系统均提供可靠，可扩展的高性能，可轻松处理大量数据。但是，Kafka是更通用的系统，其中多个发布者和订阅者可以共享多个主题。相反，Flume是用于将数据发送到HDFS的专用工具。 

- Kafka can support data streams for multiple applications, whereas Flume is specific for Hadoop and big data analysis.

    Kafka可以支持多个应用程序的数据流，而Flume专门用于Hadoop和大数据分析。 

- Kafka can process and monitor data in distributed systems whereas  Flume gathers data from distributed systems to land data on a  centralized data store.

    Kafka可以处理和监视分布式系统中的数据，而Flume则从分布式系统中收集数据以将数据存储在集中式数据存储中。 

- When configured correctly, both Apache Kafka and Flume are highly  reliable with zero data loss guarantees. Kafka replicates data in the  cluster, whereas Flume does not replicate events. Hence, when a Flume  agent crashes, access to those events in the channel is lost till the  disk is recovered, on the other hand, Kafka makes data available even in case of single point failure.

   如果配置正确，Apache Kafka和Flume都是高度可靠的，零数据丢失保证。 Kafka复制群集中的数据，而Flume不复制事件。因此，当Flume代理崩溃时，对通道中那些事件的访问将丢失，直到磁盘恢复为止。另一方面，即使单点故障，Kafka仍可提供数据。 

- Kafka supports large sets of publishers and subscribers and multiple applications. On the other hand, Flume supports a large set of source  and destination types to land data on Hadoop.

   Kafka支持大量的发布者和订阅者以及多个应用程序。另一方面，Flume支持大量的源和目标类型集，以将数据放置在Hadoop上。 

### Conclusion – Apache Kafka vs Flume

In summary, Apache Kafka and Flume offer reliable, distributed and fault-tolerant systems for aggregating and collecting large volumes of data from multiple streams and big data applications. Both Apache Kafka and Flume systems can be scaled and configured to suit different computing needs.  Kafka’s architecture provides fault-tolerance, but Flume can be tuned to ensure fail-safe operations.  Users planning to implement these systems must first understand the use case and implement appropriately to ensure high performance and realize full benefits.

 总之，Apache Kafka和Flume提供了可靠的，分布式的和容错的系统，用于聚合和收集来自多个流和大数据应用程序的大量数据。 Apache Kafka和Flume系统均可进行缩放和配置，以适应不同的计算需求。 Kafka的体系结构提供了容错能力，但是Flume可以进行调整以确保故障安全操作。 计划实施这些系统的用户必须首先了解用例并适当实施以确保高性能并实现全部收益。 
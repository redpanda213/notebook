# Spark

## 简介

> 不一定需要hadoop
>
> spark只是一个计算框架，从哪里取数据都可以

是什么?

- 专为大规模数据处理而设计的快速通用的计算引擎
- 基于内存的分布式计算框架
- 优化迭代工作负载

为什么使用？

- MapReduce 编程模型有局限性

  - 繁杂
    - 只有Map和Reduce两个操作，复杂的逻辑需要大量的样板代码

  - 处理效率低：
    - Map中间结果写磁盘，Reduce写HDFS，多个Map通过HDFS交换数据
    - 任务调度与启动开销大
  - 不适合迭代处理，交互式处理和流式处理
- Spark

> hadoop
>
> 硬盘中查询，若查询的数据存在不同的节点时，需要将数据整合起来之后再执行查询，每次落盘取数据都要消耗时间，但是更稳定，数据不易丢失
>
> spark
>
> 内存中处理，擅长处理实时流数据，将函数发送到各个节点，各个节点执行，统计完成之后，将结果返回。

怎么用？

### 历史

2013年6月发布

Spark基于Hadoop1.X架构思想， 采用自己的方式改善Hadoop1.X中的问题

Spark计算基于内存，斌给基于Scala语法开发，所以天生适合迭代式计算

## 优势

### MR的缺点

- MR基于数据集的计算，所以面向数据
- 基本运算规则从储存介质中获取（采集）数据，然后进程计算，最后将结果存储到介质中，所以主要应用于一次性计算，不适合于数据挖掘和机器学习这样的迭代计算和图形挖掘计算
- MR基于文件存储介质的操作，所有性能非常慢
- MR和hadoop紧密耦合在一起，无法动态替换，不方便开发

## 通用运行简易流程

1、Client任务提交

2、提交到Driver

- 初始化sc(sparkContext)
- 任务划分
- 任务调度

3、资源管理者

- 收到来自Driver的注册应用程序请求
- 启动Executor

4、Executor

- 反向注册，在Driver和Executor之间建立关系
- Executor启动之后，反向注册告诉Driver
- 执行任务

## Spark运行模式

### 1、standalone模式

Master+Slave 构成的Spark集群



### 2、local模式

### 3、Yarn模式(重点)

此模式下运行spark-shell前需要先启动yarn

### 4、Mesos模式(了解)

## 技术栈

- Spark Core
  - 核心组件，分布式计算引擎
- Spark SQL
  - 高性能的基于Hadoop的SQL解决方案
- Spark Streaming
  - 可以实现高吞吐量、具备容错机制的准实时流处理系统
- Spark GraphX
  - 



## 端口

```shell
spark/sbin/start-all.sh
```

8888：整个集群的状态

```shell
spark/bin/spark-shell
```

4040

7077

## 架构设计

- 运行架构
  - Driver Program
    - SparkContext：spark环境（上下文），
  - Cluster Manager
  - Worker Node
    - Executor1
      - Task1
      - Task2
      - ...
      - Cache
    - Executor2
      - Task1
      - Task2
      - ,,,
      - Cache2：任务节点之间交换统计数据
- 步骤
  - 

##   架构核心组件



## Spark Api

- SparkContext
  - 连接Driver与Spark Cluster（workers）
  - Spark的主入口
  - 每个JVM仅能有一个活跃的SparkContext
  - SparkContexxt.getOrCreate

> spark的Rdd是一个数据的存储结构也是一个算子，函数体内带着数据，
>
> sparkcontext作为对象来. 点出函数（算子）进行分析

- SparkSession
  - spark 2.0+应用程序的主入口：包含了SparkContext、SQLContext、HiveContext以及StreamingContext
  - SparkSession.getOrCreate
- PDD
  - Spark核心，主要数据抽象
- Dataset
  - spark 1.6 开始引入新的抽象，特定领域对象中的强类型集合，可以使用函数或相关操作并行地进行转换等
  - row对象储存数据（[1,'zhang',40]），类似于一种行
- DataFrame
  - 是一种特殊的Dataset
  - 类似于一种表结构userid，username，age 字段和每列的值
  - 用SparkSession作为对象，支持sql语句



## Spark - RDD

`5个属性！！！重要！！！`

### 概念

- RDD是将数据项拆分为多个分区的集合，存储在集群的工作节点上的内存中，并执行正确的操作
- 或者说，RDD适用于数据转换的接口，RDD指向了存储在HDFS、Cassandra、HBase等、或缓存、或在故障或缓存收回时重新计算其他RDD分区中的数据

- RDD是弹性分布式数据集(Resilient Distributed Datasets)
  - 分布式数据集
    - 啊是大
    - 啊是大
  - 弹性
    - 奥对输
  - 容错性
    - 啊阿斯顿

### RDD优化

### RDD持久化

### 特性

### 编程流程

### 创建

`4种`

```scala
spark/sbin/start-all.sh
```

```scala
spark/bin/spark-shell
```

sparkcontext

```scala
import org.apache.spark.{SparkContext,SparkConf}
val conf = new SparkConf().setMaster("local[2]").setAppName("hehe")
val sc = SparkContext.getOrCreate(conf)

val hello = sc.textFile("file:///opt/data/hello.txt")
hello.flatMap(_.split(" ")).map((_,1)).reduceByKey(_+_).collect

//Array[(String, Int)] = Array((scala,1), (word,1), (hello,3), (spark,1), (hbase,1))

```

sparksession

```scala
val sv = spark.read.format("csv").option("header","true").load("file:///opt/data/sparktest.csv")
//sv: org.apache.spark.sql.DataFrame = [userid: string, username: string ... 1 more field]
```

```scala
sv.show(5)
/*
+------+--------+---+
|userid|username|age|
+------+--------+---+
|     1|  KKCMZH| 76|
|     2|  LKEVNG| 73|
|     3|  TCBFFZ| 61|
|     4|  RFNLZY| 77|
|     5|  VVSBYF| 90|
+------+--------+---+

*/
```

```scala
 sv.withColumnRenamed("username","name").show(5)
/*
+------+------+---+
|userid|  name|age|
+------+------+---+
|     1|KKCMZH| 76|
|     2|LKEVNG| 73|
|     3|TCBFFZ| 61|
|     4|RFNLZY| 77|
|     5|VVSBYF| 90|
+------+------+---+

*/
```



```scala
sv.withColumn("age1",col("age")+10).show(5)
/*
+------+--------+---+-----+
|userid|username|age| age1|
+------+--------+---+-----+
|     1|  KKCMZH| 76| 86.0|
|     2|  LKEVNG| 73| 83.0|
|     3|  TCBFFZ| 61| 71.0|
|     4|  RFNLZY| 77| 87.0|
|     5|  VVSBYF| 90|100.0|
+------+--------+---+-----+
/*
```



```scala
sv.createOrReplaceTempView("userinfos")
spark.sql("select * from userinfos limit 10").show
/*
+------+--------+---+
|userid|username|age|s
+------+--------+---+
|     1|  KKCMZH| 76|
|     2|  LKEVNG| 73|
|     3|  TCBFFZ| 61|
|     4|  RFNLZY| 77|
|     5|  VVSBYF| 90|
|     6|  JBNRNI| 27|
|     7|  CUDFWN| 51|
|     8|  KIXRUB| 63|
|     9|  ADYYAJ| 41|
|    10|  CHAZHA| 44|
+------+--------+---+
*/
```



## 算子

- 转换算子

  RDD

  ```scala
  //结果：
  //org.apache.spark.rdd.RDD[String] = MapPartitionsRDD[6] at flatMap at <console>:27
  ```

- 动作算子：

  动作算子后不能在继续跟转换算子

常用的

- join
  - cross join
  - inner join
    - 左右表都有相同的k连接才会显示在结果里 rdd[(k,v)]  rdd[(k,w)]  rdd[(k,(v,w))]
  - outer join
    - left outer join:rdd[(k,(v,option))]
    - right outer join:rdd[(k,(option,w))]
    - full outer join : rdd[(option,(option,w))]
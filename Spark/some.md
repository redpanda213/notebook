# some

## DAG

有向无环图  directed acyclic graph

> 图论中，如果有向图无法从某个顶点出发经过若干条边回到该点，则这个图是一个有向无环图

## 







## shuffle

hadoop中的mapreduce  和  spark中的算子  过程相似

转换算子：少迁移，或不迁移（优化）

动作算子：shuffle过程（相当于mapreduce），一个接收者从多个节点上把数据拉到自己这里后，进行后续操作。

宽依赖：一个父RDD的分区被子RDD的多个分区使用（一对多、多对多）

- groupByKey、faltMap、distinct、join、reduceByKey、sortByKey、。

窄依赖：一个父RDD的分区被子RDD的一个分区使用

- union、filter、map、

```scala
rdd.mapPartitions

def mapPartitions[U](f: Iterator[Int] => Iterator[U],preservesPartitioning: Boolean)(implicit evidence$6: scala.reflect.ClassTag[U]): org.apache.spark.rdd.RDD[U]
--------------------------------------------------------------
rdd.repartition
   
def repartition(numPartitions: Int)(implicit ord: Ordering[Int]): org.apache.spark.rdd.RDD[Int]

```

不用hash自己定义一个函数，来分区

或者也可使用hash，但选择的分区列应选择数据更平均的列作为依据

小表通过广播变量发给每个节点，只读变量，缓存到每个节点Executor

分区多少，you'hao

------

## spark优化

优化即，充分利用好系统资源，啥系统资源呢，其中主要的是内存和CPU

能用内存cache就别spill落磁盘，CPU能并行就别串行，数据能local就别shuffle

### 开发调优

1、不重复创建RDD

- 多次读可以使用persist；但如果input太大，persist可能得不偿失。

2、尽可能复用同一个RDD

- 但是如果rdd的lineage太长，最好checkpoint下来，避免长重建

3、对多次使用的RDD进行持久化

- 持久化级别（SER，MEM，DISK，_N）

## RDD持久化

### cache()

### persist()

### checkpoint



------

Driver、worker、Exexutor、task的关系

Stage、partition、RDD、Task的关系

------

## 创建Dataset

1、createDataset(seq\rdd)

seq创建出来的列为("_1"," _2"," _3")

2、toDS

seq.toDS

rdd.toDS

## 创建DataFrame

是一个RowRdd，df.rdd 结果为org.apache.spark.sql.Row

1、toDF

2、createDataFrame(RowRdd,Schema)    Row(1,2,3)

3、StructType(Array(StructFIeld("name",StringType,False),(StructFIeld("name",StringType,False))

4、spark.read.format("json").load("path")

spark.read.json("path")

spark.read.format("csv").option("header","true").option("delimiter",",").load("path")

### DataFrame API

- select df("name")/$"name"/col("name")
- groupBy
- agg(count/sum/min/max)
- sort
- withColumn("newName",col("")) 新增一列
- withColumnRenamed("oldName","newName")
- join()
- show(10,false)

## DataFrame注册成表

- df.regirstTempTable("people")

  val df = spark.sql("")

- df.createTempView("person")

- df.createOrReplaceTempView()

使用表操作


# Hadoop-1

大数据始值无法在一定时间用常规软件工具对其内容进行抓取、管理和处理的**数据集合**。

> 理解hadoop生态圈及模块
>
> hdfs

ERP→CRM→WEB→BIG DATA(发展历史)

> **大数据4V特征**
>
> Volumn：大数据量
>
> Velocity：速度快，数据增长速度快，时效高
>
> Variaty：多样化，数据种类和来源多样化，结构化数据、半结构化数据、非结构话数据（比如图片）
>
> Value：价值密度低，需挖掘获取数据价值
>
> **固有特征**
>
> 时效性
>
> 不可变性：不改变原始数据

|              | 新的分布式计算-Hadoop  |
| ------------ | ---------------------- |
| 计算方式     | 在不同数据节点并行计算 |
| 可处理数据量 | 大数据量               |
| CPU性能限制  | 收单台设备限制小       |
| 提升计算能力 | 扩展低成本服务器集群   |

<hr>

## Hadoop是什么？

- 分布式的开源系统架构
  - 分布式文件系统HDFS--解决大数据存储
  - 分布式计算框架MapReduce--解决大数据计算
  - 分布式资源管理系统YARN

- hadoop生态圈
- 处理海量数据
- 阿斯蒂芬

## Hadoop发展及版本

- 起源于搜索引擎Apac Nutch
  - 创始人Doug Cutting
  - 2004-最初版本实施
  - 成为Apache顶级项目
- 版本
  - 社区版：Apache Hadoop
  - Cloudera发行版：CDH     hadoop-2.7.0--cdh5.14.2
  - Hortonworks发行版：HDP

## 为什么使用Hadoop?

hadoop的特点：

- 高扩展性
- 高可靠性（多副本）
- 低成本
- 无共享架构
- 灵活，可储存任意类型数据
- 开源，社区活跃

|      | RDNMS | Hadoop |
| ---- | ----- | ------ |
|      |       |        |
|      |       |        |
|      |       |        |
|      |       |        |
|      |       |        |
|      |       |        |

## Hadoop生态圈

- Hadoop核心：**HDFS**、**MapReduce**、**YARN**
- 数据查询分析：**Hive**、Impala、~~Presto~~、~~Pig~~
- 协调管理：Hcatalog、Zookeeper、Ambari
- 数据迁移：**Sqoop**、**Flume**
- 任务调度 oozie  解决任务

> log 通过Flume转移到Hadoop
>
> 关系型数据库通过Sqoop转移到Hadoop

### Zooper

- 是一个分布式应用程序协调服服

### Hadoop架构

HDFS：分布式文件系统

MapReduce：分布式计算框架

YARN：分布式资源管理系统

> 需要搞清楚1.X 和2.X 的区别

## HDFS

### HDFS特点

优点：

- 支持处理i超大文件
- 可运行到廉价的机器上

缺点：

- 不适合储存小文件

### HDFS角色

- Client：客户端（切块Block）
- NameNode（NN）：元数据节点 （放在内存中，目录树结构的一个对象）
  - 管理文件系统的NameSpace
  - 一个HDFS集群只有一个Active的NN
- DataNode（DN）：数据节点
  - 数据存储节点，保存和检索Block
  - 一个集群可以由多个数据节点
- Secondary NameNode（SNN）：从元数据节点
  - 合并NameNode的edit logs到fsimage文件中（**先保证数据不丢失，edit-logs操作日志，合并到fsimage中，操作再执行一遍来完成合并，生成一个新的fsimage，加载到内存中**）
  - 辅助NN将内存中元数据信息持久化

namenode：存储源数据信息

datanode：自己管理data，基于linux，每个datanode组成成一个大的文件系统。存放着切割成块Block的数据

### HDFS副本机制

- Block:数据块
  - HDFS最基本的存储单元
  - 默认块大小：128 M(2.X)

- 副本机制
  - 避免数据丢失
  - 副本默认数3
  - 存放机制：（3个节点，本地同Client的节点，同机架不同节点，不同机架不同节点）

Active NameNode

StandbyNameNode

### HDFS写文件

1、client---> create--->Distributed FileSystem

2、Distributed FileSystem ---> NameNode

3、client --->wrire ---> FSData OutputStream

4、FSData OutputStream --->write packer(64KB) --->DataNode\DataNode\DataNode

5、DataNode ---> ack packet --->FSData OutputStream

6、

7、

### HDFS读文件

1、client ---> open --->Distributed FileSystem

2、Distributed FileSystem ---> NameNode

3、client ---> read ---> FSData OutputStream

4、

5、

6、client ---> close ---> FSData OutputStream

### HDFS文件格式

- 支持不同格式存储所有类型的文件
  - 文本、二进制
  - 未压缩、压缩

- 为了最佳的Map- Reduce处理，文件需要可以切割
  - SequenceFile
  - Avro File
  - RCFile&ORCFile
  - Parquet File

### HDFS命令

1、上传

- hdfs dfs -put 
- hdfs dfs -copyFromLocal

2、下载

- hdfs dfs -get
- hdfs dfs -copyToLocal

3、查看文件内容

- hdfs dfs -cat
- hdfs dfs -text

4、合并

- hdfs dfs - getmerge 源文件目录  目标路径

  ```she
  #将sample_08目录下的多个文件合并成一个文件，下载到目标路径
  hdfs dfs -getmerge /apps/hive/warehouse/sample_08 /root/test.csv
  
  ```

  

5、设置hdfs中文件的副本数量

- hdfs dfs -setrep

6、修改文件夹下所有文件的权限

```shell
hdfs dfs -chmod -R 755 /wt
```

7、删除

```shell
hdfs dfs -rm /wt
```



### HDFS上传文件的两种方式

1、通过FileSystem 对象的copyFromLocal方法

2、FileInputStream\FileOutputStream  输入\输出流的方式
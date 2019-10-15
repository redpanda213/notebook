# Hadoop原理

## HDFS架构

## HDFS副本机制

### 机制

作用：避免数据丢失

副本数默认为3

存放机制：一个在本地机架节点；一个在同一机架的不同节点；不同机架的节点（不同节点以避免其中一个节点上的数据丢失，另一个还可用；不同机架以避免在同一机架上的不同节点的数据都丢失，还有一个节点可用。）



### Block:数据块

HDFS最基本的存储单元

默认块大小：128M（2.X版本）

最小块大小：64M

块大小设置

在hdfs-site.xml中，增加全局参数

```xml
<property>
	<name>dfs.block.com</name>
	<value>5012000</value>
</property>
```

## HDFS读文件

```she

```



## HDFS写文件

client先通知Distributed(FileSystem) ,在通知NameNode只创建一个地址

随后client通知FSData(OutputStream),FSData通知DataNode1->DataNode2->DataNode3

3个节点都备份完之后，通知client，client再通知NameNode创建一个完整的目录信息。

```she

```




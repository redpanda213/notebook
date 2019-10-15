---
typora-copy-images-to: image
---

# Elasticsearch

## 一、ES简介

### 基于Apache Lucene`开源分布式搜索引擎`

Lucene是迄今为止最先进、性能最好的、功能最全的搜索引擎库。但是，Lucene只是一个库，需要使用Java开发且非常复杂。

Elasticsearch使用`RESTful API`简化了Lucene，全文搜索更简单。



大幅降低了PB级海量数据存储、检索、分析门槛

> AppServer > Logstash(日志收集) > Elasticsearch(存储+检索+分析) > Kibana Server(可视化) >Brower(Computer，Laptop、Ipad)

### 特点：

- 分布式实时文件存储、检索、分析
- **RESTful风格接口**
- 零配置、集群自动发现
- 可扩展性大
- 

## 二、安装

### 前提先安装elasticsearch-head



（结构化查询语言）



## 三、ES建第一个表

### 1.ES数据模型

index：索引，由多个Document组成

Type：索引类型，6.x中仅支持一个，以后将逐渐被移除

Document：文档，由多个Field组成

Field：字段，包括字段名与字段值

### 2.索引

#### 2.1 创建索引

索引命名规范：

- 只支持小写字母
- 不包括“ \/*?"<>|`(空格),#" ”

#### 2.2 管理

##### 带参数创建索引

```
例：
PUT demo.1234
{
	"settings":{
		"index":{
			"number_of_shards":2        //主分片数量，默认5
			"number_of_replicas":2		//副本数量，默认1
		}
	}
}
```

> 分区是为了
>
> 副本：第一个在本计算机，第二个在这台计算机同机架的另一台计算机上(同机架用同一电源，同一线路)，第三个在不同机架的计算机上

##### 索引的映射

```
例：
PUT demo.12345
{
	"settings":{
		"number_of_shards":1
	}
	"mappings":{
	"_doc":{
	"properties":{}
	}
	}
}
```

##### 查看索引映射

```
GET demo.12345/_mapping
```

##### 删除索引

````DELETE demo.12345
DELETE demo.12345
````

### 3.ES分布式架构

一个集群由多个节点组成，每个节点指定相同的cluster.name

主节点负责创建索引、删除索引、分配分片、追踪集群中的节点状态等

一个节点是一个ES实例，默认每个节点都可以为候选主节点与数据节点，即：node.master:true node.data:true

通过路由计算：hash(routing) % number_of_primary_shards

根据算出的值（假设为1）将数据存到对应的计算机上（1号），同时1号计算机在其他计算机上建立两个副节点，同时副节点的信息告诉master，当1号计算机无法正常运行时，master可以根据存储的副节点信息直接查找的副节点。

安装es-head-master

cd /opt

yum install unzip

unzip elasticsearch-head-master.zip			

mv elasticsearch-head-master inst/eshead

cd /esheadmv 

npm config set registry http://registry.npm.taobao.org

npm run start

````elk
{
"settings":{
"number_of_shards":5,
"number_of_replicas":2
},
"mappings":{
  "userinfos":{
    "properties":{
      "username":{
      	"type":"text"
     },
     "birthday":{
     	"type":"date"
     }
   }
 }
}
}
````

````
{
"username":"zs",
"birthday":"1999-2-3"     //默认有_id的字段，主键自增，从1开始
}
````

`_index`:mydemo  索引

`_type`:userinfos  类型

`_id`: 1  默认的主键

`_score`： 1   匹配度

````
npm cache clean --force   //清理缓存
rm -rf node_
````

## 四、分片

### 分片检索

查询阶段：查询被向索引中的每个分片（原本或副本）广播，返回带检索数据的定位

取回阶段：

### 倒排检索

Elasticsearch的停用词：

1、这些词出现频率高，一般为虚词介词冠词，对文本信息没有影响

2、英文  a  an   the  of and so on 

3、中文  的、了、着、是等

4、

## 五、ES搜索方式

### URI　Search

简易查询，      

### Query DSL（Domain Specific Language）

常用，基于Json

## 六、分页

### 浅分页

### 深分页

保存结果快照，需要分页时，直接从结果中获取
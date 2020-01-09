![image-20191231084545502](D:\笔记\Redis\插图\image-20191231084545502.png)

> 上图是Google公司的云平台技术，其中Spark和redis是用的现有的技术，而其他大部分都是自己研发的产品。

## 

## Introduction

`简介`

redis是什么？

- redis：远程字典型服务，开源，网络，单线程，基于内存，先进的key-value存储，optional durasbility可选的持久性

谁在使用redis？

![image-20191231085342991](D:\笔记\Redis\插图\image-20191231085342991.png)

> instance 实例

## Key Features

`关键的功能`

- 所有的数据都在内存中(almost)
- 所有的数据最后都会被持久后，而不是立刻
- 轻松地处理巨大的工作负荷，拥有高吞吐量，可扩展性。
- 适合高工作负荷的写入
- 支持事务
- 广泛支持所有主要语言

## Install Redis

[安装 Redis](D:\笔记\Redis\Redis.md)



## Redis Databases

`数据库架构`

| RDB       |      |      |      |      |
| --------- | ---- | ---- | ---- | ---- |
| Databases |      |      |      |      |
| tables    |      |      |      |      |
| columns   |      |      |      |      |

- redis的数据库特点
  - a **key-value** data-store
  - not an equivalent of database named in DBMS.
  - a way to create isolation and name-spacing for the keys, and **only provides index based naming, not custom names like retail_db.**
- By default, redis has 0-15 indexes for databases, this can be changed in redis.conf:

> redis.conf
>
> 在配置中可以看到设置了几个可使用的数据库
>
> #Set the number of databases. The default database is DB 0, you can select
>
> #a different one on a per-connection basis using SELECT <dbid> where
>
> #dbid is a number between 0 and 'databases'-1
>
> databases 16

- Use SELECT command to select the database on which to work.

  ```redis
  > select 1
  > set 'customer_id' 100
  > get customer_id
  # "100"
  ```

## Redis Data Types

`redis数据类型`

- binary-safe Strings
- Hashes
- Lists
- Sets
- Sorted  Sets
- Geospatial Index
- HyperLogLogs

## Redis Data Model

`redis数据模板`

-  Redis modules allow anyone to add custom types & methods directly into the Redis engine. 
- Redis Modules API reference - https://redis.io/topics/modules-api-ref

## Redis Command

`redis的命令`

### SET & GET

- set the key to hold a string
- by default, if the key already exists, its value is over

### SCAN

### LIST

- LPUSH
- RPUSH
- LSET
- RPUSH
- LPOP
- RPOP
- LINDEX
- LINSERT
- LLEN
- LREM
- LTRIM
- etc.......

### HASH

### Set

- sadd
- sinter
- sunion
- smembers
- sdiff
- smove

```redis
> sadd  key1 'a'
(integer) 1
> sadd  key1 'b'
(integer) 1
> sadd  key1 'c'
(integer) 1
]> scard key1
(integer) 3
> sadd key2 'c'
(integer) 1
> sadd key2 'd'
(integer) 1
> sadd key2 'e'
(integer) 1
> sinter key1 key2
1) "c"
> sunion key1 key2
1) "b"
2) "c"
3) "e"
4) "a"
5) "d"
> sdiff key1 key2
1) "b"
2) "a"
> sdiff key2 key1
1) "d"
2) "e"
> smembers key1
1) "c"
2) "b"
3) "a"
> smembers key2
1) "c"
2) "e"
3) "d"

```

### Indexing in Redis

`redis中的下标`

- 



![image-20191231114602382](C:\Users\王先生\AppData\Roaming\Typora\typora-user-images\image-20191231114602382.png)

### 
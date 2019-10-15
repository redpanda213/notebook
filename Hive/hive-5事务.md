## Hive事务

### 特点及局限

- V0.14版本开始i支持行级事务
  - 支持insert、delete、update 、v2.2.0开始支持merge
  - 文件格式只支持ORC

- 

### 开启和设置

- 

```
--通过命令行方式开启事务
set hive.support.concurrent = true;
set
set
set
set
set
```

> 桶不支持update delete



```
create 
```

## Hive PLSQL

- hive存储过程（v2.0之后）
  - 支持SparkSQL和Impala
  - 兼容Oracle、DB2、MySQL、TSQL标准
  - 使编写UDF不需要java技能



## Hive优化设计

- 考虑数据本地化
- 使用分区表、桶表
- 使用索引
- 使用适当的文件格式、如ORC、avro、parquet
- 使用适当的压缩格式，如snappy
- 使用Tez引擎代替MapReduce
- 使用Hive LLAP(在内存中读取缓存)
- 避免小文件

## Job优化

#### 本地模式运行

- Hive支持将做业务自动转换为本地模式运行、
  - 当要处理的数据很小时，完全分布式模式的启动时间比作业处理时间要长
- job必须满足以下条件才能在本地模式下运行
  - job总输入大小小于hive.exec.mode.loacl.auto.inputbytes=



### JVM重用

- 通过JVM重用减少JVM启动的消耗

```
mapred.job
```

### 并行执行

- 提高集群利用率
  - Hvie拆线呢通常被转换成许多按默认顺序执行的阶段
  - 这些阶段并不总是相互依赖的
  - 他们可以并行运行以节省总体作业运行时间

## 查询优化

- 自动启动Map端join

- 防止数据倾斜

  ```
  set hive.optimize.skewjoin=true
  ```

- 启动CBO

  ```
  set hive.cbo.enable=true;
  ```

- 启动Vectorization(矢量化)

  ```
  set hive.vectorized.execution.enable=true
  set hive
  ```

- 使用CTE、临时表、窗口函数

## 压缩算法

- 减少传输数据量，会极大提升MapReduce性能
  - 采用数据压缩时减少数据量极好的方式
- 常用的压缩


## **Hive调优**

### Fetch抓取

设置属性为`more` 开启fetch，不使用mapreduce来进行简单的查询（全局、字段、limit等都可）。

```
hive>set hive.fetch.task.conversion=none
hive>set hive.fetch.task.conversion=more
hive>set hive.fetch.task.conversion=nin
```



### 本地模式

### 表的调优

### 数据倾斜

### 并行执行

### 严格执行

### JVM重用

### 推测执行

### 压缩

### 执行计划
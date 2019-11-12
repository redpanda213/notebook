# 了解日志数据格式

## Users

对于此表,字段为

```scala
val dfUsers =spark.read.format("csv").option("header","true").load("file:///opt/data/events/users.csv")
dfUsers.printSchema

/*
root
 |-- user_id: string (nullable = true)    user_id唯一
 |-- locale: string (nullable = true)
 |-- birthyear: string (nullable = true)
 |-- gender: string (nullable = true)
 |-- joinedAt: string (nullable = true)
 |-- location: string (nullable = true)
 |-- timezone: string (nullable = true)
 */
```

查看是否有重复

```scala

```















> apache spark版本的 使用join  需要打开开关
>
> spark.sql.crossJoin.enable=true
>
> cdg 一般不需要，默认开
>
> 

## events.attendees

```scala

```

![image-20191112105401605](D:\笔记\北美大数据项目\photo\answer.png)

![image-20191112111311714](D:\笔记\北美大数据项目\photo\image-20191112111311714.png)

![image-20191112110047903](D:\笔记\北美大数据项目\photo\image-20191112110047903.png)

![image-20191112115151277](D:\笔记\北美大数据项目\photo\image-20191112115151277.png)
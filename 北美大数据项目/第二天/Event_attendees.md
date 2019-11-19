# Event_attendees

## 导入表

```scala
val dfEventAttendee = spark.read.format("csv").option("header","true").load("file:///opt/data/events/event_attendees.csv")
```

```scala
dfEventAttendee.printSchema
/*
root
 |-- event: string (nullable = true)
 |-- yes: string (nullable = true)
 |-- maybe: string (nullable = true)
 |-- invited: string (nullable = true)
 |-- no: string (nullable = true)
*/
```

## 统计有多少条记录

```scala
df.distinct.count
// Long = 24144  
```

## 将event_attendees转换成

- event_id,user_id,attendee_type 
- attendee_type 的value 是对应的 : yes,maybe,no,invited

### 1、使用DataFrame

```scala
val dfYes = dfEventAttendee.select($"event".as("event_id"),$"yes").withColumn("user_id",explode(split($"yes"," "))).filter($"user_id".isNotNull).withColumn("attend_type",lit("yes")).drop("yes")

val dfMaybe = dfEventAttendee.select($"event".as("event_id"),$"maybe").withColumn("user_id",explode(split($"maybe"," "))).filter($"user_id".isNotNull).withColumn("attend_type",lit("maybe")).drop("	maybe")

val dfNo = dfEventAttendee.select($"event".as("event_id"),$"no").withColumn("user_id",explode(split($"no"," "))).filter($"user_id".isNotNull).withColumn("attend_type",lit("no")).drop("no")

val dfInvited = dfEventAttendee.select($"event".as("event_id"),$"invited").withColumn("user_id",explode(split($"invited"," "))).filter($"user_id".isNotNull).withColumn("attend_type",lit("invited")).drop("invited")

val un  = dfYes.union(dfNo).union(dfMaybe).union(dfInvited)
un.count
//Long = 11245010  
dfYes.distinct.count
//Long = 831136  

```

### 2、使用RDD

```scala
val rdd = sc.textFile("file:///opt/data/event/event_attendees.csv")
val header = rdd.first
val rdd2 = rdd.filter(row=>row!=header)

val rddYes = rdd2.flatMap(x=>x(1).split(" ").map(y=>(x(0),y)))

rddYes.union(rddMaybe).union(rddInvited).union(rddNo).count
// Long = 11258642  

rddYes.distinct.union(rddMaybe.distinct).union(rddNo.distinct).union(rddInvited.distinct).filter(_._2!="").count
//
```

### 3、Hive SQL

```sql

```

## 统计没有出现在events.csv中的events

```scala
val dfEventList = dfEventAttendees.select("event").distinct.alias("el").join("dfEvent".select("event_id").alias("er"),$"el.event"==$"er.event_id","left_outer").filter($"er".isNull)
```

## 统计举办过events的users有多少

```scala
val UserList = 
```




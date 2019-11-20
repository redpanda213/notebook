## User-Friends 

```scala
val dfUserF = spark.read.format("csv").option("header","true").load("file:///opt/data/events/user_friends.csv")

//首先查看一下表结构
dfUserF.printSchema
/*
root
 |-- user: string (nullable = true)
 |-- friends: string (nullable = true)
*/
/*
user|friends
75496138|79854615 96635849 46851973 56289471 49785632 15495632
.........
*/
```

查看一下一共多少条数据

```scala
dfUserF.distinct.count
// Long = 38202                                                              
```

列转行，将friend中的id  变成一个user_id 对应一个 friend_id   并将原列friends移除

```scala
val df = dfUserF.withColumnRenamed("user","user_id").withColumn("friend_id",explode(split($"friends"," "))).drop("friends")
```

还是上面的要求，如何用SQL完成它呢？

```scala
//首先，我们依然要使用刚刚创建的DataFrame   dfUserF  因为只有DF  才能注册临时表
dfUserF.registerTempTable("friends")
//然后我们执行spark.sql
val df2 = spark.sql("select user as user_id,friend_id from friends lateral view explode(split(friends,' ')) f as friend_id")

df2.show(10)
/*
+----------+----------+
|   user_id| friend_id|
+----------+----------+
|3197468391|1346449342|
|3197468391|3873244116|
|3197468391|4226080662|
|3197468391|1222907620|
|3197468391| 547730952|
|3197468391|1052032722|
|3197468391|2138119761|
|3197468391| 417295859|
|3197468391|1872292079|
|3197468391| 984265443|
+----------+----------+

*/

```

统计数据中的有效值，即**friend_id** 不为空，且无重复 

```scala
val df3 = df.filter($"friend_id".isNotNull).distinct.count
/*
Long = 30386387     
*/
val df4 = df.filter($"friend_id".isNotNull).count
// Long = 30386403 
```

统计谁的朋友最多

```scala
//operation
val mostFriend = df3.groupBy("user_id").agg(count("friend_id").as("count")).orderBy($"count".desc)
df3.show(1)

//sql的写法
val mostFriend = spark.sql("select user_id,count(user_id) count from friends group by user_id order by count desc")

df4.show(1)
/*
+----------+----+                                                               
|   user_id| num|
+----------+----+
|1447096273|4964|
+----------+----+
*/

```


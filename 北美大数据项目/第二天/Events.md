## Events

```scala
 val dfEvents = spark.read.format("csv").option("header","true").load("file:///opt/data/events/events.csv")
 dfEvents.printSchema
/*
root
 |-- event_id: string (nullable = true)
 |-- user_id: string (nullable = true)
 |-- start_time: string (nullable = true)
 |-- city: string (nullable = true)
 |-- state: string (nullable = true)
 |-- zip: string (nullable = true)
 |-- country: string (nullable = true)
 |-- lat: string (nullable = true)
 |-- lng: string (nullable = true)
 |-- c_1: string (nullable = true)
 |-- c_2: string (nullable = true)
 |-- c_3: string (nullable = true)
 |-- c_4: string (nullable = true)
 |-- c_5: string (nullable = true)
 |-- c_6: string (nullable = true)
 |-- c_7: string (nullable = true)
 |-- c_8: string (nullable = true)
 |-- c_9: string (nullable = true)
 |-- c_10: string (nullable = true)
 |-- c_11: string (nullable = true)
..............
*/
```

查看有多少记录

```scala
dfEvents.distinct.count
//res41: Long = 3137972  
```

有没有events没有举办者？

```scala
dfEvents.filter($"user_id".isNull).count
Long = 0  
```

举办活动做多的user

```scala
val cntEvents=
dfEvents.grouBy($"user_id").agg(count($"event_id").as("cnt_events")).orderBy($"cnt_events".desc)
cntEvents.show(10)
/*
+----------+----------+                                                         
|   user_id|cnt_events|
+----------+----------+
| 415464198|     93716|
|4236892345|     19790|
|3982320065|      3920|
|3971398353|      1097|
|3337130725|       730|
|1309490940|       535|
|3790901372|       411|
| 840284976|       304|
| 666518467|       277|
|2583345703|       209|
+----------+----------+

*/
```

event举办者不在 user list中

```scala
val df2 = dfEvents.alias("a").join(dfUsers.alias("b"),$"a.user_id"===$"b.user_id","left_outer").filter($"b.user_id".isNull).select("a.user_id").distinct
df2.count
//Long = 1918266 
```


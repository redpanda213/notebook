# spark读取外部数据源

- spark默认保存文件格式为parquet,是一种流行的列式存储格式，以二进制存储，文件中包含数据与元数据
- 如要根据数据源通过.format(" ") 手动设置格式
- read和write都可设置格式

## JSON文件

Spark SQL 能够自动推测JSON数据集的结构，并将它加载为一个Dataset[Row]，可以通过SparkSession.read.json()去加载一个JSON文件

> 注意，这个json文件不是传统的json文件，**每一行都得是一个JSON串**

```scala
spark.read.load("file:///opt/bigdata/spark243/examples/src/main/resources/users.parquet").show

/*
+------+--------------+----------------+                                        
|  name|favorite_color|favorite_numbers|
+------+--------------+----------------+
|Alyssa|          null|  [3, 9, 15, 20]|
|   Ben|           red|              []|
+------+--------------+----------------+

*/
```

```scala
val df = spark.read.json("file:///opt/data/people.json")
//df: org.apache.spark.sql.DataFrame = [age: bigint, name: string]

df.write.format("json").save("file:///opt/data/output")
//在设置的保存路径下出现此文件part-00000-3be5d01c-d5c0-4354-af96-fd97eed2b278-c000.json
//当output文件夹已存在是再运行上条命令会报错，可以采用以下这条命令来操作。
/*错误：
org.apache.spark.sql.AnalysisException: path file:/opt/data/output already exists.;
*/

//追加
df.write.format("json").mode("append").save("file:///opt/data/output")
//part-00000-ab43a014-98be-4b0b-a2ac-27415829b51a-c000.json  与之前文件名不同，这是新追加的文件

//覆盖
df.write.format("json").mode("overwrite").save("file:///opt/data/output")
//output目录下文件将被覆盖，只有新生出的文件
```

## Parquet文件

## JDBC

- 有两种方式将数据从mysql加载到spark

一、

1、在spark/jars目录下放入mysql驱动包`mysql-connector-java-5.1.47.jar`

2、

```scala
val jdbcDF = spark.read.format("jdbc").option("url","jdbc:mysql://192.168.56.110:3306/scala").option("dbtable","foods").option("user","root").option("password","ok").load()
//jdbcDF: org.apache.spark.sql.DataFrame = [foodid: int, foodname: string ... 1 more field]

jdbcDF.show
/*
+------+------------+-----+                                                     
|foodid|    foodname|price|
+------+------------+-----+
|     1|sudo cookies| 10.5|
|     2|pork cookies| 15.0|
|     3| pork slices| 30.5|
+------+------------+-----+

*/
```

二、

```scala
val connectionProperties = new java.util.Properties()//新建一个properties对象
connectionProperties.put("user","root")
connectionProperties.put("password","ok")
connectionProperties.setProperty("driver","com.mysql.jdbc.Driver")
val url = "jdbc:mysql://192.168.56.110:3306/scala"
val tablename = "foods"

val jdbcDF = spark.read.jdbc(url,tablename,connectionProperties)
```



- 从spark向mysql写入数据,同样的有两种

  ```scala
  jdbcDF.write.format("jdbc").option("url","jdbc:mysql://192.168.56.110:3306/scala").option("user","root").option("password","ok").option("dbtable","foods").save()
  ```

  ```scala
  val connectionProperties = new java.util.Properties()
  connectionProperties.setProperty("user","root")
  connectionProperties.setProperty("password","ok")
  connectionProperties.setProperty("driver","com.mysql.jdbc.Driver")
  val url = "jdbc:mysql://192.168.56.110:3306/scala"
  val tablename = "foods"
  
  val jdbcDF = spark.write.jdbc(url,tablename,connectionProperties)
  ```

  

  

## Hive

![1570675370329](D:\笔记\Spark\spark_hive.png)

spark 有一个内嵌Hive应用

```scala
spark.sql("show tables").show
/*
+--------+---------+-----------+
|database|tableName|isTemporary|
+--------+---------+-----------+
+--------+---------+-----------+

*/
spark.sql("create table xxx(id int)")
//19/10/09 10:50:57 WARN HiveMetaStore: Location: file:/opt/bigdata/spark243/bin/spark-warehouse/xxx specified for non-external table:xxx  
//res7: org.apache.spark.sql.DataFrame = []

spark.sql("show tables").show
/*
+--------+---------+-----------+
|database|tableName|isTemporary|
+--------+---------+-----------+
| default|      xxx|      false|
+--------+---------+-----------+
*/

spark.sql("load data local inpath '/opt/data/input/id.txt' into table xxx")
spark.sql("select * from xxx").show
/*
+---+                                                                           
| id|
+---+
|  1|
|  2|
|  3|
+---+
*/

```


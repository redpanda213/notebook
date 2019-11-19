```shell
docker cp [文件名.后缀] sandbox-hdp:/root

docker cp event.attendees.csv sandbox-hdp:/root
..........
```

```shell
[root@sandbox-hdp ~]# hdfs dfs -mkdir -p /events/data
[root@sandbox-hdp ~]# hdfs dfs -put -f *.csv /events/data
hdfs dfs -ls /events/data
```

进入zeppelin 127.0.0.1:9995 

```shell
%sh
#查看一个文件内容
hdfs dfs -cat /events/data/users.csv | head -3
```

**如何去除csv的字段信息，也就是第一行**

1、RDD

1.1  **first**

```scala
val rdd = spark.sparkContext.textFile("file:///opt/data/events/users.csv")
val header = rdd.first
val rdd2 = rdd.filter(row => row!=header)
rdd2.take(5)
//此处  val rdd = rdd.filter(row => row!=header)
//会报错 error: recursive method rdd needs type
/*
listMyAction.foldLeft(oirgRDD){(rdd,f)=>
    val tempRDD = f(rdd)
    rdd.filter(row=>row!=header)
}
*/
```

1.2  **zipWithindex**

```scala
val rdd = spark.sparkContext.textFile("file:///opt/data/events/users.csv")
val rdd2 = rdd.zipWithIndex().filter(_._2>=1).keys
rdd2.take(5)
```



2、DataFrame

```scala
val dfUsers = spark.read.format("csv").option("header","true").load("file:///opt/data/events/users.csv")
dfUsers.show(5)
```

```scala
val lines = spark.readStream.format("socket").option("host","localhost").option("port","9999").load()

lines.as[String]
val words = lines.as[String].flatMap(_.split(" "))

val wordCounts = words.groupBy("value").count()

val query = wordCounts.wroteStream.outputMode("complete").format("console").start()

query.awaitTermination()
```

<img src="C:\Users\王先生\AppData\Roaming\Typora\typora-user-images\image-20191206085221498.png" alt="image-20191206085221498" style="zoom: 200%;" />

![image-20191206090107200](C:\Users\王先生\AppData\Roaming\Typora\typora-user-images\image-20191206090107200.png)




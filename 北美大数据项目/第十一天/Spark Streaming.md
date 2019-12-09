```
nc -lk 9999
```



```scala
sc.stop

import org.apache.spark._
import org.apache.spark.streaming._

val conf = new SparkConf().setMaster("local[2]").setAppName("NetworkWordCount")\
val ssc = new StreamingContext(conf.Seconds(5))
val lines = ssc.socketTextStream("localhost",9999)
lines
val words = lines.flatMap(_.split(" "))
val pairs = words.map(word => (word,1))
val wordCounts = pairs.reduceByKey(_+_)
wordCounts.print()

ssc.start
```


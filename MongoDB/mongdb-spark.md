![image-

20191126090607101](C:\Users\王先生\AppData\Roaming\Typora\typora-user-images\image-20191126090607101.png)

```scala
import org.apache.spark.sql._
import com.mongodb.spark._
import org.apache.spark.SparkConf


val spark = SparkSession.builder.config("spark.mongodb.input.uri","mongodb://192.168.56.110:27017/myevents").config("spark.mongodb.input.collection","users").config("mongodb://192.168.56.110:27017/myevents").config("spark.mongodb.output.collection","tmp_users").getOrCreate()

val spark = SparkSession.builder.config("spark.mongodb.input.uri","mongodb://192.168.56.110:27017/myevents").config("spark.mongodb.input.collection","users").config("spark.mongodb.output.uri","mongodb://192.168.56.110:27017/myevents").config("spark.mongodb.output.collection","tmp_users").getOrCreate()

val spark = SparkSession.builder.config("spark.mongodb.input.uri","mongodb://192.168.56.110:27017/myevents").config("spark.mongodb.input.collection","users").config("spark.mongodb.output.uri","mongodb://192.168.56.110:27017/myevents").config("spark.mongodb.output.collection","tmp_users").getOrCreate()



```


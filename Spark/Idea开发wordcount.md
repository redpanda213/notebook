# Spark Idea开发

1、创建一个maven项目

2、导入依赖包,version根据自己的scala版本而定

```xml
<dependencies>
    <dependency>
        <groupId>org.apache.spark</groupId>
        <artifactId>spark-core_2.11</artifactId>
        <version>2.4.3</version>
    </dependency>
</dependencies>

    <build>
        <finalName>WordCount</finalName>
        <plugins>
            <plugin>
                <groupId>net.alchim31.maven</groupId>
                <artifactId>scala-maven-plugin</artifactId>
                <version>3.2.2</version>
                <executions>
                    <execution>
                        <goals>
                            <goal>compile</goal>
                            <goal>testCompile</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
```

3、

```scala
import org.apache.spark.rdd.RDD
import org.apache.spark.{SparkConf, SparkContext}

object WordCount {
    def main(args:Array[String]):Unit= {

        //使用idea完成spark wordcount
        //local模式
        //1、创建一个SparkConf对象，设定spark计算框架的运行(部署)环境
        //app   id
        val set = Array(("spark.master","local[2]"),("spark.app.name","wordCount"))
        val conf = new SparkConf().setAll(set)

        //2、创建spark上下文对象"
        val sc = new SparkContext(conf)

        //3、读取文件，将文件内容一行一行的读取出来
        val lines:RDD[String] = sc.textFile("in")

        //将一行一行的数据分解成一个一个的单词
        val words:RDD[String] = lines.flatMap(x=>x.split(" "))

        //为了统计单词，可以将单词数据进行结构的转化
        val wordToOne:RDD[(String,Int)] = words.map((_,1))

        //对转换结构后的数据进行分组聚合
        val wordToSum:RDD[(String,Int)] = wordToOne.reduceByKey(_+_)

        //将结果打印至控制台
        val result:Array[(String,Int)] = wordToSum.collect()

        //println(result)
        //结果：[Lscala.Tuple2;@7f0d8eff

        result.foreach(println(_))

    }
}

```


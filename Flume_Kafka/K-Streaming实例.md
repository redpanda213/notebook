# 	Kafka  Streaming应用实例

## java开发

### 1、导入依赖包以及JDK 1.8解释器

```xml
<dependency>        
    <groupId>org.apache.kafka</groupId>
    <artifactId>kafka-streams</artifactId>
    <version>1.1.0</version>
</dependency>
 <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.6.1</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                </configuration>
            </plugin>
        </plugins>
    </build>
----------------------------------------------------------------
原文链接：https://blog.csdn.net/dyq51/article/details/81346539
```



`kafka-streaming 1.0.0`

### 2、编写代码

```java
public class Mydemo{
    public static void main(String[] args){
        Properties props = new Properties();
      	props.put(StreamsConfig.APPLICATION_ID_CONFIG,"user_friends");
        props.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG,"192.168.56.110:9092");
     	 props.put(StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG,Serdes.String().getClass());
        props.put(StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG,Serdes.String(),getClass());
        StreamsBuilder builder = new Streamsbuilder();
        //相当于DataFrame
        KStream<Object,Object> user_friends = builder.stream("user_friends");
        
	ForeachAction<Object,String> faction = new ForeachAction<Object,String>(){
        public void apply(Object o,String s){
            System.out.println("key!"+o+"===========>value:"+s);
            
        }
    };
    user_friends.foreach(faction);
    KakkaStreams ks = new_kafkaStreams(build.build(),props);
    ks.strat();
        
        
           
    }
}
```

```shell
./spark-submit /opt/mkm.jar --classcom.kgc.kafka_steaming.kafka_streaming
```



> 遇到一个坑！！！
>
> (Exception: org.apache.kafka.streams.errors.StreamsException: Kafka Streams requires broker version 0.10.1.x or higher.)
>
> #IntelliJ IDEA导出 jar文件 运行不了，no main manifest attribute，找不到main函数#
>
> https://blog.csdn.net/zhan107876/article/details/97883972

```java
<dependency>        
    <groupId>org.apache.kafka</groupId>
    <artifactId>kafka-streams</artifactId>
    <version>2.2.0</version>
</dependency>
```

![1571731408048](D:\笔记\python\kafkaStreaming.png)

```

```

将Array((1,2 3 4 5 6 7 8 9))



```scala
//spark算子完成同样的操作
val rd = spark.read.format("csv").option("header","true").load("file:///opt/data/user_friends_new.csv")


```

```scala

val rdd = sc.textFile("file:///opt/data/fans.csv")
val rdd1 = rdd.map(x=>x.split(",")).map{case Array(x,y)=>(x,y)}

val rdd2 = rdd.map(x=>x.split(",")).map{case Array(x,y)=>(x,y)}.map(x=>(x._1,x._2.split(" ")))

val rdd3 = rdd2.map(x=>x._2.map(y=>(x._1,y)))

val rdd4 = rdd2.flatMap(x=>x._2.map(y=>(x._1,y)))
```



## 
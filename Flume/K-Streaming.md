# Kafka  Streaming

重置 

```shell
kafka/bin/kafka-streams-application-reset.sh --zookeeper 127.0.0.1:2181 --application-id user_friends --input-topics user_friends
```

java开发

1、导入以来包

```xml
<dependency>
	
</dependency>
```



`kafka-streaming 1.0.0`

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


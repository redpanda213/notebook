# K-hbase

kafka导入到hbase中

学到一种新设计模式

> 一开始先在main方法编写
>
> 之后可以尝试应用设计模式来编写
>
> 但是那些代码可以提取出来，是有讲究的，要了解这里的讲究。
>
> 分割代码



>  1、先通过flume  将数据（来自于日志logs等）传到kafka消息队列中
>
> 2、flume只是一种工具



java读入数据，通常原数据量较大时，导入HDFS会出错。（出什么错？）

java不会对这个数据量有任何限制

Kafka在导出数据的时候，会有一定的



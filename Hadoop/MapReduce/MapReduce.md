# MapReduce

## 什么是MapReduce

分布式计算框架



## 设计思想

- 分而治之：简化并行计算的编程模型
- 构建抽象模型：Map Reduce
- 隐藏系统层细节：

## 特点

- ### 优点：

  - 易于编程：
  - 可扩展性：
  - 高容错性：
  - 高吞吐量：节点多

- ### 不适合领域

  - 难以实时计算：硬盘读取，速度不够快
  - 不适合流式运算：数据类似水流，不断的产生需要不断的处理

## 实现WordCount

## 执行过程

分为两部分：Map Phase和Reduce Phase

>  怎么分割？怎么聚合?其他不用管

1、split

2、Mapper

3、Partitioner

4、Combiner(只在自己的分区聚合)

5、Shuffle and sort（GroupComparable）

6、Reducer(把所有分区聚合到一起)



## Key&Value类型

- 必须可序列化（serializable）
  - 作用网络传输以及持久化存储
  - NullWritable 当结果不关注key的内容是，只关乎value则可以设置为NullWriable、IntWritable、LongWritable、BooleanWritable、FloatWritable、Text、DoubleWritable等

- 都继承了Writable接口
  - 并实现write()和readFields方法
- Keys必须实现WritableComparable接口
  - Reduce阶段需要sort
  - keys需要可比较

## Mapper类

- 主要方法
  - setup
  - map
  - cleanup
  - run

```java
public class WCMapper extends Mapper<LongWritable,Text,Text,IntWritable>{
    private final static IntWritable one = new IntWritable(1);
    private Text word  = new Text();
    public void map(LongWritable key,Text value,Context context){
		String[] st = value.toString().split(",");
    }
}
```

## Reducer类

- 主要方法
  - setup
  - reduce
  - cleanup
  - run（可通过重写该方法来控制reduce任务的工作方式）

```java
private IntWritable result = new IntWritable();
public void reduce(Text key,Iterable<IntWritable,>)
```

## 编写M/R Job

```java
Job job = J。getInstance(getConf(),"WordCountMR");
job.setJarByClass(getClass());
FileInputFormat.addInputPath(job,new Path(args[0]));
job.setInputFormatClass(TextInputFormat.class);

FileOutputFormat,setOutputPath(job,new Path(args[1]));
job.setOutputFormatClass(TextOutputFormat.class);

job.setMapperClass();
job.setMapOnputKeyClass();
job.setMapOnputValueClass();

job.setReducerClass();
job.setOutputkeyClass();
job.setOutputvalueClass();
```

## InputFormat接口

FileInputFormat<k,v>

​	

Composable

DBInputFormat<T>





## Combiner类

- Combiner相当于本地化的Reduce操作
  - 在shuffle之前进行本地聚合
  - 用于性能优化，可选项
  - 输入和输出类型一致
- Reducer可以被用作Combiner的条件
  - 符合交换律和结合律
- 实现Combiner
  - job.setCombinerClass(WCReducer.class)



## Partitioner类

- 用于在Map端对key进行分区
  - 默认使用的是HashPartitioner
    - 获取key的哈希值
    - 使用key的哈希值对Reduce任务数求模
  - 决定每条记录应该送到哪个Reducer处理
- 自定义Paritoner
  - 继承抽象类Partitioner，重写getPartition方法
  - job.setPartitionClass(MyPartitioner.class)



## InputSplit

 

## Hadoop V1 MR 引擎

- Job Tracker
  - 运行在Namenode
  - 接受客户端Job请求
  - 提交给Task Tracer
- Task Tracker
  - 从job Tracker接受任务请求
  - 执行map、reduce等操作
  - 返回心跳给Job Tracker

## V2 YARN 

负责分配任务 ！
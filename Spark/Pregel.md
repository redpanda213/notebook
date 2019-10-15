# Pregel

## 概述

- 是Google提出的用于大规模分布式图计算框架
  - 图遍历
- pregel的计算由一系列迭代组成，成为supersteps
- pregel迭代过程
  - 每个顶点从上一个superstep接收入站消息
  - 计算顶点新的属性值
  - 在下一个superstep中向相邻的顶点发送消息
  - 当没有剩余消息时，迭代结束

## API

- initialMsg：在“superstep 0”之前发送至顶点的初始消息
- maxlterations：将要执行的最大迭代次数
- activeDirection：发送消息方向（默认是出边方向：EdgeDirection.Out
- vprog：用户定义函数，用于顶点接收消
- sendMsg：用户定义的函数，用于确定下一个迭代发送的消息及发往何处
- mergeMsg：用户定义的函数，在vprog前，合并到达顶点的多个消息



举例，查找最小值

```scala
import org.apache.spark.graphx._
import org.apache.spark.rdd.RDD
import org.apache.spark.sql.SparkSession

object FindMin extends App {

    val spark = SparkSession.builder.master("local[*]")
        .appName(s"${this.getClass.getSimpleName}")
        .getOrCreate()
    val sc = spark.sparkContext

    val initialMsg = 9999
    def vprog(vertexId: VertexId, value: (Int, Int), message: Int): (Int, Int) = {
        if (message == initialMsg)  value else (message min value._1, value._1)
    }
    /*
    思考：什么情况下message == initialMsg 为true   返回value
    	设置Int.MaxValue的作用是什么？
    	
    */

    def sendMsg(triplet: EdgeTriplet[(Int, Int), Boolean]): Iterator[(VertexId, Int)] = {
        val sourceVertex = triplet.srcAttr
        if (sourceVertex._1 == sourceVertex._2) Iterator.empty  else  Iterator((triplet.dstId, sourceVertex._1))
    }

    def mergeMsg(msg1: Int, msg2: Int): Int = msg1 min msg2


    // 创建顶点集RDD
    val vertices: RDD[(VertexId, (Int, Int))] = sc.parallelize(Array((1L, (7,-1)), (2L, (2,-1)),  (3L, (3,-1)), (4L, (6,-1))))
    // 创建边集RDD
    val relationships: RDD[Edge[Boolean]] = sc.parallelize(Array(Edge(1L, 2L, true), Edge(1L, 4L, true),  Edge(2L, 4L, true), Edge(3L, 1L, true),  Edge(3L, 4L, true)))
    // 创建图
    val graph = Graph(vertices, relationships)
    //Pregel
    val minGraph = graph.pregel(initialMsg, Int.MaxValue,  EdgeDirection.Out)(vprog, sendMsg, mergeMsg)
    minGraph.vertices.collect.foreach{
        case (vertexId, (value, original_value)) => println(vertexId,value)
    }
}

```


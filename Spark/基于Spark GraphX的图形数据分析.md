# 基于Spark GraphX的图形数据分析

为什么我们需要图计算？

- 许多大数据以大规模图或网络的形式呈现
- 许多非图结构的大数据，常会被转换为图模型进行分析
- 图数据结构很好地表达了数据之间的关联性

## 图graph基本概念

- 图是由顶点集合(vertex)及顶点间的关系集合（边edge）组成的一种网状数据结构
  - 通常表示为二元组：Gragh=（V，E）
  - 可以对事物之间的关系建模

- 应用场景

  - 在地图应用中寻找最短路径

  - 社交网络关系

  - 网页间超链接关系

    

## 术语

- 顶点vertex
- 边edge
- 有向图
- 无向图
- 有环图
- 无环图
- 度：一个顶点所有边的数量
  - 出度：指从当前顶点指向其他顶点的边的数量
  - 入度：其他顶点指向当前顶点的的边的数量

## 顶点结构

VertexRDD :  (VertrxId,VD)

## 边结构

EdgeRDD : (stcId,dstId,ED)

## API

- graph.vertices

- graph.edges

- graph.triplets  

  - 即把顶点信息和边信息聚合到一起，返回一个数组

  - 例如

    ```scala
    import org.apache.spark.{SparkConf, SparkContext}
    import org.apache.spark.graphx.{Edge, Graph}
    import org.apache.spark.rdd.RDD   
    	//点
    	val vertexArray = Array(
            (1L, ("Alice", 28)),
            (2L, ("Bob", 27)),
            (3L, ("Charlie", 65)),
            (4L, ("David", 42)),
            (5L, ("Ed", 55)),
            (6L, ("Fran", 50))
        )
    	//边
        val edgeArray = Array(
            Edge(2L, 1L, 7),
            Edge(2L, 4L, 2),
            Edge(3L, 2L, 4),
            Edge(3L, 6L, 3),
            Edge(4L, 1L, 1),
            Edge(5L, 2L, 2),
            Edge(5L, 3L, 8),
            Edge(5L, 6L, 3)
        )
    	//设置配置
        val conf = new SparkConf().setMaster("local[2]").setAppName("Fans")
        val sc = new SparkContext(conf)
    	//创建边和点的RDD
        val vertexRdd:RDD[(Long,(String,Int))] = sc.parallelize(vertexArray)
        val edgeRdd:RDD[Edge[Int]] = sc.parallelize(edgeArray)
    	//创建图
        val graph:Graph[(String,Int),Int] = Graph(vertexRdd,edgeRdd)
    	
    	graph.triplets.collect.foreach(println(_))
    /*结果：
    ((2,(Bob,27)),(1,(Alice,28)),7)
    ((2,(Bob,27)),(4,(David,42)),2)
    ((3,(Charlie,65)),(2,(Bob,27)),4)
    ((3,(Charlie,65)),(6,(Fran,50)),3)
    ((4,(David,42)),(1,(Alice,28)),1)
    ((5,(Ed,55)),(2,(Bob,27)),2)
    ((5,(Ed,55)),(3,(Charlie,65)),8)
    ((5,(Ed,55)),(6,(Fran,50)),3)
    */
    ```

    

- graph.inDegrees  
  
- 返回值:RDD[(vertexId,Int)]
  
    
  
- graph.outDegrees

- graph.numVertexs

- graph.numEdges

- graph.mapVertices

- graph.mapEdges

- graph.mapTriplets

- graph.reverse  改变边的方向
  
- Graph[VD,ED]  
  
- graph.subgraph   生成满足顶点与边的条件的子图
  - def subgraph(epred: EdgeTriplet[VD,ED] => Boolean,
                   vpred: (VertexId, VD) => Boolean): Graph[VD, ED]

- graph.joinVertices
  
- def joinVertices[U] ( table: RDD[(VertexId, U)])(map:(VertexId, VD, U) => VD): Graph[VD, ED]
  
- graph.outerJoinVertices  RDD中的顶点不匹配时，值为None
  
  - def outerJoinVertices[U, VD2] ( table: RDD[(VertexId, U)])(map: (VertexId, VD, Option[U]) => VD2): Graph[VD2, ED]

## PageRank in GraphX

- PageRank算法   PR
  - 用于评估网页连接的质量和数量，以确定该网页的重要性和权威性的相关分数，范围为0到10
  - 本质实际上是算图中顶点（网页连接）的重要性
  - GraphX提供了PageRank API用于计算图的PageRank

>  数据从哪来？日志信息。需要收集用户日志，监控
>
> 可以用Flume监控

- 递归
```scala
val s =Array("1,77 83 61 19 75,10 3 5 3 10","2,65 23 92 46 45,4 7 1 6 9")
//Array[String] = Array(1,77 83 61 19 75,10 3 5 3 10, 2,65 23 92 46 45,4 7 1 6 9)
 s.map(_.split(","))
// Array[Array[String]] = Array(Array(1, 77 83 61 19 75, 10 3 5 3 10), Array(2, 65 23 92 46 45, 4 7 1 6 9))



```

```scala
//1.0
def xxx(x:Array[String])={
val fids = x(1).split(" ")
val odn = x(2).split(" ")
//  val arr = Array.empty  不能直接定义一个空数组，
var arr = Array[(String,String,String)]()
for(j <- 0 until fids.length){
arr = (x(0),fids(j),odn(j)) +: arr
}
arr
}
```

```scala
//2.0
import scala.collection.mutable.ListBuffer

def xxx(x:Array[String])={
val fids = x(1).split(" ")
val odn = x(2).split(" ")
var arr = ListBuffer[(String,String,String)]()
for(j <- 0 until fids.length){
arr += Tuple3(x(0),fids(j),odn(j))//List集合需要使用Tuple创建元组
}
arr
}
```

```scala
s.map(_.split(",")).map(xxx(_))
/*Array[scala.collection.mutable.ListBuffer[(String, String, String)]] = Array(ListBuffer((1,77,10), (1,83,3), (1,61,5), (1,19,3), (1,75,10)), ListBuffer((2,65,4), (2,23,7), (2,92,1), (2,46,6), (2,45,9)))
*/
```



> 线程池
>
> java中有四种线程池
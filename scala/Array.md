# Array

方法

## * - a - b - c

### ++

- **def ++[B](**that: GenTraversableOnce[B]**): Array[B]**

合并集合，并返回一个新的数组，新数组包含左右两个集合对象的内容。    

```scala
var aa = Array(1,2,3,4)
var bb=Array(4,3,2,1)
aa ++ bb
// Array[Int] = Array(1, 2, 3, 4, 4, 3, 2, 1)
  
```

### ++:

- **def ++:[B >: A, That] (that: collection.Traversable[B])(implicit bf: CanBuildFrom[Array[T], B, That]): That**

类似于++，但是返回值的类型又：右边决定，右边是什么类型，返回值就是什么类型

### +:

- **def +:(elem: A): Array[A]**

在数组前面添加一个元素并返回一个新对象

```scala
val aa = Array(1,2,3,4)
val cc = 0 +: aa
//Array[Int] = Array(0, 1, 2, 3, 4)
```



### :+

- **def :+(elem: A): Array[A]**

同样是想数组中添加一个元素，但是在末尾添加，并返回一个新的对象

需要添加新元素的对象应该放在：一侧

```scala
val cc = aa :+ 0
// Array[Int] = Array(1, 2, 3, 4, 0)
```



### /:

- **def /:[B](z: B)(op: (B, T) ⇒ B): B**

对数组中所有的元素进行相同的操作 ，foldLeft的简写

表示左树根

```
			o
		    /\
		   /\ 
		  /\
          /\
```



### :\

- **def :\[B](z: B)(op: (T, B) ⇒ B): B**

foldRight的简写

表示右树根

```
		o
	    /\
	     /\
	      /\
	       /\
```



### addString

- **def addString(b: StringBuilder): StringBuilder** 

将数组中的元素逐个添加到b中

```scala
val aa = Array(1,2,3,4)
val bb = new StrinBuilder
aa.addString(bb)
//StringBuilder = 1234
```

- **def addString(b: StringBuilder, start: String, sep: String, end: String): StringBuilder** 

同上，在首尾各加一个字符串，并指定sep分隔符

```scala
val aa = Array(1,2,3,4)
val bb = new StrinBuilder
val cc= aa.addString(b,"{",",","}")
//cc: StringBuilder = {1,2,3,4}
```



### aggregate

- **def aggregate[B] (z: ⇒ B)(seqop: (B, T) ⇒ B, combop: (B, B) ⇒ B): B**

  聚合计算，柯里化方法，参数是两个方法

  ```scala
  var aa = List(1,2,3,4)
  aa.par.aggregate(5)(_+_,_+_)
  // Int = 25
  ```

  

  ```scala
  //这里封装两个方法来讲解aggregate
  var fun1 = (x:Int,y:Int)=>{println("fun1..."+"x"+":"+"y");x+y}
  var fun2 = (x:Int,y:Int)=>{println("fun2..."+"x"+":"+"y");x+y}
  var aa = List(1,2,3,4)
  aa.par.aggregate(10)(fun1,fun2)
  
  /*会出现三种结果
  第一种
  fun1...10:1			
  fun1...11:2
  fun1...13:3
  res27: Int = 16
  */
  
  /*
  第二种
  fun1...10:1
  fun1...10:2
  fun1...12:3
  fun2...11:15
  res23: Int = 26
  */
  
  /*
  第三种
  fun1...10:1
  fun1...10:2
  fun1...10:3
  fun2...12:13
  fun2...11:25
  res25: Int = 36
  */
  ```

  

### andThen



### apply

- **def apply(i: Int): T**

取出指定索引处的元素

```scala
val aa = List(1,2,3,4)
aa(1)
// Int = 2
aa.apply(1)
// Int = 2

```







### applyOrElse



### array



### canEqual

- **def canEqual(that: Any): Boolean**

判断两个对象是否可以比较

### clone

- **def clone(): Array[T]**

创建一个副本

```scala
val chars = Array("a","b","c")
val newchars = chars.clone()
//newchars: Array[String] = Array(a, b, c)

```



### collect

- **def collect[B] (pf: PartialFunction[A, B]): Array[B]**

通过执行一个并行计算（偏函数），得到一个新的数组对象 

### collectFirst

- **def collectFirst[B] (pf: PartialFunction[T, B]): Option[B]**

  在序列中查找第一个符合偏函数定义的元素，并执行偏函数计算

```scala
val arr = Array(1,'a','b')
//两个参数，传入的可以是任何类型Any，传出的按需设置值，这里需要传出一个Int类型
val fun:partitalFuntion[Any,Int] = {
    case x:Int => x*100
}

val value = arr.collectionFirst(fun)

```



### combinations

- **def combinations(n: Int): collection.Iterator[Array[T]]**

组合，参数n表示序列长度，即几个字符一组

```scala
val a = Array("a","b","c","d","e")
val newa = a.combination(3)
//newa: Iterator[Array[String]] = non-empty iterator
newa.foreach(f=>println(f.mkString))
/*abc
abd
abe
acd
ace
ade
bcd
bce
bde
cde
*/
```



### companion



### compose



### contains

- **def contains [A1 >: A](elem: A1): Boolean**

```scala
val a = Array("a","b","c","d","e")
a.contains("a")
//res: Boolean = true
```



### containSlice

- **def containsSlice[B] (that: GenSeq[B]): Boolean**

判断当序列中是否包含另一个序列

```scala
val a = Array(1,2,3,4,5,6)
val b = Array(3,4,5)
a.containsSlice(b)
//res: Boolean = true
```



### copyToArray

- def copyToArray(xs: Array[A]): Unit
- copyToArray(xs: Array[A], start: Int): Unit 
- copyToArray(xs: Array[A], start: Int, len: Int): Unit 

拷贝到新数组中，start:Int 此处代表b这个新数组中的起始下标，len:Int 表示a数组中的元素从第一个开始放几个

```scala
val a = Array('a','b','c')
val b:Array[Char] = new Array[5]
a.copyToArray(b)  // b  Array[Char] = Array(a, b, c, ?, ?)
a.copyToArray(b,1)   // b   Array[Char] = Array(?, a, b, c, ?)
a.copyToArray(b,1,2)  // b  Array[Char] = Array(?, a, b, ?, ?)


```







### copyToBuffer

- **def copyToBuffer[B >: A] (dest: Buffer[B]): Unit**

将数组中的内容拷贝到Buffer中

```scala
val a = Array('a','b','c')
val b = scala.collection.mutable.ArrayBuffer[Any]()
a.copyToBuffer(b)
b.mkString(",")
// String = a,b,c
```



### corresponds

- **def corresponds[B] (that: GenSeq[B])(p: (T, B) ⇒ Boolean): Boolean**

  判断两个数组长度以及对应位置的元素是否符合某个条件。如果两个数组具有相同的元素数量并且p(x,y)=true,返回结果true

```scala
val a = Array(1,2,3)
val b = Array(3,4,5)
a.corresponds(b)(_>_)
//Boolean = false
 a.corresponds(b)(_<_)
// Boolean = true

```



### count

- **def count(p: (T) ⇒ Boolean): Int**

  统计符合条件的元素个数

```scala
val f = {p:Int => p>2 }
a.count(f)
//Int = 1
//或者
a.count({p:Int=>p>2})
```





## d - e - f - g - h

### deep

### diff

- **def diff(that: collection.Seq[T]): Array[T]**

  计算当前数组与另一个数组的不同，将当前数组中在另一个数组中没有出现的元素以数组的形式返回

  ```scala
  val a = Array(1,2,3)
  val b = Array(3,4,5)
  a.diff(b)
  // Array[Int] = Array(1, 2)
  //就是在b里面找a的元素，1没有即返回，2没有也返回，3有不返回；谁在前就返回谁的元素
  b.diff(a)
  // Array[Int] = Array(4, 5)
  //在a里面找b的元素，3有不返回，4和5都没有即返回
  ```

### distinct

- **def distinct: Array[T]**

去重

```scala
val a = Array(1,2,2,3,4,5,6,6)
a.distinct
//Array[Int] = Array(1, 2, 3, 4, 5, 6)
```

### drop

- **def drop(n: Int): Array[T]**

  将当前数列删除n个元素后，返回一个新的数列，从头开始算起

```scala
val a = Array(1,2,3)
a.drop(2)
// Array[Int] = Array(3)
```

### dropRight

- **def dropRight(n: Int): Array[T]**

作用与drop相同，但是从尾部开始

### dropWhile

- **def dropWhile(p: (T) ⇒ Boolean): Array[T]**

  即当满足某个条件，返回数组中该元素，一直到第一个不满足条件的人为止

```scala

```

### endWith

- **def endsWith[B] (  that: GenSeq[B]): Boolean**

  判断是否以某个序列结尾 

### exists

- **def exists(p: (T) ⇒ Boolean): Boolean**

  判断当前数组是否包含符合条件的元素，若有，则返回true

```scala

```

### filter

- **def filter(p: (T) ⇒ Boolean): Array[T]**

  取得当前数组中符合添加的元素，组成新的函数返回

### filterNot

与filter作用相反

### find

- **def find(p: (T) ⇒ Boolean): Option[T]**

查找第一个符合条件的元素，返回Option

```scala
val a = Array(1,2,3,4)
a.find({p=>p>2})
//  Option[Int] = Some(3)  只返回第一个查找到的元素
a.find({p=>p>2}).get
// Int = 3
a.find(_>5)
// Option[Int] = None
```

### flatMap

- **def flatMap[B] ( f: (A) ⇒ GenTraversableOnce[B]): Array[B]**

  对当前序列的每个元素进行操作，结果放入新序列返回，参数要求是GenTraversableOnce及其子类

  ```scala
  val a = Array(1,2,3,)
  a.flatMap(x=> 1 to x)
   Array[Int] = Array(1, 1, 2, 1, 2, 3)
  ```

### flatten

- **def flatten[U] (implicit asTrav: (T) ⇒ collection.Traversable[U], m: ClassTag[U]): Array[U]**

  ```scala
  val a = Array(Array(1,2,3),Array(2,3,4))
  a.flatten
  // Array[Int] = Array(1, 2, 3, 2, 3, 4)
  ```

### fold

- **def fold[A1 >: A] (z: A1)(op: (A1, A1) ⇒ A1): A1**

  功能和aggregate相似，对序列中的每个元素进行二元运算

```scala
  def seqno(m:Int,n:Int): Int ={
    val s = "seq_exp=%d+%d"
    println(s.format(m,n))
    return m+n
  }
  def combine(m:Int,n:Int): Int ={
    val s = "com_exp=%d+%d"
    println(s.format(m,n))
    return m+n
  }
  val a = Array(1, 2, 3, 4)
  val b = a.fold(5)(seqno)
    /** 运算过程
    seq_exp=5+1
    seq_exp=6+2
    seq_exp=8+3
    seq_exp=11+4
    */
    val c = a.par.aggregate(5)(seqno,combine)
    /** 运算过程
    seq_exp=5+1
    seq_exp=5+4
    seq_exp=5+3
    com_exp=8+9
    seq_exp=5+2
    com_exp=6+7
    com_exp=13+17
    */
```

### flodLeft

- **def foldLeft[B] (z: B)(op: (B, T) ⇒ B): B**
- 同 /：

### flodRight

- **def foldRight[B](z: B)(op: (B, T) ⇒ B): B**
- 同 :\

### forall

- **def forall(p: (T) ⇒ Boolean): Boolean**

  检测系列中的元素是否都满足条件p、如果序列为空，返回true

  ```scala
  val a = Array(1,2,3,4)
  a.forall({x:Int=>x>0})
  //true
  a.forall({x:Int=>x>2})
  //false
  ```

### foreach

- **def foreach(f: (A) ⇒ Unit): Unit**

  遍历数组元素，进行f操作

```scala
val a = Array(1,2,3,4)
a.foreach(x=> println(x*10))
/**
    10
    20
    30
    40
*/
```



### groupBy

- **def groupBy[K] (f: (T) ⇒ K): Map[K, Array[T]]**

```scala
val a = Array(1,2,3)
val b = a.groupBy(x=> x match{
     case x if (x<3)=>"small"
     case _ => "big"
})
//b: scala.collection.immutable.Map[String,Array[Int]] = Map(small -> Array(1, 2), big -> Array(3))
```

返回一个Map[String,Array[Any]]

### grouped

- **def grouped(size: Int): collection.Iterator[Array[T]]**

```scala
val a = Array(1,2,3,4,5)
val b = a.grouped(3).toList
//b: List[Array[Int]] = List(Array(1, 2, 3), Array(4, 5))
b.foreach((x) => println("第"+(b.indexOf(x)+1)+"组:"+x.mkString(",")))
/**
第1组:1,2,3
第2组:4,5
*/
```

### hasDefiniteSize

- **def hasDefiniteSize: Boolean**

  检测序列是否存在有限长度，对于stream这样的流数据，返回false

  ```scala
  val a = Array(1,2,3,4,5)
  a.hasDefiniteSize
  //res1: Boolean = true
  ```

### head

返回序列的第一个元素，如果序列为空，将引发错误

```scala
val a = Array(1,2,3,4,5)
a.head
// Int = 1
```

### headOption

返回Option对象

```scala
val a = Array(1,2,3,4,5)
val b = Array()
val c = Array{}
a.headOption
//Option[Int] = Some(1)
b.headOption
//无此函数
c.headOption
//Option[Unit] = Some(())
```

## i - i - j - k - l

### indexOf

- **def indexOf(elem: T, from: Int): Int**
- **def indexOf(elem: T): Int**
- 检测当前序列中是否包含某个元素并返回下标

### indexOfSlice

- **def indexOfSlice[B >: A] ( that: GenSeq[B], from: Int): Int**
- **def indexOfSlice[B >: A] (that: GenSeq[B]): Int**
- 检测当前序列中是否包含另一个序列

### indexWhere

- **def indexWhere(p: (T) ⇒ Boolean, from: Int): Int**
- **def indexWhere(p: (T) ⇒ Boolean): Int**
- 返回当前序列中第一个满足P条件元素的索引

### indices

- **def indices: collection.immutable.Range**

- 返回当前序列索引集合

  ```scala
  val a = Array(10, 2, 3, 40, 5)
  a.indices
  //scala.collection.immutable.Range = Range(0, 1, 2, 3, 4)
  ```

### init

- **def init: Array[T]**
- 返回当前序列中不包含最后一个元素的序列

### inits

- **def inits: collection.Iterator[Array[T]]**

  对集合中的

```scala
val a = Array(10, 2, 3, 40, 5)
a.inits.toList
//List[Array[Int]] = List(Array(10, 2, 3, 40, 5), Array(10, 2, 3, 40), Array(10, 2, 3), Array(10, 2), Array(10), Array())

```

### intersect

- **def intersect(that: collection.Seq[T]): Array[T]**

  取两个集合的交集

### isDefinedAt

- **def isDefinedAt(idx: Int): Boolean**

### isEmpty

-  **def isEmpty: Boolean** 

  判断当前序列是否为空

### isIntanceOf

-  **final def isInstanceOf[T0]: Boolean**



## m - n  - o - p - r

### map





## s - t 

### sameElements

### scan

## u - v -w - z

### union

- 
# Scala基础

## scala简介

源于java，建立在JVM之上，scala与java兼容、互通

### scala优势

多范式编程，即面向对象编程、函数式编程

表达能力强，代码精简

### 大数据与scala

Spark采用scala语言设计，可提供的API更加优雅，基于JVM语言更融入Hadoop生态圈

## 下载

> https://www.scala-lang.org/download

```

```





## Scala概述

`Overview`

- 面向对象特性
  - 每个值都是对象`the main code construct is an object (versus a class in Java).`
  - 对象的数据类型和行为由类（Class）和特征(Trait,类似宇interface）
  - 利用特征实现
  - 嵌套函数`Nested Functions`
  - 封闭式`Closures`
- 函数式编程
  - 每个函数都是一个值
  - 支持高阶函数、柯里化、样例类即模式匹配……
- 静态类型语言
- 扩展性



## 交互式编程

`Interactive Tutorials`

```scala
scala
```

```scala
object HelloWorld{
    def main(args:Array{String}):Unit = {
        println("Hello,World!")
    }
}
//def关键字
//args参数名
//Array参数类型
//Unit相当于void 没返回值
```

```scala
object HelloScala{
    def main(args:Array[String]):Unit = {
        println("hello scala!")
    }
}
```

```
D:\scala> scalac D:\scala\scalatest.scala  
#编译成功后，出现HelloScala.class文件，其名称为项目名称
D:\scala>scala HelloScala
hello scala!

```

## 变量与常量

var -- 变量 (需要强制性约束时，要指定类型)

val  --常量

自动类型推断功能

```scala
//变量
var a = 9
a: Int = 9
//常量
val c = 9.6
c: Doubl = 9.6
//隐式转换
var a = 9
var b = 9.6
b = a 
b: Double = 9.0
```

```scala
implic	
```

## 类型别名

```scala
type T = Int
val a:T = 10
a: T = 10
```

## Scala数据类型

与java有相同的原始数据类型

scala的所有数据类型都是对象：如Byte、Int、Double

## Scala数据类型层次结构

- Any类型：最顶级的超类
  - AnyVal：所有值类型的超类
    - Double
    - Float
    - Long
    - Int
    - Short
    - Byte
    - Unit：表示无值，类似java中的void，唯一一个值是()
    - Boolean
    - Char
  - AnyRel(java.lang.Object,所有引用类型的一个父类)
    - List
    - Option
    - YourClass
  - Null（对象是空对象，）
- Nothing

## Scala循环控制

### while循环

### for循环

### 中断

### for循环过滤

### for循环返回值

```scala
val num:Int = 10;
for(i:Int <-1 to num by 2){
    if(i>=5)break
    println(i * 500)
}
```

## Scala数组



```scala
var c = Array(1,2,3)

```

## Scala元组

`Tuple`



## Scala集合

### HashMap

`mutable`

```scala
//e是mutable类型，hm是immutable类型，将e ++: hm  得到的是依旧是immutable
var e = new scala.collection.mutable.HasdMap
e += ("f"->"g","h"->"i")
var hm = new scala.collection.immutable.HashMap
e ++: hm    //++： 代表加两个集合     +：代表将一个元素加到集合中    不可写immutable没有++=
//结果：scala.collection.immutable.HashMap[String,String] = Map(f -> g, h -> i)
e ++= hm 
//结果：scala.collection.mutable.HashMap[String,String] = Map(h -> i, f -> g)
```

```scala
var ap = Map("1"->"a","2"->"b")
ap("1")  //按键查找并返回
ap+=("3"->"c")//添加
ap-+("3")//删除
var tp = ap ++ Map[String,String]("4" ->" d","5"-> "e")
//结果：
//scala.collection.immutable.Map[String,String] = Map(1 -> a, 2 -> b，4 -> d,5 -> e)
```







### Set

```scala
var st =Set(1,2,3)
st: scala.collection.immutable.Set[Int] = Set(1, 2, 3)

var st = Set(2,1,3)
scala.collection.immutable.Set[Int] = Set(2, 1, 3)

var st = scala.collection.immutable.SortedSet(2,1,3)
scala.collection.immutable.SortedSet[Int] = TreeSet(1, 2, 3)
```

```scala
var s = Set("aa","bb","cc")
s + "a"
s += "bb"
var t = Set("aa","bb","gg","hh")

//交集
s intersect t
Set[String] = Set("aa","bb")
//并集
s union t
Set[String] = Set("aa","bb","cc","gg","hh")
//差集
s diff t
Set[String] = Set("cc","gg","hh")
```





### List   

`immutable`

```scala
var a = List(2,4,6,7,8)
var x = a.filter( _ %2 ! = 0)   
//返回过滤后为TRUE的值
//结果：x:List[Int] = List(7)
```

takewhile与filter的区别

```scala
var ll = List(1,2,3,4,5,4,3,2,1)
ll.takeWhile(_<4)
//List[Int] = List(1,2,3)
ll.filter(_<4)
//List[Int] = List(1, 2, 3, 3, 2, 1)
```



# Seq

#### Vector



#### Stream

# 

#### groupby

```scala

```

#### sortWith

```scala
a.sortWith((x,y) => x>y)
//另一种使用下划线的写法
a.sortWith(_>_)
List[Int] = List(8, 7, 6, 4, 2)

//同理
a.sortWith((x,y) => x《y)
//使用下划线
a.sortWith(_<_)
List[Int] = List(2, 4, 6, 7, 8)
```

`_`下划线的使用方法  4种了

```scala
//1、

```


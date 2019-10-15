# Scala面向对象

- 构造器
  - 主构造器
  - 辅助构造器：辅助构造器必须调用主构造器
- 成员变量和方法
- 类的实例化：同java  使用new关键字

## 类class

- 类通过class关键词定义

```scala
class Point(xc:Int,yc:Int)//主构造器，在类后面跟着
```

```scala
def this(){
    this(0,0)
}
//辅助构造器，可以有很多个，不写也可以
//就像java中写了有参构造，没有无参构造也可以，传入的时候就就必须带两个参数
```



```scala
class Test2(xc:Int,yc:Int) {
    //3、执行全部，包括move
    var x:Int = xc //成员变量
    var y:Int = yc
  //val y:Int
  //这里val和var不同，定义为var x，编译成class后x是私有化变量，提供了一个get方法
  //val则不是
    println("-------------")

    //辅助构造器
    def this(x:Int)={
      //2、再去找主构造器 Test2
      this(x,1)
      //6、打印
      println("************")
    }


    def this() ={
      //1、到这里之后去找其他构造器，this(x:Int)
      this(0) //第一句必须调用其他构造器
      //7、打印
      println("++++++++++++++++")
    }


    def move(dx:Int,dy:Int)= {
      //4、执行此方法
      x = x + dx
      y = y + dy

    }
     //5、打印
    println("/////////////////")
    println(x,y)

    }
```

```scala
object Test1 {
    def main(args:Array[String]):Unit={
      val s = new Test2()

    }
}
```

> 在java中构造器，成员变量初始化，与类同名，没有返回值void都没有，
>
> this 两种用法   1>this.方法或对象  2>this()
>
> this必须写在方法中



```scala
class Point(xc:Int,yc:Int){
  var x:Int = xc
  var y:Int = yc
  println("-----主构造器--------")

  def this(x:Int)={
    this(x,1)
    println("************")
  }



  def this() ={
    this(0,0)
    println("+++++辅助构造器")
  }


  def move(dx:Int,dy:Int)= {
    x = x + dx
    y = y + dy
    println("/////////////////")
    println(x,y)

  }

}

class BlackPoint() extends  BlackPoint{
  private var color = "black"
  override def move(dx: Int, dy: Int): Unit ={
    x = x + dx
    y = y + dy
    println("move to x:"+x+"y:"+y)
  }
}
```

```scala
object TestExtendss {
  def main(args: Array[String]): Unit = {
    var b = new BlackPoint().move(1,2)
  }
```

### 类的继承 extends

> 多根继承，函数式语言，java只能单根继承，类一旦定义，在内存中开辟空间就不变了，所以只能单继承



### 抽象类 abstarct class

> 抽象类，可包含未实现的方法，及抽象方法。
>
> 如果一个类在自己的很多方法内有共同的方法，则可以提取方法
>
> 如果两个类有相同的方法，比如都是花钱，但是具体的花钱方法却不一样，所以花钱可以提取为一个抽象方法，在不同的子类中，重写具体的花钱的方法。有点像办约束。
>
> 

> 接口，是一种约束

```scala
abstract class MyHello {

    def sayHello():Unit={
        println("hello")
    }

    def myInfo():Unit //abstract

}
```

```scala
class MyApp extends MyHello {

    override def myInfo(): Unit = {
        println("我是抽象方法")
    }
}

object MyApp{
    def main(args: Array[String]): Unit = {
        var ma = new MyApp
        ma.myInfo()
        
              var a = new MyHello {
            override def myInfo(): Unit = {
                println("我是new出来的抽象类的对象")
            }
            
            
        }
    }
}

```



### 伴生类和伴生对象

```scala
class MyComp(name:String,age:Int) {

    //private var name = name
    /*
    class A{
        String name；全局变量
        public void A(String name){
            this.name = name   局部变量
            }
        public void B(){
            name  调用的是全局的name，不受局部的name影响


     */

    private var userName = name
    private var userAge = age
    println(userName,userAge)

}



object MyComp{
    def apply(name:String,age:Int):MyComp = new MyComp(name,age)

    def main(args: Array[String]): Unit = {
        var mc = new MyComp("asd",1)
        var mc1 = MyComp("xcv",2)//伴生对象，可以不能new出一个对象，可以直接从这里传参
    }


}

```



### 样例类

- 样例类常用于描述不可变的值对象

  ```scala
  case class 
  ```

  







## 特质trait

- scala中没有接口interface的概念
- 特质用于在类之间共享程序接口和字段，类似于java接口
- 特质是字段和方法的集合，可以字段和方法实现

```scala
object TraitDemo {

    def main(args: Array[String]): Unit = {
        val a = new Dog("doudou").eat()
    }
}

trait Pet{
    def cry():Unit

    def eat():Unit={
    println("dog eats meat")
    }
}

class Dog(name:String) extends Pet{
    override def cry(): Unit =
    {
        println("dog is crying")
    }
}

```

class extends 特质1 with 特质2 with 特质2

class extends 类\抽象类 with 特质1 with 特质2



### 混入特质

- 当每个特质被用于组合类时，被称为混入
- 一个类只能由一个父类但是可以有多个混入（extends、with）

### 动态混入特质

## 样例类

- 模式匹配

- 枚举



- 样例类与普通类
  - 区别
    - 样例类通常用于描述不可变的数据，数据完全依赖构造参数
    - 样例类默认不可变，通过模式匹配可以分解
    - 两个样例类“==”操作时，通过按值比较而不是按引用
    - 操作更简单
  - 最佳实践
    - 如果一个对象在内部执行有状态计算，或者表示出其他类型的复杂行为，那么它应该时一个普通类

## 泛型类

### 型变

- 协变
- 逆变
- 不变

### 类型边界

- 

## 内部类

- 一个类可以作为另一个类的成员，成为内部类

## 类成员访问修饰符

- scala

  |      |      |      |      |      |      |
  | ---- | ---- | ---- | ---- | ---- | ---- |
  |      |      |      |      |      |      |
  |      |      |      |      |      |      |
  |      |      |      |      |      |      |

  

## 注解

`Annotation`

- scala标准库注解包——scala.annotation

## 运算符

- 运算符即是方法。任何具有单个参数的方法都可以用过中缀运算怒



## 正则表达式

- scala 支持多种正则表达式

  - String.matches()

    ```scala
     "1234".matches("[0-9]{4}")
    // Boolean = true
    ```

  - 正则表达式模式匹配

    ```scala
    val pattern = "([0-9]{3})".r  //使用“.r”方法可以使任意字符串变成一个Regex实例
    "234" match{
        case pattern(zc) => println("Valid pattern"+zc)
        case zc => println("Invaild pattern"+zc)
    }
    // "234"
    
    ```

    ```scala
    
    ```

    

  - scala.util.matching.Regex API

![1569466127838](D:\笔记\scala\插图\1569466127838.png)

### 捕获分组

使用".group()"

```scala
//分组
val studentPattern: Regex = "([0-9a-zA-Z-#() ]+):([0-9a-zA-Z-#() ]+)".r
val input = "name:Jason,age:19,weight:100"
for (patternMatch <- studentPattern.findAllMatchIn(input)) {
     println(s"key: ${patternMatch.group(1)} value: ${patternMatch.group(2)}")
}
```

### 字符串替换

```scala
//search
val nums = "[0-9]+".r.findAllIn("123 Main Street Suite 2012")
nums.next   // -> 123
nums.next  // -> 2012
```

```scala
//replace
"[0-9]+".r.replaceFirstIn("234 Main Street Suite 2034", "567") //234->567   
"[0-9]+".r.replaceAllIn("234 Main Street Suite 2034", "567") //234、2034->567 
```

### 在字符串中查找模式

```scala
val date = """(\d\d\d\d)-(\d\d)-(\d\d)""".r
"2014-05-23" match {
    case date(_*) => println("It is a date")
}
//
"2014-05-23" match {
    case date(year, _*) => println("The year of the date is " + year) 
} 
"2014-05-23" match {
    case date(year, month, day) => println(year,month,day)
}

```

## Scala集成javaAPI

### 日期

```scala
val dateFmt = "yyyy-MM-dd"
println(today())
def today(): String = {
	val date = new Date()
	val sdf = new SimpleDateFormat(dateFmt)
	sdf.format(date)
}
```

### 异常处理

java中可以使用多个catch

而在scala中只能使用一个catch，但使用case模式匹配

```scala
object TestJavaScala{
    def main(args:Array[String]):Unit={
val a = new TestJavaScala()
	println(a.testExt())

    }
}
class TestJavaScala{
    def testExt():Nothing={
        throw new Exception("抛异常")
}
    
 /*Exception in thread "main" java.lang.Exception: 抛异常
	at com.scala.test.scala_java.TestJavaScala.testExt(TestJavaScala.scala:29)
	at com.scala.test.scala_java.TestJavaScala$.main(TestJavaScala.scala:22)
	at com.scala.test.scala_java.TestJavaScala.main(TestJavaScala.scala)
*/

```

```scala
import java.io.{File, FileNotFoundException, IOException}

import scala.io.Source

object TestScalaExp {
    def main(args: Array[String]): Unit = {
        try {
            val f = new File("input.txt")
            if (!f.canWrite)
                throw new Exception("file can't write")
            val file = Source.fromFile(f);
            for (line <- file.getLines()) println(line)
        } catch {
            case ex: FileNotFoundException => {
                println("Missing file exception")
            }
            case ex: IOException => {
                println("IO Exception")
            }
            case ex: Exception => {
                println(ex.getMessage)
            }
        } finally {
            println("Exiting finally...")
        }


    }
}
/*file can't write
Exiting finally...
*/
```

```scala
object TestAllCatch{
    def main(args:Array[String]): Unit={
        scala.tuil.control.Exception.allCatch.toTry("42a".toInt) match{
            case i:Int => println(i)
            case Failure() => println(e)
        }
    }
}

//java.lang.NumberFormatException: For input string: "42a"
```





## 实现wordcount

```scala

object WordCount {
    def main(args: Array[String]): Unit = {
        val a = Array[String]("hadoop java scala spark","hadoop java","scala")
        val b = a.flatMap(x => x.split(" "))
        //b   Array[String] = Array(hadoop, java, scala, spark, hadoop, java, scala)
        
        var tur = b.map(x=>(x,1))
        // Array[(String, Int)] = Array((hadoop,1), (java,1), (scala,1), (spark,1), (hadoop,1), (java,1), (scala,1))
        
        var turnext = tur.groupBy(x=>x._1)
        //或者可以写成   groupBy(_._1)
        //turnext: scala.collection.immutable.Map[String,Array[(String, Int)]] =
        // Map(spark -> Array((spark,1)), hadoop -> Array((hadoop,1),(hadoop,1)),
        // scala -> Array((scala,1), (scala,1)), java -> Array((java,1), (java,1)))

        var turnext_next = turnext.mapValues(x=>x.size)
        //turnext_next: scala.collection.immutable.Map[String,Int] = Map(spark -> 1, hadoop -> 2, scala -> 2, java -> 2)

        turnext_next.foreach((pair)=>println(pair._1+"的个数为："+pair._2))
        //spark的个数为：1
        //hadoop的个数为：2
        //scala的个数为：2
        //java的个数为：2

    }

}
```

上面代码是为了看清每个方法执行后结果，其实可以直接写成

```scala
var tur = b.map(x=>(x,1)).groupBy(x=>x._1).mapValues
```

> 能通用
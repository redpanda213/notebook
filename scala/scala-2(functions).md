# Scala函数

`函数是scala的核心`

函数定义及调用

```
def 函数名([参数列表]):[返回值]={
  
    函数体

    return [表达式]
}

函数名(参数列表)

```

## 参数传递

- 传值调用：参数旨在调用时计算一次，后续重复使用计算的结果
- 传名调用：参数在调用时不会计算，只用真正用到参数时才计算

```scala
def add(x:Int,y:Int):Int={
    x + y
}
//add: (x: Int, y: Int)Int
add(1,2)
//res:Int = 3
```

```scala
def add(x:Int,y:Int){
x + y
}


def add() = println("helloworld")
add
//helloworld
```

## 匿名函数

- 值不含函数名称的函数
- 匿名函数定义
  - "=>"	左边是参数列表
  - "=>"    右边是函数体

## 高阶函数

```scala
var l = List(1,2,3,4,5,6,7)
def big(x:Int):Int=x+1
l.map(big)
// List[Int] = List(2, 3, 4, 5, 6, 7, 8)
```

- 指使用其他函数作为参数，护着返回一个函数做欸结果的函数，
- 我们约定，使用函数值作为参数，或者返回值i函数值的“函数”或“方法”，称之为高阶函数

## 偏函数

`Partial Function`

scala中的Partial Function是一个Trait，其类型为PartialFunction[A,B],其中接受一个类型为A的参数，返回一个类型为B的结果




# Python面向对象

## 在类中定义方法

```python
class  Shape1 : 
    def  __init__(self, x=0, y=0) :
        self.x = x
        self.y = y
    def  move(self, deltaX, deltaY) :
        self.x += deltaX
        self.y += deltaY

```

以上代码中：

- `class  Shape `：定义类关键字
- `def  __init__(self, x=0, y=0) :`构造方法
- `self.x = x   self.y = y`实例变量
- `def  move(self, deltaX, deltaY) :`实例方法
- `self.x += deltaX    self.y += deltaY 对象实例`

### 实例方法

- 使用对象才能调用的方法
- 方法的第一个参数为self，表示对象本身

> ***注意***：永远不要使用类名调用实例方法

```python
shape = Shape1()
shape.move(2,3) #对象调用实例方法
print(shape.x)
print(shape.y)
```

### 静态方法

- 定义在类中的由类名调用的方法

- 定义一个静态方法

  - 使用装饰器@staticmethod定义静态方法

    ```python
    class Math: 
        @staticmethod
        def  factorial(n):
            if n <= 2: return n
            return Math.factorial(n-1)*n
    
    ```

  - 调用方法

    - ```python
      result = Math.factorial(100)
      ```

  - ***注意***：不要使用以下到的调用方法

    ```python
    #不要使用对象调用静态方法
    m = Math()
    result = m.__class__.factorial(100)
    result = m.factorial(100)
    
    ```

    

### 类方法

- 将本身作为对象进行操作的方法

- 定义一个类方法

  - 使用装饰器@classmethod定类方法

    ```python
    class Shape2: 
        @classmethod
        def  objectFactory(cls):
            return cls()
    class Circle(Shape):  
        pass
    aCircle = Circle.objectFactory()   #aCircle是一个Circle对象
    print(type(aCircle))
    #结果：<class '__main__.Circle'>
    ```

    

### 动态修改类中的方法

- 添加新方法

  ```python
  Circle.fn = lambda self,x:x*2*3.14
  aCircle.fn(100)
  print('我是新添加的方法：',aCircle.fn(100))
  #
  ```

- 删除

  ```python
  del Shape1.move
  s.move(10, 10)
  #执行报错:AttributeError: 'Test' object has no attribute 'move'
  ```

- 修改

  ```python
  Shape1.move = lambda self, x, y : x+y
  print(s.move(10, 10))
  #20
  ```

  

## 在类中定义变量

### 实例变量

```python
class Shape(object) : 
    def  __init__(self, x=0, y=0) :
        #在此处创建了x，y两个实例变量
        self.x = x  # x and y are instance variables
        self.y = y
    def  move(self, deltaX, deltaY) :
        self.x += deltaX
        self.y += deltaY
x = Shape()
x.x=100  

```



- 也可在实例创建后添加新的变量

  ```python
  x = Shape()
  x.newVar = 100
  print(x.__dict__) #通过__dict__查看创建的变量和其值
  #{'x': 0, 'y': 0, 'newvar': 90}
  ```

  

- 删除实例变量

  ```python
  t = Shape()
  print('添加新变量前：',t.__dict__)
  #添加
  t.newvar = 100
  print('添加了一个实例变量t：',t.__dict__)
  #
  del t.newvar
  print('删除newvar变量后：',t.__dict__)
  
  #添加新变量前： {'x': 0, 'y': 0}
  #添加实例变量newvar： {'x': 0, 'y': 0, 'newvar': 100}
  #删除newvar变量后： {'x': 0, 'y': 0}
  ```

  

### 类变量

## 私有变量/方法

3种方法

## 继承

````python
class Shape(object):
	def __init__(self):
		self.x=0
		self.y=0
	def move(self,deltax,deltay):
		self.x += deltax
		self.y += deltay

#继承
class Square(Shape):
	pass

a = Square()
a.move(1,2)
print(a.x,a.y)
````

python中，继承不仅可以单继承，也支持多继承

### 多继承

```python
class A
class B
class C(A,B)
```

- MRO(Method Resolution order)原则

  - 多继承时方法解析顺序
  - 解决当父类存在同名函数时二义性的问题

  ```python
  
  ```



## 内建函数

## 创建对象

- `__new__`创建对象时先调用`__new__`创建对象实例

- `__init__ 对象实例创建后 __init__()方法调用执行初始化工作`

  

- 
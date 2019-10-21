# Python库

## NumPy科学计算库

### 介绍

 NumPy是Python中科学计算的基础包。它是一个Python库，提供多维数组对象，各种派生对象（如掩码数组和矩阵），以及用于数组快速操作的各种API，有包括数学、逻辑、形状操作、排序、选择、输入输出、离散傅立叶变换、基本线性代数，基本统计运算和随机模拟等等。 

- 功能强大的N维数组对象。
- 精密广播功能函数。      

- 集成 C/C+和Fortran 代码的工具。      
- 强大的线性代数、傅立叶变换和随机数功能。      

- NumPy库是数据分析的核心库之一

  

### 快速入门

#### 基础知识

##### 一个例子

NumPy的主要对象是同构多维数组。它是一个元素表（通常是数字），所有类型都相同，由非负整数元组索引。在NumPy维度中称为 *轴* 。 

NumPy的数组类被调用`ndarray`，  `ndarray`对象更重要的属性是： 

- **ndarray.ndim** - 数组的轴（维度）的个数。在Python世界中，维度的数量被称为rank。
- **ndarray.shape** - 数组的维度。这是一个整数的元组，表示每个维度中数组的大小。对于有 *n* 行和 *m* 列的矩阵，`shape` 将是 `(n,m)`。因此，`shape` 元组的长度就是rank或维度的个数 `ndim`。
- **ndarray.size** - 数组元素的总数。这等于 `shape` 的元素的乘积。
- **ndarray.dtype** - 一个描述数组中元素类型的对象。可以使用标准的Python类型创建或指定dtype。另外NumPy提供它自己的类型。例如numpy.int32、numpy.int16和numpy.float64。
- **ndarray.itemsize** - 数组中每个元素的字节大小。例如，元素为 `float64` 类型的数组的 `itemsize` 为8（=64/8），而 `complex32` 类型的数组的 `itemsize` 为4（=32/8）。它等于 `ndarray.dtype.itemsize` 。
- **ndarray.data** - 该缓冲区包含数组的实际元素。通常，我们不需要使用此属性，因为我们将使用索引访问数组中的元素。

```python
import numpy as np
a = np.arange(15).reshape(3, 5)
print('示例数组a：',a)
print('shape属性：',a.shape)
print('dim属性:',a.ndim)
print('dtype属性:',a.dtype.name)

print('itemsize属性：',a.itemsize)
print('size属性：',a.size)
print('a的type：',type(a))

b = np.array([6, 7, 8])
print('示例数组b:',b)

print('b的type:',type(b))

'''
示例数组a: [[ 0  1  2  3  4]
 		   [ 5  6  7  8  9]
           [10 11 12 13 14]]
shape属性： (3, 5)
dim属性: 2
dtype属性: int32
itemsize属性： 4
size属性： 15
a的type： <class 'numpy.ndarray'>
示例数组b: [6 7 8]
b的type: <class 'numpy.ndarray'>
'''
```

##### 数组创建

##### 打印数组

当打印数组时，NumPy以与嵌套列表类似的方式显示它，但具有以下布局：

- 最后一个轴从左到右打印，
- 倒数第二个从上到下打印，
- 其余部分也从上到下打印，每个切片用空行分隔。

然后将一维数组打印为行，将二维数据打印为矩阵，将三维数据打印为矩数组表。
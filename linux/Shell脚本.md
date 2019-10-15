# Shell脚本

## 编写第一个脚本

1、新建一个文件demo.sh

2、编辑文件内容

````
#!/bin/bash
echo "Hello World!"
````

3、执行

※授权 ： chmod 744 demo.sh

````
./demo.sh
或者
sh demo。sh
````

## 变量的声明

例如：

````
#!/bin/bash
var1=123
var2=456
((var3=$var1*$var2))
echo "Hello,World $var3"
var4=1234
var5=${var4/3/"hehe"}
echo "my char $var5"
echo ${JAVA_HOME}
echo `ls -l`
    
````

※不能有任何空格，空格表示换行

**※*切记写脚本时不能写中文字符，包括空格！！！***

※不区别单双引号，但一般情况下双引号内用单引号

````
var5=${var4/3/"hehe"}  表示用hehe替换3
````

````
echo ${JAVA_HOME}  可以调用环境变量
````

````
echo `ls -l`  调用命令 ` 符号为键盘做左上角
````



### 预定义变量

| 选项 | 说明                                    |
| ---- | --------------------------------------- |
| $#   | 命令行参数或位置参数的数量              |
| $?   | 最近一次执行的命令或shell脚本的出口状态 |
| $*   |                                         |
| $$   |                                         |

echo $0  表示打印脚本名

### 运算符

#### 关系运算符

| 选项 | 说明 |
| ---- | ---- |
| -eq  |      |
|      |      |
|      |      |
|      |      |

#### 逻辑运算符

| 选项 | 说明 |
| ---- | ---- |
|      |      |
|      |      |
|      |      |

例如：

````
#!/bin/bash
var1=10
var2=20
if [ $var1 ==  $var2 ]
then
  echo "ok"
else
  echo “fail”
fi
````

※注意格式Ⅰ中括号前后需要用空格隔开Ⅱ关系运算符需要用特定语法 如-eq表示不等于Ⅲ

#### 字符串运算符

| 选项 | 说明 |
| ---- | ---- |
|      |      |
|      |      |
|      |      |

例如：

````

#!/bin/bash
var1=10
var2=20
var3=30
var4=30
if [ $var1 -lt $var2 ] && [ $var3 -eq $var4 ]
then
  echo "ok"
else
  echo “fail”
fi
````



#### 文件运算符

| 选项 | 说明                               |
| ---- | ---------------------------------- |
| -d   | 判断是否为目录                     |
| -e   | 判断目录或文件是否存在             |
| -f   | 判断是否为文件                     |
| -r   | 判断文件或目录针对当前用户是否可读 |
| -w   | 判断文件或目录针对当前用户是否可写 |
| -x   | 判断文件或目录针对当前用户是否     |

### 循环

#### for循环

例如：循环打印opt文件夹下的目录



````
#!/bin/bash
var1=`ls /opt/`
for fl in $var1
do
  echo $fl
done
````

例如：判断一个目录下的内容，是文件夹还是文件

sh demo.sh /opt/

````

#!/bin/bash
var1=`ls $1`
for fl in $var1
do
  if [ -d $1$fl ]
  then
        echo "$fl is directory"
  else
        echo "$fl is file"
  fi
done

````


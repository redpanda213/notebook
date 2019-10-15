# Hive 函数

## 分类

- 从输入输出角度分类
  - 标准函数
  - 聚合函数
  - 表生成函数
- 从实现方式分类
  - 内置函数
  - 自定义函数
    - UDF：自定义标准函数
    - UDAF：自定义聚合函数
    - UDTF：自定义表生成函数‘

## 内置函数

### 字符函数

```
--查看有哪些内置函数
show functions;
```

#### concat()

字符串拼接

**concat_ws()**

```
select concat(name,'-',age) from stu;
select concat_ws('-',name,name) from stu; --拼接的内容是string或array<string>类型
```

#### instr()

```

```



#### regexp_replace()

```
select year(regexp_replace('2019/09/12','/','-'));
```

#### str_to_map()

```
select str_to_map('admin=123&name=zhang&password=444','&','=')[name]
```

### 类型转换/数学函数

#### cast()

将expr转换成type类型，cast("1" as bigint)即将字符串1 转换成bigint类型

#### binary()

转换成二进制

### 日期函数

#### from_unixtime()

```

```



#### unix_timestamp()

```
select unix_timestamp('2019-09-12 09:12:23');
```

#### weekofyear()

查看时间参数是第几周

```
select weekofyear('2019-09-12')

RESULT：37th
```

#### date_format()

```

```

### 聚合函数

sum()

min()

avg()

### 表生成函数





## UDF



### 开发流程

1、导包

```
<dependencies>
	<groupId></groupId>
	<artifactId>hive-exec</artifactId>
	<version>${hadoop.version}</version>
</dependencied>
<project>jar</project>
```

2、编写自定义函数代码

```java
import org.apache.hadoop.hive.ql.exec.UDF

public class MyUDF extends UDF{
	public String evaluate(final String s){
		if(s == null){
			return null;
		}
		return s.toString.toLowerCast();
	}
}
```

3、打包

clear 

package

4、上传到正确的hdfs路径

```
hdfs dfs -put hive-udf.jar /tmp/out[自选路径]
```

5、重启beeline/hive

6、创建函数

select curren_database();先查看一下当前使用的库

```
create function str_lower AS 'com.kgc.udf.MyUDF' using jar 'hdfs:////tmp/hive-udf.jar';
```

> 创建函数只能是当前数据库内可以使用，一般在写脚本/命令行模式，需要指定创建到那个库。
>
> 



7、测试

## UDTF

#### 流程

```java
import org.apache.hadoop.hive.ql.exec.udf.generic

public class MyUDTF extends GenericUDTF{

	List<> datalist = new ArrayList();
	@Override
	public StructObjectInspector initialize(StructObjectInspector argOIs){
	//输出数据的名字
	List<String> fieldNames = new ArrayList<>();
	fieldNames.add("word");

	//输出数据的类型
	List<ObjectInspector> fieldOIs = new ArrayList<>();
	fieldsOIs.add(PrimitiveObjectInspectorFactory.javaStringObjectInspector);
	
	
	return        ObjectInspectorFactory.getStandardStructObjectInspector(fieldNames,fieldOIs);
	
	@Override
	public void process(Object[] args){
		//传出两个参数，一个是数据，一个是分隔符
		String splitKey = args[0].toString();
		String data = args[1].toString();
		//切割完后，保存到数组中
		String[] words = data.split(splitKey);
		//输出
		for(String word : words){
			datalist.clear();
			datalist.add(word);
			forward(datalist);
		}
		
		
		
	}
	
	
	@Override
	public void close(){
	
	}
	
	
	}
}
```


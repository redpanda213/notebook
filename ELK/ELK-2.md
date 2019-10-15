# ELK

![这里写图片描述](https://img-blog.csdn.net/20160717132008382)

````es
cd /opt/inst/es622/bin

su 用户

sh elasticsearch -d

jps


````





![1566368283647](C:\Users\王先生\AppData\Roaming\Typora\typora-user-images\1566368283647.png)



```
{
		"mappings":{
			"userinfos":{
				"properties":{
					"username":{
						"type":"text"
					},
					"birthday":{
						"type":"date","format":"yyyy-MM-dd"
					},
					"sex":{
						"type":"integer"
					}
				}
				
			}
		}
}
```



````
{
	"username": "zx",
	"birthday": "1999-8-9",
	"sex": 1
}
````

> 粗框是优先使用的,
>
> 细框是备用的



```
{
	"settings":{
		"number_of_shards":3,
		"number_of_replicas":1
	},
	"mappings":{
		"community":{
			"properties":{
				"communityname":{
					"type":"text"      //分词器对text格式才进行分割
				},
				"city":{
					"type":"keyword"  //关键词，es库中词不做分词，看作一个整体。
				},
				"age":{
					"type":"integer"
				},
				"creationdate":{
					"type":"date",
					"format":"yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
				}
			}
		}
	}
}
```



### 简单查询

![1566372159648](C:\Users\王先生\AppData\Roaming\Typora\typora-user-images\1566372159648.png)

### 查询所有

```
POST > http://192.168.56.110:9200/new/community/_search
{
	"query":{
		"match_all":{}
	}
	"from":0,  //查询开始位置
	"size":5   //
}
结果：
{
	"took": 29,
	"timed_out": false,
	"_shards": {
		"total": 3,
		"successful": 3,
		"skipped": 0,
		"failed": 0
	},
	"hits": {
		"total": 15,
		"max_score": 1.0,
		"hits": [
			{
				"_index": "new",
				"_type": "community",
				"_id": "RB0Fs2wBRmu_GhvQhcEN",
				"_score": 1.0,
				"_source": {
					"communityname": "万科阳光苑",
					"city": "上海",
					"age": 10,
					"creationdate": "2008-01-01 00:00:00"
				}
			},
```

#### match:

1、条件分词2、再到es库分词表上去搜索3、like'%第一个词%' or like '%第二个词%'

match 模糊查询 or

match_all 查所有

multi_match	 

match_phrase  习语查询（短语匹配查询） 多词查询 相对位置不能改变

#### term：

1、把条件看成一个词2、在es库分词表上搜索3、like '%条件%'

term 条件不分词

terms  查询字段里含有多个关键字，不受相对位置限制



```
{
	"query":{
		"term":{
			"community":"万科"
		}
	}
}


{
	"query":{
		"match":{
			"community":"万科"
		}
	}
}
```





```
{
	"query":{
		"multi_match":{
			"query":"江",
			"fields":["community","city"]
		}
	}
}
```



### aggs聚合查询

```
{
	"aggs":{
		"my_group_by_age":{
			"terms":{
				"field":"age"
			},
			"my_group_by_creationdate":{
				"stats":{
					"field":"createtime"
			}
		}
	}
}
```

"must"

"must_not"

"should"

```
{
	"query":{
		"range":{
			"creationdate":{
				"gte":"2000-1-1",
				"lte":"2010-12-31"
			}
		}
	}
}

{
	"query":{
		"bool":{
			"must":[     //"should 意为or满足以下条件之一就返回"
				{"match":{"communityname":"万"}},
				{"range":{"age":{"lte":6}}}
		
			]	
		}
	}
}
```



Oracle 分词索引

![1566371235608](C:\Users\王先生\AppData\Roaming\Typora\typora-user-images\1566371235608.png)

![1566372435723](C:\Users\王先生\AppData\Roaming\Typora\typora-user-images\1566372435723.png)

> mysql设置主键（id），意味着主键新生成了新索引，在此表中进行查找，
>
> es中使用_id自然主键，不用我们自己写的id
>
> uuid自然主键

正则：搜索、替换、匹配、分割

### 批量操作bluk文件

````
PUT _bulk
````





题目：

1、设计1张表

2、超市

2.1最忠实的用户前10(一段时间内消费最多的用户)

2.2商圈辐射范围最大的3条街道（街道分组，用户数量特多）

2.3几周内哪些商品卖的好（range  groupby）

2.4忠实用户最喜欢的商品前5名（次数多，名字会重复，可以按u_id查询）

​	家用零食、大型电器、家居用品、日配产品

>  思路——
>
> ​	1、按照用户名分组，count获得最大的前10用户u_id
>
> ​	2、根据u_id分组 terms产所有的订单项目，并按商品进行分组



​	



| username | user_id  | address    | buy_date      |
| -------- | -------- | ---------- | ------------- |
| money    | goods_id | goods_name | specification |
| sex      |          |            |               |


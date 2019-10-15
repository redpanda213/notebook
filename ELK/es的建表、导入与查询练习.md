### 1新建索引

```
PUT > http://192.168.56.110:9200/stu
{	
	"mappings":{
		"doc":{
			"properties":{
				"id":{"type":"keyword"},
				"studentNo":{"type":"text"},
				"name":{"type":"text"},
				"major":{"type":"keyword"},
				"gpa":{"type":"double"},
				"yearOfBorn":{"type":"integer"},
				"classOf":{"type":"integer"},
				"interest":{"type":"text"}
			}
		}
	}
}

```

## 2、导入文档

> 使用POSTMAN中 POST > http://192.168.56.110:9200/stu/doc/_bulk
>
> Body > binary > select file 导入json文件，添加数据

````
{"index":{"_index":"stu","_type":"doc","_id":"1"}}
{"id": 1, "studentNo": "TH-CHEM-2016-C001", "name": "Jonh Smith", "major":"Chemistry", "gpa": 4.8, "yearOfBorn": 2000, "classOf": 2016,  "interest": "soccer, basketball, badminton, chess"}
{"index":{"_index":"stu","_type":"doc","_id":"2"}}
{"id": 2, "studentNo": "TH-PHY-2018-C001", "name": "Isaac Newton", "major":"Physics", "gpa": 3.6, "yearOfBorn": 2001, "classOf": 2018,  "interest": "novel, soccer, cooking"}
{"index":{"_index":"stu","_type":"doc","_id":"3"}}
{"id": 3, "studentNo": "BU-POLI-2016-C001", "name": "John Kennedy", "major":"Politics", "gpa": 4.2, "yearOfBorn": 2000, "classOf": 2016,  "interest": "talking, dating, boxing, shooting, chess"}
{"index":{"_index":"stu","_type":"doc","_id":"4"}}
{"id": 4, "studentNo": "BU-POLI-2015-C001", "name": "John Kerry",  "major":"Politics", "gpa": 4.1, "yearOfBorn": 1999, "classOf": 2015,  "interest": "money, basketball"}
{"index":{"_index":"stu","_type":"doc","_id":"5"}}
{"id": 5, "studentNo": "BU-ARTS-2016-C002", "name": "Da Vinci",  "major":"Arts", "gpa": 4.8, "yearOfBorn": 1995, "classOf": 2016,  "interest": "drawing, music, wine"}
````



## 3、查询语句

```
POST > http://192.168.56.110:9200/stu/doc/_search
{
	"query":{
		"bool":{
			"must":[
				{"match":{
					"name":"John"
					}
				},
			{"range":{
				"classOf":{
					"gte":2016
					}	
				}
			},
			{"match":{
				"interest":"boxing"
				}
			}
			]
		}
	}
}
```



## 4、结果

```
{
    "took": 129,
    "timed_out": false,
    "_shards": {
        "total": 5,
        "successful": 5,
        "skipped": 0,
        "failed": 0
    },
    "hits": {
        "total": 1,
        "max_score": 1.5753641,
        "hits": [
            {
                "_index": "stu",
                "_type": "doc",
                "_id": "3",
                "_score": 1.5753641,
                "_source": {
                    "id": 3,
                    "studentNo": "BU-POLI-2016-C001",
                    "name": "John Kennedy",
                    "major": "Politics",
                    "gpa": 4.2,
                    "yearOfBorn": 2000,
                    "classOf": 2016,
                    "interest": "talking, dating, boxing, shooting, chess"
                }
            }
        ]
    }
}
```




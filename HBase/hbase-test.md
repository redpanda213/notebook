1、code

```hbase
create_namespace 'mydemo'
```

```hbase
create 'mydemo:userinfos','bases'
```

```hbase
put 'mydemo:userinfos','user_1','bases:name','zhangsan'
```

```hbase
scan 'mydemo:userinfos'
```

```hbase

```



> 胖包，将java类以及所依赖的类全部打包
>
> 瘦包：仅打包java类

2、package jar

吼吼吼



3、分析

```
create external table userinfos(
id string,
name string
)
stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
with serdeproperties('hbase.columns.mapping'=':key,bases:name')
tblproperties('hbase.table.name'='mydemo:userinfos');
```

> 映射表不启动reduce只启动map
>
> 但凡动元信息需要进行映射信息的就要用到map
>
> 

```
log>>
Moving data to: hdfs://elk-2:9000/user/hive/warehouse/mydemo.db/.hive-staging_hive_2019-09-20_05-17-58_829_4334679673916611626-1/-ext-10001

```

.hive-...是要给临时文件，先将userinfos转存成.hive 再转成目标文件
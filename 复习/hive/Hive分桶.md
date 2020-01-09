Hive分桶

**创建分桶表语句**

```sql
create table stu_buck(id int,name string)
clustered by(id)
into 4 buckets
row format delimited terminated by '\t';
```

**注意：**

```
load data local inpath '/opt/data/student.txt' into table stu_buck;
此方法无效，插入依旧不分区，因为相当于使用的是put命令，无法分桶。直接放上来一个文件。
```

```
1001    ss1
1002    ss2
1003    ss3
1004    ss4
1005    ss5
1006    ss6
1007    ss7
1008    ss8
1009    ss9
1010    ss10
1011    ss11
1012    ss12
1013    ss13
1014    ss14
1015    ss15
1016    ss16
```



**方法：**

可以先创建一个普通表，load数据，然后再利用子查询插入到新表。

```sql
create table stu(id int,name string)
row format delimited terminated by '\t';

load data local inpath '/opt/data/student.txt' into table stu;

--注意此处需要设置属性，否则还是无法分桶。
set hive.enforce.bucketing=true;
set mapreduce.job.reduces=-1

insert into table stu_buck select * from stu;

select * from stu_buck;
```

```
查询结果：
1012	ss12
1008	ss8
1016	ss16
1004	ss4

1001	ss1
1005	ss5
1013	ss13
1009	ss9

1010	ss10
1002	ss2
1014	ss14
1006	ss6

1003	ss3
1011	ss11
1015	ss15
1007	ss7
```



**分桶查询**

```sql
select * from stu_buck tablesample(bucket 1 out of 4 on id);
```

```
1012	ss12
1008	ss8
1016	ss16
1004	ss4
```

```sql
select * from stu_buck tablesample(bucket 2 out of 4 on id);
```

```
1001	ss1
1005	ss5
1013	ss13
1009	ss9
```

```
select * from stu_buck tablesample(bucket x out of y on id);
```

x表示从第x个桶开始取数据，y表示取y个桶

例如 x=1，y=4，即从第1个桶开始取数据，取y/(桶数)=4/4=1，取1个桶。

例如 x=2，y=4，即从第2个桶开始取数据，取y/(桶数)=4/4=1，取1个桶。

例如 x=1，y=2，即从第1个桶开始取数据，取y/(桶数)=2/4=1/2，取1/2个桶。

例如 x=1，y=8，即从第1个桶开始取数据，取y/(桶数)=8/4=2，取2个桶。

错误用法：

例如 x=4，y=8，即从第4个桶开始取数据，取y/(桶数)=8/4=2，取2个桶。

因为第4个桶已经是最后一个桶了，没办法再取两个桶了，所有会报错

```
FAILED: SemanticException [Error 10061]: Numerator should not be bigger than denominator in sample clause for table stu_buck
```


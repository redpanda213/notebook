## Hive查询

### select

- 映射符合指定查询条件的行
- hive select 是数据库标准sql的子集

### CTE和嵌套查询

CTE ---- command table 

```
with t1 as (select...) select * from t1
```

### 进阶语句

- 列匹配正则表达式

```
set hive.support.quoted.identifiers = more;
select `^o.*` from offers;
```

- 虚拟列

```

```



### 关联查询hive join

- join用于将两个或多个表中的行组合在查询

- hive仅支持等值连接
  - inner join 内连接
  - outer join 外连接 right join、left join、full outer join
  - implicit join  隐式连接
  - cross join  交叉连接 

## Hive集合操作

**union**

- 所有子集数据必需具有相同的名称和类型
  - union all：
  - union：

## Hive装载、移动数据

**load**

```hive
load data local inpath '原始数据的位置' overwrite into table employee;
```

**insert  [overwrite覆盖    |     into追加]**

```
create table test(name string,age int);

insert into table test(name) values('zhang'),('wang');
insert into employee(name) select name from test limit 1;


```



```
--从同一数据源插入本地文件，hdfs文件，表
from ctas_employee
insert overwrite local directory '路径' select *;
insert overwrite directory '路径'  select *;
insert overwrite table employee_internal select *;

```

## Hive数据交换

**import|export**

```
export table employee to '';
export table employee_partitioned partition(year=2019,month=3) to '';
```

```
import table employee from '';
import table employee_partitioned partition(year=2019,month=3) from '';
```

## Hive数据排序

**order by**

- order by类似于标准sql

  - 只是用一个reduce执行全局数据排序

  - 速度慢，应提前做好数据过滤

  - 支持使用case、when或表达式

  - 支持按位置编号排序

    - `set hive.group.orderby.position.alias=true;`

    ```
    select * from offers order by case when offerid = 1 then 1 else 0 end;
    ```

> 如何把查询到的null结果放在最后
>
> select nvl(age,100) from stu;  --用到了一个函数nvl

**sort by  | distribute by**

- sort by对每个reducer中的数据进行排序
  - 当reducer数量设置为1 时，等于order by
  - 排序列必需出现在select column列表中
- distribute by类似于标准sql中的group by
  - 确保具有匹配列值的行被分区到相同的reducer
  - 不会对每个reducer的输出进行排序
  - 通常使用在sort by 语句之前

```
select department_id,name,employee_id,evaluation score
from employee_hr
distribute by department_id sort by evaluation_score DESC;
```

设置分区个数

```
set mapred.reduce.tasks
set mapred.reduce.tasks=3
```

select * from employee_contract sort by 

**cluster by**

相同于sort by + distribute by



## Hive聚合运算

**grouping sets**

- 实现对统一数据集进行多重group by操作
- 本质时多个group by进行union all 操作

```
select a,b,sum(c) from tab1 group by a,b grouping sets((a,b))

select a,b,sum(c) from tab1 group by a,b
```

**group by with cube|rollup**

- cube
- rollup：

> 
>
> Unable to determine if hdfs://elk-2:9000/user/hive/warehouse/mydemo.db/employee_partitioned is encryed

**having**


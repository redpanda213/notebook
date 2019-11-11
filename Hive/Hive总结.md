# Hive总结

1、运行原理

2、UDF

3、宏

- 可以看作是一个简短的函数，或者是一个表达式取别名。
- 适用于做分析时为一些临时需要用到很多次的表达式做一个封装娶个简短的别名，以便调用
- 宏指在当前会话有效
- 若永久保存，则可以讲其加入到${HIVE_HOME}/.hiverc

创建宏

```sql
create temporary macro fixed_number() 42;
select fixed_number();

create tempprary macro simple_add(x int,y int) x+y;
select simple_add(1,1);
```

删除宏

```sql
drop temporary macro [if exists] macro_name;
```


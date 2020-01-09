Hive时间函数

```sql
--日期格式化
select date_format('2020-02-02','yyyy-MM-dd');
--日期加
select date_add('2020-02-02',5);
--日期减
select date_sub('2020-02-02',5);
--两个日期相减
select datediff('2020-02-02','2020-02-01'); 
```



替换

```
select regexp_replace('2020/02/02','/','-');
```


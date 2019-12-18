 `You can't specify target table 'Person' for update in FROM clause`

出现此错误，是因为Mysql中不允许在select一张表时，同时对这张表进行update。

或者说子查询不能直接引用外层查询的同一张表。

解决方法：用select as 生成一张临时表。

```sql
-- mistake example:
delete from person where (select min(id) as id from person group by Email);
-- correct：
delete from person 
where (
    select id from (
        select min(id) as id from person group by Email) as temp
)
```


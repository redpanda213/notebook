# mysql导入导出

1、导出整个数据库

在命令行

```shell
mysqldump -u 用户名 -p 数据库名 > 导出的文件名
#例如
mysqldump -u root -p dbname > dbname.sql
```

2、导出一个表

```shell
mysqldump -u 用户名 -p 数据库名 表明 > 导出的文件名
#例如
mysqldump -u root -p dbname 
```

3、导出一个数据库结构

```shell
mysqldump -u root -p -d --add-table dbname > d:/dbname_db.sql
```

4、导出

```sql
select * from orders into outfile '/var/lib/mysql-files/retail_db/orders.' csv' fields terminated by ',' enclosed by '"' lines terminated by '\n';

```


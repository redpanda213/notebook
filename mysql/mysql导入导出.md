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


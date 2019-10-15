

# Mysql修改中文乱码

(1.SHOW VARIARBLES LIKE 'character%';

(2.修改配置文件

```
vi /etc/my.cnf
[client]
default-character-set=utf8
[mysqld]
character-set-server=utf8
collation-server=utf8_unicode_ci
```

(3.重启mysql

```
systemctl restart mysql.service
```

# Mysql导出/导入文件

```
$ mysqldump -uroot -pok '数据库名' > '数据库名'.sql
mysql>source /root/'数据库名'.sql
```

# Excel生成随机数

```
=CHAR(INT(RAND()*2)*32+RANDBETWEEN(65,90))&RANDBETWEEN(10000,99999)
```

# 数据清洗去除相同username和某列为空的人

```mysql
creat table cp_user as select max(userid) usid,username,max(birthday) birthday from (select * from userinfos where username !='' and birthday !='') uss group by username order by (userid+0) ；
```

```mysql
creat view view_user as select max(userid) usid,username,max(birthday) birthday from (select * from userinfos where username !='' and birthday !='') uss group by username order by (userid+0)
```


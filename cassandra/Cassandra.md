# Cassandra

- Apache Cassandra 是一个分布式数据库，可以管理大数据量的数据
  - 分布式、分区的行存储

## Cassandra Keyspaces

- A keuspace
  - 一个最外层的容器或者集群，像一个关系型数据库或者模式
  - 在nodes上定义数据副本
    - Column Families - 是一个容器

### create keyspaces

```
#查看keyspace
describe keyspaces
#创建keyspace
create keyspace patient with replication = {'class':'SimpleStrategy','replication_factor':1};
```

## Column Family

- 列族(column family)是列的有序集合
  - 一个列是基于数据结构
  - 构建的

> column  family 相当于一张表
>
> 与传统关系型数据库的创建方式相同，但是实际存储方式不同

### create tables

```
create table patient.exam(id int,patient_id int,date teimeuuid,detail text,primary key(id));

create table patient.exam(id int,patient_id int,data timeuuid,detail text,primary key(id,patient_id)) with clustering order by (patient_id ASC);
#其中，id可以设置为分区依据，而patient_id可以设置为分区内的排序依据
```

## Static Columns

`静态列`

- 使列中的某个单个值变成静态的

```
create table teamember_by_team(
teamname text,
manager text static,
location text static,
memebername text,
nationlity text,
positon text,
primary key((teamname),membername)
);
```

- 限制/局限性
  - 一个表在至少设置一个clustering key时，才能包含static columns
  - 

## Materialized Views

- Restrictions
  - 必须包括原始表中的primary key
  - 在原表的primary key基础上只可至多添加一个key
  - key 列不能有空值

```
create materialized view mv_birthday_country as select birthday,name,country from players where birthday is not null and id is not null primary key(birthday,id)
```

## Data Types

## CQL Commands

- Alter Keyspace

- Drop keyspace

- Compound keys & clustering

- Alter table

  ```
  alter table demo.teams alter id type uuid;
  alter table demo.players add first_name text;
  alter table demo.calender add events list<text>;
  alter table demo.
  ```

  

- Truncate table
- Drop table



```
create index user_state on demo.users(state);
create index on demo.users(zip);

alter table users add phones set<text>;
--index on set
create index on users(phones);

alter table users add title map<text,text>;
--index on map keys
create index on users(keys(titles));
```

## SQL Functions

```CQL
create or replace funtion cycling.flog(input double)
called on null input
returns double language java as 
'return Double.valueOf(Math.log(input.doubleValue()));';


create funtion if not exists cycling.flog(input double)
return null on null input
return double language java as 

```

```CQL
CREATE FUNCTION my_sin(input double)
	RETURNS double LANGUAGE java
	BODY
		return input == null ? null
```




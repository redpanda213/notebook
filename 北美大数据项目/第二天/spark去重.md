# spark去重

## 1、dataframe

### 1.1 distinct

```scala
val df = spark.read.format("csv").option("header","true").load("file:///root/dis.csv")

df.distinct.show
```

## 2、rdd

### 2.1  reduceBykey
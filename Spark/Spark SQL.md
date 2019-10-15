# Spark SQL

## 运行原理

- 核心是Catalyst优化器

Catalyst Optimizer:将逻辑计划转为物理计划

- Frontend
  - SQL Query
  - DataFrame
- Catalyst
  - Unresolved Logical Plan
  - Logical Plan
  - Optimized Logical Plan

> 语句投影
>
> val df  = spark.read.json(" ")
>
> df.select("name").show()
>
> df.filter()满足条件的留下
>
> df.where()满足条件的删除

```scala
object MyTools{
    def getWeek(time:String):Int={
        import java.util.Calendar
        import java.text.SimpleDateFormat
        val sdf = new SimpleDateFormat("yyyy-MM-dd")
        val cal = Calendar.getInstance()
        cal.setTime(sdf.parse(time))
        cal.get(Calendar.DAY_OF_WEEK)
    }
}
```


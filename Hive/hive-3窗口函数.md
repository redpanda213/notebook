## 窗口函数

### 概述

- 窗口函数是一组特殊函数

  - 扫描多个输入行来计算每个输出值，为每行数据生成一行结果
  - 可以通过窗口函数来实现是复杂的计算和聚合

- 语法

  ```
  Function(arg1,...,arg n) over ([partition by <...>][order by<...>][<window_clause>])
  ```

  - partition by 类似于group by，未指定则按整个结果集
  - 只有指定group by子句之后才能进行窗口定义
  - 可同时使用多个窗口函数
  - 过滤窗口函数计算结必须在外面一层

- 按功能可划为：排序、聚合、分析

### 排序

> 在一个分区或者group内排序，并输出序号。
>
> 相当于每个班级内学生的排名，
>
> 全局排序则是学生年级排名

**ROW_NUMBER()**: 对所有数值输出不同的序号，序号

**RANK()**:并列第一，第二名，第三名---->(1,1,3,4) 对相同数值输出相同序号，下一个序号跳过

**DENSE_RANK()**:并列第一，第二名，第三名---->(1,1,2,3)对相同数值输出相同序号，下一个序号连续

PERCEN_RANK():(目前排名-1)/(总行数-1)，值相对于一组值的百分比排名

NTILE(n):group 内分成n个桶

### 聚合

```sql
SELECT 
name, dept_num, salary,
COUNT(*) OVER (PARTITION BY dept_num) AS row_cnt,
SUM(salary) OVER(PARTITION BY dept_num ORDER BY dept_num) AS deptTotal,
SUM(salary) OVER(ORDER BY dept_num) AS runningTotal1, 
SUM(salary) OVER(ORDER BY dept_num, name rows unbounded preceding) AS runningTotal2,
AVG(salary) OVER(PARTITION BY dept_num) AS avgDept,
MIN(salary) OVER(PARTITION BY dept_num) AS minDept,
MAX(salary) OVER(PARTITION BY dept_num) AS maxDept
FROM employee_contract
ORDER BY dept_num, name;
```



**count()**:

**sum()**

**avg()**

**max()/min()**

### 分析

**cume_dist**:小于等于当前值的行数/分组内总行数

**lead/lag(col,n)**：某一列进行往前/后第n行值（n可选，默认为1）

**first_value**:对该列到目前为止的首个值

**last_value**：当目前为止的最后一个值

### 窗口定义

- 支持两类窗口定义
  - 行类型窗口：根据当前行之前或之后的行号确定的窗口
    - ROWS BETWEEN < start_expr > AND < end expr>
    - start_expr可以为下列值：
      - UNBOUNDED PRECEDING:窗口起始位置（分组第一行）
      - CURRENT ROW ：当前行
      - N PRECEDING/FOLLOWING：当前行之前/之后n行
    - end_expr可以为下列值：
      - UNBOUNDED PRECEDING:窗口结束位置（分组最后一行）
      - CURRENT ROW ：当前行
      - N PRECEDING/FOLLOWING：当前行之前/之后n行
  - 范围窗口：取分组内的值在指定范围区间内的行
    - 该范围值/区间必须是数字或日期类型
    - 目前只支持一个order by列


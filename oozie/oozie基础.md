# oozie

- 工作流程执行引擎或者Hadoop调度器（工作流程的执行和定时）
  - 如Java MapReduces
  - Spark（Streaming）
  - Hive jobs
- 顶级apache项目
- jh

## Installing Oozie

1、

```
wget http://archive.apache.org/dist/oozie/4.2.0/oozie-4.2.0.tar.gz

tar –xzvf <PATH_TO_OOZIE_TAR>

bin/oozie-setup.sh -hadoop 0.20.200 ${HADOOP_HOME} –extjs /tmp/ext-2.2.zip

bin/oozie-start.sh

bin/oozie admin -oozie http://localhost:11000/oozie -status
```

## Oozie 架构

- 执行HTTP服务
  - 由提交工作流提供一种客户端交互
  - 工作流可以被立刻或稍后执行
- 工作流程用XML定义
  - 替代了用JAVA代码来实现工具接口和继承配置类
- 4中方法来访问oozie
  - CML
  - JAVA API
  - Rest API
  - Web UI

## Oozie 组件

- 工作流程定义
- 参数文件 property
- 库 libraries
- 协调器 coordinator
- 包 bundler

### components relationship

- 一个bundler包含一个至多个coordinator
- 一个coordinator 包含一个至多个 workflow
- 一个workflow 包含一个至多个action
- 一个workflow也包含零个至多个sub-workflow子工作流程

### components in layer view

![image-20191202093933370](D:\笔记\oozie\photo\image-20191202093933370.png)

## Oozie pros 优点

- Great community support 
- Integrated with HUE, Cloudera Manager, Apache Ambari 
- HCatalog integration 
- SLA alerts (new in Oozie 4) 
- Ecosystem support: Pig, Hive, Sqoop, etc. 
- Very detailed documentation
- Launcher jobs as map tasks

## Oozie cons 缺点

## Workflow State Transition

![image-20191202115310880](D:\笔记\oozie\photo\image-20191202115310880.png)


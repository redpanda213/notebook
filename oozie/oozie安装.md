1、`http://archive.cloudera.com/cdh5/cdh/5/oozie-4.1.0-cdh5.14.2.tar.gz`

2、` http://archive.cloudera.com/gplextras/misc/ `







注意

oozie需要  hadoop 开启 historyserver

1、在 mapreduce-site.xml 配置如下

```
<configuration>
        <property>
                <name>mapreduce.framework.name</name>
                <value>yarn</value>
        </property>
        <property>
                <name>mapreduce.jobtracker.address</name>
                <value>192.168.56.110:8032</value>
                <description>jobTracker`s address</description>
        </property>
        <property>
                <name>mapreduce.jobhistory.address</name>
                <value>192.168.56.110:10020</value>
        </property>
</configuration>

```

2、 启动

hadoop/sbin/mr-jobhistory-daemon.sh start historyserver


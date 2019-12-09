# Flume

```shell
cd flume/conf
cp flume-env.sh.template flume-env.sh
#配置JAVA_HOME
```



```
vi control.conf

wt.sources=s1
wt.sinks=k1
wt.channels=c1

wt.sources.s1.type=netcat
wt.sources.s1.port=55555
wt.sources.s1.bind=localhost

wt.sinks.k1.type=logger

wt.channels.c1.type=memory
wt.channels.c1.capacity=1000
wt.channels.c1.transactionCapacity=100

wt.sources.s1.channels=c1
wt.sinks.k1.channel=c1
```

```shel
wget http://vault.centos.org/6.6/os/x86_64/Packages/nc-1.84-22.el6.x86_64.rpm
rpm -iUv nc-1.84-22.el6.x86_64.rpm
```

```shell
flume/bin/flume-ng agent -n wt -c /opt/bigdata/flume160/conf/ -f /opt/bigdata/flume160/conf/control.conf -Dflume.root.logger=INFO,console

```



设置wt1.sources.s2.deserializer.maxLineLength=120000  此项之前应先查看文件最长行

```shell
wc -L /opt/data/event.csv

#107513 /opt/data/event_attendees.csv

```



```
wt1.sources=s2
wt1.sinks=k2
wt1.channels=c2

wt1.sources.s2.type=spooldir
wt1.sources.s2.spoolDir=/opt/data/event
wt1.sources.s2.deserializer.maxLineLength=120000
wt1.sources.s2.batchSize=500
wt1.sources.s2.interceptors=head_filter
wt1.sources.s2.interceptors.head_filter.type=regex_filter
wt1.sources.s2.interceptors.head_filter.regex=^(\s*)event(\s*,\s*)yes(\s*,\s*)maybe(\s*,\s*)invited(\s*,\s*)no(\s*)$
wt1.sources.s2.interceptors.head_filter.excludeEvents=true

wt1.sinks.k2.type=org.apache.flume.sink.kafka.KafkaSink
wt1.sinks.k2.kafka.topic=event
wt1.sinks.k2.kafka.bootstrap.servers=127.0.0.1:9092
wt1.sinks.k2.kafka.flumeBatchSize=500

wt1.channels.c2.type=file
wt1.channels.c2.checkpointDir=/opt/data/flume/eack
wt1.channels.c2.dataDirs=/opt/data/flume/eadp

wt1.sources.s2.channels=c2
wt1.sinks.k2.channel=c2

```


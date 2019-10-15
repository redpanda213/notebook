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


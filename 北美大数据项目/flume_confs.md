```shell
#Users
kafka-topics.sh --zookeeper sandbox.hortonworks.com:2181 --create --topic users --partitions 1 --replication-factor 1
#User_Friends
kafka-topics.sh --zookeeper sandbox.hortonworks.com:2181 --create --topic user_friends_raw --partitions 2 --replication-factor 1
kafka-topics.sh --zookeeper sandbox.hortonworks.com:2181 --create --topic user_friends --partitions 3 --replication-factor 1
#Events
kafka-topics.sh --zookeeper sandbox.hortonworks.com:2181 --create --topic events --partitions 3 --replication-factor 1
#Event_Attendees
kafka-topics.sh --zookeeper sandbox.hortonworks.com:2181 --create --topic event_attendees_raw --partitions 3 --replication-factor 1
kafka-topics.sh --zookeeper sandbox.hortonworks.com:2181 --create --topic event_attendees --partitions 3 --replication-factor 1
#Train
kafka-topics.sh --zookeeper sandbox.hortonworks.com:2181 --create --topic train --partitions 1 --replication-factor 1
#Test
kafka-topics.sh --zookeeper sandbox.hortonworks.com:2181 --create --topic test --partitions 1 --replication-factor 1

```







## users.conf

```conf
users.sources=usersSource
users.channels=usersChannel
users.sinks=usersSink

users.channels.usersChannel.type=file
users.channels.usersChannel.checkpointDir=/var/flume/checkpoint/users
users.channels.usersChannel.dataDirs=/var/flume/data/users

users.sources.usersSource.type=spooldir
users.sources.usersSource.deserializer=LINE
users.sources.usersSource.deserializer.maxLineLength=6400
users.sources.usersSource.spoolDir=/events/input/intra/users
users.sources.usersSource.includePattren=users_[0-9]{4}-[0-9]{2}-[0-9]{2}.csv
users.sources.usersSource.channels=usersChannel
users.sources.usersSource.interceptors=head_filter
users.sources.usersSource.interceptors.head_filter.type=regex_filter
users.sources.usersSource.interceptors.head_filter.regex=^(\s*)user_id(\s*,\s*)locale(\s*,\s*)birthyear(\s*,\s*)gender(\s*,\s*)joinedAt(\s*,\s*)location(\s*,\s*)timezone(\s*)$
users.sources.usersSource.interceptors.head_filter.excludeEvents=true

users.sinks.usersSink.type=org.apache.flume.sink.kafka.KafkaSink
users.sinks.usersSink.batchSize=640
users.sinks.usersSink.brokerList=127.0.0.1:9092
users.sinks.usersSink.topic=users
users.sinks.usersSink.channel=usersChannel
```

## events.conf

```conf
events.channels=eventsChannel
events.sinks=eventsSink
events.sources=eventsSource

events.channels.eventsChannel.type=file
events.channels.eventsChannel.checkpointDir=/var/flume/checkpoint/events
events.channels.eventsChannel.dataDirs=/var/flume/data/events

events.sources.eventsSource.type=spoolDir
events.sources.eventsSource.batchSize=500
events.sources.eventsSource.deserializer=LINE
events.sources.eventsSource.deserializer.maxLinelength=32000
events.sources.eventsSource.spoolDir=/events/input/intra/events
events.sources.eventsSource.interceptors=head_filter
events.sources.eventsSource.interceptors.head_filter.type=regex_filter
events.sources.eventsSource.interceptors.head_filter.regex=^(\s*)event_id(\s*,\s*)user_id(\s*,\s*)start_time(\s*,\s*)city(\s*,\s*)state(\s*,\s*)zip(\s*,\s*)country(\s*,\s*)lat(\s*,\s*)lng(\s*,\s*).*$
events.sources.eventsSource.interceptors.head_filter.excludeEvents=true

events.sinks.eventsSink.type=org.apache.flume.sink.kafka.KafkaSink
events.sinks.eventsSink.kafka.bootstrap.servers=127.0.0.1:9092
events.sinks.eventsSink.kafka.topic=events
events.sinks.eventsSink.kafka.flumeBatchSize=500


events.sinks.eventsSink.channel=eventsChannel
events.sources.eventsSource.channels=eventsChannel

```

## event_attendees.conf

```conf
eventa.sources=eventaSource
eventa.channels=eventaChannel
eventa.sinks=eventaSink

eventa.channels.eventaChannel.type=file
eventa.channels.eventaChannel.checkpointDir=/var/flume/checkpoint/eventa
eventa.channels.eventaChannel.dataDirs=/var/flume/data/eventa

eventa.sources.eventaSource.type=spooldir
eventa.sources.eventaSource.deserializer=LINE
eventa.sources.eventaSource.deserializer.maxLineLength=128000
eventa.sources.eventaSource.spoolDir=/events/input/intra/eventa
eventa.sources.eventaSource.interceptors=head_filter
eventa.sources.eventaSource.interceptors.head_filter.type=regex_filter
eventa.sources.eventaSource.interceptors.head_filter.regex=^(\s*)event(\s*,\s*)yes(\s*,\s*)maybe(\s*,\s*)invited(\s*,\s*)no(\s*)$
eventa.sources.eventaSource.interceptors.head_filter.excludeEvents=true


eventa.sinks.eventaSink.type=org.apache.flume.sink.kafka.KafkaSink
eventa.sinks.eventaSink.batchSize=640
eventa.sinks.eventaSink.brokerList=127.0.0.1:9092
eventa.sinks.eventaSink.topic=event_attendees_raw

eventa.sinks.eventaSink.channel=eventaChannel
eventa.sources.eventaSource.channels=eventaChannel
```

## user_friends.conf

```
uf.sources=ufSource
uf.channels=ufChannel
uf.sinks=ufSink

uf.channels.ufChannel.type=file
uf.channels.ufChannel.checkpointDir=/var/flume/checkpoint/uf
uf.channels.ufChannel.dataDirs=/var/flume/data/uf

uf.sources.ufSource.type=spooldir
uf.sources.ufSource.deserializer=LINE
uf.sources.ufSource.deserializer.maxLineLength=100000
uf.sources.ufSource.spoolDir=/events/input/intra/uf
uf.sources.ufSource.interceptors=head_filter
uf.sources.ufSource.interceptors.head_filter.type=regex_filter
uf.sources.ufSource.interceptors.head_filter.regex=^(\s*)user(\s*,\s*)friends(\s*)$
uf.sources.ufSource.interceptors.head_filter.excludeEvents=true


uf.sinks.ufSink.type=org.apache.flume.sink.kafka.KafkaSink
uf.sinks.ufSink.batchSize=640
uf.sinks.ufSink.brokerList=127.0.0.1:9092
uf.sinks.ufSink.topic=user_friends_raw

uf.sinks.ufSink.channel=ufChannel
uf.sources.ufSource.channels=ufChannel
 
```





## train.conf

```conf
train.sources=trainSource
train.channels=trainChannel
train.sinks=trainSink

train.channels.trainChannel.type=file
train.channels.trainChannel.checkpointDir=/var/flume/checkpoint/train
train.channels.trainChannel.dataDirs=/var/flume/data/train

train.sources.trainSource.type=spooldir
train.sources.trainSource.deserializer=LINE
train.sources.trainSource.deserializer.maxLineLength=500
train.sources.trainSource.spoolDir=/events/input/intra/train
train.sources.trainSource.interceptors=head_filter
train.sources.trainSource.interceptors.head_filter.type=regex_filter
train.sources.trainSource.interceptors.head_filter.regex=^(\s*)user(\s*,\s*)event(\s*,\s*)invited(\s*,\s*)timestamp(\s*,\s*)interested(\s*,\s*)not_interested(\s*)$
train.sources.trainSource.interceptors.head_filter.excludeEvents=true


train.sinks.trainSink.type=org.apache.flume.sink.kafka.KafkaSink
train.sinks.trainSink.batchSize=640
train.sinks.trainSink.brokerList=127.0.0.1:9092
train.sinks.trainSink.topic=train

train.sinks.trainSink.channel=trainChannel
train.sources.trainSource.channels=trainChannel
```



users  : 38209

events : 1045991+1045990+1045991  

event_attendees_raw : 8048+8048+8048 = 38244

user_friends_raw : 19101+19101 = 38202

tarin :  15398

user_friends: 10253012+9943855+10189536=30,386,403‬

event_attendees:3797473+3894076+3567093=11,258,642

```shell
java -jar kafka_trans.jar com.victory.kafka_trans.Driver com.victory.kafka_trans.kafka.stream.UserFriendsStreamer


```

```shell
kafka-streams-application-reset.sh --zookeeper 127.0.0.1:2181 --bootstrap-servers 127.0.0.1:9092 --application-id uf --input-topics user_friends_raw

```




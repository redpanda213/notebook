-- add the mongo connector & driver jars
add jar hdfs://sandbox-hdp.hortonworks.com:8020/events/mongo/mongo-hadoop-core-2.0.2.jar;
add jar hdfs://sandbox-hdp.hortonworks.com:8020/events/mongo/mongo-hadoop-hive-2.0.2.jar;
add jar hdfs://sandbox-hdp.hortonworks.com:8020/events/mongo/mongodb-driver-3.9.1.jar;
add jar hdfs://sandbox-hdp.hortonworks.com:8020/events/mongo/mongo-java-driver-3.9.1.jar;

-- set runtime parameters
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.optimize.sort.dynamic.partition=true;
SET hive.auto.convert.join=false;

-- create database if not exists
CREATE DATABASE IF NOT EXISTS events;
-- the current database
SET hivevar:db=events;

-- users collection
DROP TABLE IF EXISTS ${db}.mg_users;
CREATE EXTERNAL TABLE ${db}.mg_users(
  user_id STRING, 
  locale STRING, 
  birth_year STRING, 
  gender STRING, 
  joined_at STRING, 
  location STRING, 
  time_zone STRING
)
STORED BY 'com.mongodb.hadoop.hive.MongoStorageHandler'
WITH SERDEPROPERTIES('mongo.columns.mapping'='{ "user_id":"user_id", "locale": "region.locale", "birth_year":"profile.birth_year", "gender":"profile.gender", "joined_at":"registration.joined_at", "location":"region.location", "time_zone":"region.time_zone" }')
TBLPROPERTIES('mongo.uri'='mongodb://it21:password@192.168.21.11:27017/events_db.users');
-- local copy of the users collection
DROP TABLE IF EXISTS ${db}.users;
-- create table users
CREATE TABLE ${db}.users
STORED AS ORC AS
    SELECT * FROM ${db}.mg_users;
-- remove the temp collection
DROP TABLE IF EXISTS ${db}.mg_users;

-- the events collection
DROP TABLE IF EXISTS ${db}.mg_events;
CREATE EXTERNAL TABLE ${db}.mg_events(
  event_id STRING, 
  start_time STRING, 
  city STRING, 
  state STRING, 
  zip STRING, 
  country STRING, 
  latitude STRING, 
  longitude STRING, 
  user_id STRING, 
  common_words STRING
)
STORED BY 'com.mongodb.hadoop.hive.MongoStorageHandler'
WITH SERDEPROPERTIES('mongo.columns.mapping'='{ "event_id":"event_id", "start_time": "schedule.start_time", "city":"location.city", "state":"location.state", "zip":"location.zip", "country":"location.country", "latitude":"location.lat", "longitude":"location.lng", "user_id":"creator.user_id", "common_words":"remark.common_words" }')
TBLPROPERTIES('mongo.uri'='mongodb://it21:password@192.168.21.11:27017/events_db.events');
-- the local copy of the events collection
DROP TABLE IF EXISTS ${db}.events;
-- create the events table
CREATE TABLE ${db}.events
STORED AS ORC AS
    SELECT * FROM ${db}.mg_events;
-- remove the temp collection
DROP TABLE IF EXISTS ${db}.mg_events;

-- the user_friend collection
DROP TABLE IF EXISTS events.mg_user_friend;
CREATE EXTERNAL TABLE events.mg_user_friend(
  user_id STRING, 
  friend_id STRING
)
STORED BY 'com.mongodb.hadoop.hive.MongoStorageHandler'
WITH SERDEPROPERTIES('mongo.columns.mapping'='{ "user_id":"user_id", "friend_id": "friend_id" }')
TBLPROPERTIES('mongo.uri'='mongodb://it21:password@192.168.21.11:27017/events_db.user_friend');
-- the local copy of the user_friend collection
DROP TABLE IF EXISTS ${db}.user_friend;
-- create user_friend table
CREATE TABLE ${db}.user_friend
STORED AS ORC AS
    SELECT * FROM ${db}.mg_user_friend;
-- remove the temp collection
DROP TABLE IF EXISTS ${db}.mg_user_friend;

-- the event_attendee collection
DROP TABLE IF EXISTS events.mg_event_attendee;
CREATE EXTERNAL TABLE events.mg_event_attendee(
  event_id STRING, 
  user_id STRING, 
  attend_type STRING
)
STORED BY 'com.mongodb.hadoop.hive.MongoStorageHandler'
WITH SERDEPROPERTIES('mongo.columns.mapping'='{ "event_id":"event_id", "user_id":"user_id", "attend_type":"attend_type" }')
TBLPROPERTIES('mongo.uri'='mongodb://it21:password@192.168.21.11:27017/events_db.event_attendee');
-- the local copy of the event_attendee collection
DROP TABLE IF EXISTS ${db}.event_attendee;
-- create event_attendee table
CREATE TABLE ${db}.event_attendee
STORED AS ORC AS
    SELECT * FROM ${db}.mg_event_attendee;
-- remove the temp collection
DROP TABLE IF EXISTS ${db}.mg_event_attendee;

-- the train collection
DROP TABLE IF EXISTS events.mg_train;
CREATE EXTERNAL TABLE events.mg_train(
  user_id STRING, 
  event_id STRING, 
  invited STRING, 
  time_stamp STRING, 
  interested STRING
)
STORED BY 'com.mongodb.hadoop.hive.MongoStorageHandler'
WITH SERDEPROPERTIES('mongo.columns.mapping'='{ "user_id":"user", "event_id":"event", "invited":"invited", "time_stamp":"time_stamp", "interested":"interested" }')
TBLPROPERTIES('mongo.uri'='mongodb://it21:password@192.168.21.11:27017/events_db.train');
-- the local copy of the train collection
DROP TABLE IF EXISTS ${db}.train;
-- create train table
CREATE TABLE ${db}.train
STORED AS ORC AS
    SELECT * FROM ${db}.mg_train;
-- remove the temp collection
DROP TABLE IF EXISTS ${db}.mg_train;









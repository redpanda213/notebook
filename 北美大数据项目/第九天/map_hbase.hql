-- set runtime parameters
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.optimize.sort.dynamic.partition=true;
SET hive.auto.convert.join=false;

-- create database if not exists
CREATE DATABASE IF NOT EXISTS events;
-- the current database
SET hivevar:db=events;

-- check if users table exists
DROP TABLE IF EXISTS ${db}.hb_users;
-- create users table
CREATE EXTERNAL TABLE ${db}.hb_users(user_id STRING, birth_year INT, gender STRING, locale STRING, location STRING, time_zone STRING, joined_at STRING)
    STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
    WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key, profile:birth_year, profile:gender, region:locale, region:location, region:time_zone, registration:joined_at')
    TBLPROPERTIES ('hbase.table.name' = 'events_db:users');
-- check if users table exists
DROP TABLE IF EXISTS ${db}.users;
-- create table users
CREATE TABLE ${db}.users
STORED AS ORC AS
    SELECT * FROM ${db}.hb_users;
-- remove the temp table
DROP TABLE IF EXISTS ${db}.hb_users;

-- check if events table exists
DROP TABLE IF EXISTS ${db}.hb_events;
-- create events table
CREATE EXTERNAL TABLE ${db}.hb_events(event_id STRING, start_time STRING, city STRING, state STRING, zip STRING, country STRING, latitude FLOAT, longitude FLOAT, user_id STRING, common_words STRING)
    STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
    WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key, schedule:start_time, location:city, location:state, location:zip, location:country, location:lat, location:lng, creator:user_id, remark:common_words')
    TBLPROPERTIES ('hbase.table.name' = 'events_db:events');
-- check if events table exists
DROP TABLE IF EXISTS ${db}.events;
-- create the events table
CREATE TABLE ${db}.events
STORED AS ORC AS
    SELECT * FROM ${db}.hb_events;
-- check if events table exists
DROP TABLE IF EXISTS ${db}.hb_events;

-- check if hb_user_friend table exists
DROP TABLE IF EXISTS ${db}.hb_user_friend;
-- create hb_user_friend table
CREATE EXTERNAL TABLE ${db}.hb_user_friend(row_key STRING, user_id STRING, friend_id STRING)
    STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
    WITH SERDEPROPERTIES('hbase.columns.mapping' = ':key, uf:user_id, uf:friend_id')
    TBLPROPERTIES('hbase.table.name' = 'events_db:user_friend');
-- check if user_friend table exists
DROP TABLE IF EXISTS ${db}.user_friend;
-- create user_friend table
CREATE TABLE ${db}.user_friend
STORED AS ORC AS
    SELECT * FROM ${db}.hb_user_friend;
-- check if hb_user_friend table exists
DROP TABLE IF EXISTS ${db}.hb_user_friend;

-- check if event_attendee table exists
DROP TABLE IF EXISTS ${db}.hb_event_attendee;
-- create event_attendee table
CREATE EXTERNAL TABLE ${db}.hb_event_attendee(row_key STRING, event_id STRING, user_id STRING, attend_type STRING)
    STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
    WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key, euat:event_id, euat:user_id, euat:attend_type')
    TBLPROPERTIES ('hbase.table.name' = 'events_db:event_attendee');
-- check if event_attendee table exists
DROP TABLE IF EXISTS ${db}.event_attendee;
-- create event_attendee table
CREATE TABLE ${db}.event_attendee
STORED AS ORC AS
    SELECT * FROM ${db}.hb_event_attendee;
-- check if event_attendee table exists
DROP TABLE IF EXISTS ${db}.hb_event_attendee;

-- check if train table exists
DROP TABLE IF EXISTS ${db}.hb_train;
-- create train table
CREATE EXTERNAL TABLE ${db}.hb_train(row_key STRING, user_id STRING, event_id STRING, invited STRING, time_stamp STRING, interested STRING)
    STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
    WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key, eu:user, eu:event, eu:invited, eu:time_stamp, eu:interested')
    TBLPROPERTIES ('hbase.table.name' = 'events_db:train');
-- check if train table exists
DROP TABLE IF EXISTS ${db}.train;
-- create train table
CREATE TABLE ${db}.train
STORED AS ORC AS
    SELECT * FROM ${db}.hb_train;
-- check if train table exists
DROP TABLE IF EXISTS ${db}.hb_train;









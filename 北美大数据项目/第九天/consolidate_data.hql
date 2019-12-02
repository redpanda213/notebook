-- set runtime parameters
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.optimize.sort.dynamic.partition=true;
SET hive.auto.convert.join=false;

-- create database if not exists
CREATE DATABASE IF NOT EXISTS events;
-- the current database
SET hivevar:db=events;

-- check if events table exists
DROP TABLE IF EXISTS ${db}.user_friend_count;
-- create user_friend_count table
CREATE TABLE ${db}.user_friend_count 
STORED AS ORC AS
    SELECT
        user_id,
        count(*) AS friend_count
    FROM ${db}.user_friend WHERE friend_id IS NOT NULL AND TRIM(friend_id) != ''
    GROUP BY user_id;

-- check if event_attendee_count table exists
DROP TABLE IF EXISTS ${db}.event_attendee_count;
-- create event_attendee_count table
CREATE TABLE ${db}.event_attendee_count 
STORED AS ORC AS
    SELECT 
        event_id,
        attend_type,
        COUNT(user_id) AS attend_count
    FROM ${db}.event_attendee
    GROUP BY event_id, attend_type;
-- create temporary table - user_attend_status
CREATE TEMPORARY TABLE ${db}.user_attend_status 
STORED AS ORC AS
    SELECT
        t.event_id,
        t.attend_user_id,
        MAX(t.invited) AS invited,
        MAX(t.attended) as attended,
        MAX(t.not_attended) AS not_attended,
        MAX(t.maybe_attended) AS maybe_attended
    FROM (SELECT
            event_id,
            user_id AS attend_user_id,
            CASE WHEN attend_type = 'invited' THEN 1 ELSE 0 END AS invited,
            CASE WHEN attend_type = 'yes' THEN 1 ELSE 0 END AS attended,
            CASE WHEN attend_type = 'no' THEN 1 ELSE 0 END AS not_attended,
            CASE WHEN attend_type = 'maybe' THEN 1 ELSE 0 END AS maybe_attended
        FROM ${db}.event_attendee) t
    GROUP BY event_id, attend_user_id;
-- check if user_attend_event_count table exists
DROP TABLE IF EXISTS ${db}.user_attend_event_count;
-- create user_attend_event_count table
CREATE TABLE ${db}.user_attend_event_count 
STORED AS ORC AS
    SELECT
        attend_user_id AS user_id,
        SUM(invited) AS invited_count,
        SUM(attended) AS attended_count,
        SUM(not_attended) AS not_attended_count,
        SUM(maybe_attended) AS maybe_attended_count
    FROM ${db}.user_attend_status GROUP BY attend_user_id;
-- check if friend_attend_summary table exists
DROP TABLE IF EXISTS ${db}.friend_attend_summary;
-- create friend_attend_summary table
CREATE TABLE ${db}.friend_attend_summary 
STORED AS ORC AS
    WITH friend_attend_status AS
    (
        SELECT
            uf.user_id,
            uf.friend_id,
            uas.event_id,
            CASE WHEN uas.invited IS NOT NULL AND uas.invited > 0 THEN 1 ELSE 0 END AS invited,
            CASE WHEN uas.attended IS NOT NULL AND uas.attended > 0 THEN 1 ELSE 0 END AS attended,
            CASE WHEN uas.not_attended IS NOT NULL AND uas.not_attended > 0 THEN 1 ELSE 0 END AS not_attended,
            CASE WHEN uas.maybe_attended IS NOT NULL AND uas.maybe_attended > 0 THEN 1 ELSE 0 END AS maybe_attended
        FROM ${db}.user_friend uf
            LEFT JOIN ${db}.user_attend_status uas ON uf.friend_id = uas.attend_user_id
    )
    SELECT
        user_id, event_id,
        SUM(invited) AS invited_friends_count,
        SUM(attended) AS attended_friends_count,
        SUM(not_attended) AS not_attended_friends_count,
        SUM(maybe_attended) AS maybe_attended_friends_count
    FROM friend_attend_status
    WHERE event_id IS NOT NULL GROUP BY user_id, event_id;

-- check if locale table exists
DROP TABLE IF EXISTS ${db}.locale;
-- create locale table
CREATE EXTERNAL TABLE ${db}.locale
(
    locale_id INT,
    locale STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LOCATION '/user/events/data/locale';

-- check if time_zone table exists
DROP TABLE IF EXISTS ${db}.time_zone;
-- create locale table
CREATE EXTERNAL TABLE ${db}.time_zone
(
    time_zone_id INT,
    time_zone STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/events/data/time_zone';

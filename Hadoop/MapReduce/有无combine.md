## 有combine

```
19/09/05 06:57:55 INFO mapreduce.Job: Counters: 49
	File System Counters
		FILE: Number of bytes read=116
		FILE: Number of bytes written=286835
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=174
		HDFS: Number of bytes written=54
		HDFS: Number of read operations=6
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Launched reduce tasks=1
		Data-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=7044
		Total time spent by all reduces in occupied slots (ms)=8498
		Total time spent by all map tasks (ms)=7044
		Total time spent by all reduce tasks (ms)=8498
		Total vcore-milliseconds taken by all map tasks=7044
		Total vcore-milliseconds taken by all reduce tasks=8498
		Total megabyte-milliseconds taken by all map tasks=7213056
		Total megabyte-milliseconds taken by all reduce tasks=8701952
	Map-Reduce Framework
		Map input records=6
		Map output records=12
		Map output bytes=166
		Map output materialized bytes=116
		Input split bytes=100
		Combine input records=12
		Combine output records=7
		Reduce input groups=7
		Reduce shuffle bytes=116
		Reduce input records=7
		Reduce output records=7
		Spilled Records=14
		Shuffled Maps =1
		Failed Shuffles=0
		Merged Map outputs=1
		GC time elapsed (ms)=301
		CPU time spent (ms)=3510
		Physical memory (bytes) snapshot=466743296
		Virtual memory (bytes) snapshot=5549494272
		Total committed heap usage (bytes)=382730240
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=74
	File Output Format Counters 
		Bytes Written=54

```

## 无combiner

```
19/09/05 07:02:35 INFO mapreduce.Job: Counters: 49
	File System Counters
		FILE: Number of bytes read=196
		FILE: Number of bytes written=286613
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=174
		HDFS: Number of bytes written=54
		HDFS: Number of read operations=6
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Launched reduce tasks=1
		Data-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=7293
		Total time spent by all reduces in occupied slots (ms)=9778
		Total time spent by all map tasks (ms)=7293
		Total time spent by all reduce tasks (ms)=9778
		Total vcore-milliseconds taken by all map tasks=7293
		Total vcore-milliseconds taken by all reduce tasks=9778
		Total megabyte-milliseconds taken by all map tasks=7468032
		Total megabyte-milliseconds taken by all reduce tasks=10012672
	Map-Reduce Framework
		Map input records=6
		Map output records=12
		Map output bytes=166
		Map output materialized bytes=196
		Input split bytes=100
		Combine input records=0
		Combine output records=0
		Reduce input groups=7
		Reduce shuffle bytes=196
		Reduce input records=12
		Reduce output records=7
		Spilled Records=24
		Shuffled Maps =1
		Failed Shuffles=0
		Merged Map outputs=1
		GC time elapsed (ms)=387
		CPU time spent (ms)=4560
		Physical memory (bytes) snapshot=466034688
		Virtual memory (bytes) snapshot=5548011520
		Total committed heap usage (bytes)=381157376
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=74
	File Output Format Counters 
		Bytes Written=54
```


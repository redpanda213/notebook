# Redis Java Api

**导入依赖包**

```
<!-- https://mvnrepository.com/artifact/redis.clients/jedis -->
<dependency>
	<groupId>redis.clients</groupId>
	<artifactId>jedis</artifactId>
	<version>2.9.0</version>
</dependency>
        
<build>
	<finalName>remyssm</finalName>
	<pluginManagement>
	<!-- lock down plugins versions to avoid using Maven defaults (may be moved to parent pom) -->
		<plugins>
			<plugin>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>3.8.0</version>
				<configuration>
					<source>1.8</source>
					<target>1.8</target>
				</configuration>
			</plugin>
		</plugins>
	</pluginManagement>
</build>
```



**小试牛刀**

```java
package com.kgc.myredis.services;

import redis.clients.jedis.Jedis;

/**
 * @author: Redpanda
 * @create: 2019-10-31 14:08
 * @description:  learn Redis 
 **/

public class Demo {
    public static void main(String[] args) {
        Jedis jedis = new Jedis("192.168.56.110");
        //System.out.println(jedis.ping());
        //结果：PONG
        jedis.set("start","here we go");
        System.out.println(jedis.get("start"));
    }
}

```
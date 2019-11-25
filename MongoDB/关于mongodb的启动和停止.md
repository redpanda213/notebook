# MongoDB的启动和停止

1、解压完mongodb

2、配置

```shell
#进入mongodb的bin
#我的安装目录是 (4013表示版本4.0.13)
pwd
/opt/bigdata/mongodb4013/bin
cd /opt/bigdata/mongodb4013/bin
#新建一个配置文件，为了方便，我直接建在bin目录下
vi mongodb.conf
#
```

```shell
#在mongodb.conf写入以下内容
dbpath=/opt/bigdata/mongodb4013/data
logpath=/opt/bigdata/mongodb4013/logs/mongodb.log
port=27017  (可以不设置，默认为27017)
fork=true   
auth=true
bind_ip=0.0.0.0
```

```shell
#同时创建data、logs
mkdir /opt/bigdata/mongodb4013/data
mkdir /opt/bigdata/mongodb4013/logs/
cd /opt/bigdata/mongodb4013/logs/
vi mongodb.log
```

3、启动mongodb service

```shell
#bin/
./mongod -f ./mongodb.conf
```

```shell
#结果：
#about to fork child process, waiting until server is ready for connections.
#forked process: 2526 
#child process started successfully, parent exiting
```



4、启动mongodb shell

```shell
#bin/
./mongo    #也可以使用 ./mongo --port 27017
```

```shell
#结果：
#MongoDB shell version v4.0.13
#connecting to: mongodb://127.0.0.1:27017/?gssapiServiceName=mongodb
#Implicit session: session { "id" : UUID("50bca12f-dd44-4599-9c12-7978265f09f6") }
#MongoDB server version: 4.0.13
#> 
```



\5、查看服务状态

```shell
#再打开一个终端
#如果没有netstat，先安装

yum install net-tools
netstat -lanp | grep “27027” #或者 "mongo"
```

```shell
#tcp    0    0 0.0.0.0:27017           0.0.0.0:*             LISTEN      2526/./mongod  
#unix   2    [ ACC ]   STREAM   LISTENING   16879 2526/./mongod  /tmp/mongodb-27017.sock
#状态为LISTEN说明已启动
```



6、关闭

6.1

```shell
>db.shutdownServer()
#结果：
#2019-11-25T06:13:34.889-0500 I NETWORK  [js] DBClientConnection failed to receive message from 127.0.0.1:27017 - HostUnreachable: Connection closed by peer

```

````shell
#Warning: unable to run listCollections, attempting to approximate collection names by parsing connectionStatus
#如果出现此错误，则
>use admin
>db.auth('root','ok')
#返回1则说明登陆成功
#db.auth('用户名','密码')
````

> 创建用户
>
> use admin
> db.createUser({user:"root",pwd:"ok",roles:[{role:"root",db:"admin"}]})

6.2

```shell
pkill 27027
```

关闭后再使用`netstat -lanp| grep "27027"`查看是否关闭，若无返回结果则说明已关闭。关闭需要一个过程，若发现仍有返回结果，请查看状态，`TIME_WAIT`请耐心等待彻底关闭，再次查看是否已关闭。










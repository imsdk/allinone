#!/bin/sh
export PATH='$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/sbin'


#请将脚本中的APPKEY替换成申请的24位appkey
#change the appkey with yours on www.imsdk.im
appkey=APPKEY


if [ $appkey = "APPKEY" ]
then
    echo "请将脚本中的APPKEY替换成申请的appkey"
    exit
fi

if [ ${#appkey} -ne "24" ]
then
    echo "请将脚本中的APPKEY替换成申请的正确的appkey"
    exit
fi

if [ ! -d "/opt" ] 
then
  echo "create /opt dir"
  mkdir -p /opt/ 
fi

curr=`pwd`

#redis nsq mongodb 
cp -r IMSDK/ nsq/ redis/ mongodb/ sql/ /opt/


#start mysql

mysqlcnt=`ps ax | grep [m]ysqld  | wc -l`

if [ $mysqlcnt -gt "0" ]
then
        echo "您已经安装mysql,请如下操作:"
        echo "1.创建数据库 imsdk"
        echo "2.从/opt/sql/imsdk.sql 文件导入数据库表结构:"
        echo "3.imsdk访问权限: grant all privileges on imsdk.* to 'imsdk'@'127.0.0.1' identified by 'imsdk';"
        exit
else
	cd $curr
	echo "==========install mysql=========="
	rpm -ivh ./mysql/mysql-server.x86_64.rpm ./mysql/mysql.rpm
	service mysqld start

	#mysql db init
	echo "init mysql table"
	/opt/sql/sql.sh
fi


#start redis
echo "==========install redis=========="
nohup /opt/redis/redis-server /opt/redis/redis.conf &

#start nsq
cd /opt/nsq
echo "==========install nsq=========="
sh /opt/nsq/restart.sh


#start mongodb 
echo "==========install mongodb=========="
touch /opt/mongodb/log/shard1a.log
nohup /opt/mongodb/bin/mongod --bind_ip 127.0.0.1 --port 27017 -oplogSize 100  -logpath /opt/mongodb/log/shard1a.log -dbpath /opt/mongodb/data -logappend -noprealloc -nojournal  &




cd $curr
###check
echo "==========安装环境检查=========="
./checktool $appkey 

#start imsdk server
cd /opt/IMSDK/
#conn
echo "==========install IMSDK=========="
/opt/IMSDK/con  /opt/IMSDK/imsdk.conf > /opt/IMSDK/con.out 2>&1  &

#db
/opt/IMSDK/d_s /opt/IMSDK/imsdk.conf > /opt/IMSDK/d_s.out 2>&1  &

#team
/opt/IMSDK/t_s /opt/IMSDK/imsdk.conf > /opt/IMSDK/t_s.out 2>&1  &

#msgsvr
/opt/IMSDK/m_s /opt/IMSDK/imsdk.conf > /opt/IMSDK/m_s.out 2>&1 & 

#mc
/opt/IMSDK/mc /opt/IMSDK/imsdk.conf > /opt/IMSDK/mc.out 2>&1 & 

#mdb
/opt/IMSDK/mdb /opt/IMSDK/imsdk.conf  > /opt/IMSDK/mdb.out 2>&1  &

#st
/opt/IMSDK/st /opt/IMSDK/imsdk.conf  > /opt/IMSDK/st.out 2>&1  &

chmod 0664 /opt/IMSDK/log/*.log

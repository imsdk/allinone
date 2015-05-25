#!/bin/bash
export PATH=$PATH:'/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/sbin'

ex="mysql --default-character-set=utf8"
sqlfile="/opt/sql/imsdk.sql"
rootuser=root
rootpwd="root"

${ex} -u${rootuser} -s -e \
"
create database imsdk charset=utf8;
grant all privileges on imsdk.* to 'imsdk'@'127.0.0.1' identified by 'imsdk';
grant all privileges on imsdk.* to 'imsdk'@'localhost' identified by 'imsdk';
"

if [ ! -f ${sqlfile} ];then
  echo "${sqlfile} 不存在"
  exit 1
fi

user=imsdk
passwd=imsdk
db=imsdk
host=127.0.0.1
${ex} -u${user} -p${passwd} -h${host} ${db}  <${sqlfile}


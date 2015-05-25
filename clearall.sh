#!/bin/sh
export PATH='$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/sbin'



killall -9 con d_s redis-server nsqlookupd nsqd nsqadmin mongod  t_s m_s mc mdb st
service  mysqld stop
cd /opt/; rm  -rf nsq/ mongodb/ sql/ redis/ IMSDK/

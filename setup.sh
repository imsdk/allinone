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


###check

echo "==========安装环境检查=========="
./checktool $appkey

cp -rf ./IMSDK/ /opt/
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

chmod +x /opt/IMSDK/check.sh


crontab -l >> /opt/IMSDK/check.crontab.tmp
cat /opt/IMSDK/check.crontab >> /opt/IMSDK/check.crontab.tmp
crontab /opt/IMSDK/check.crontab.tmp

rm /opt/IMSDK/check.crontab.tmp

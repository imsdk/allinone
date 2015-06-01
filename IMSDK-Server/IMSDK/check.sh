#!/bin/sh
export PATH='$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/sbin'

APPPATH=/opt/IMSDK

for app in d_s m_s st mc con mdb t_s
do
   cnt=`ps ax | grep IMSDK | grep $app | wc -l`
   if [ $cnt -lt "1" ]
   then
       $APPPATH/$app $APPPATH/imsdk.conf >> $APPPATH/$app.out  2>&1  &
       echo "restart :" , $app
   fi
done

#!/bin/sh
export PATH='$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/sbin'



killall -9 con d_s  t_s m_s mc mdb st
cd /opt/; rm  -rf IMSDK/

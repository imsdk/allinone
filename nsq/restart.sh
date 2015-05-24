killall -9 nsqlookupd
killall -9    nsqd
killall -9  nsqadmin

sleep 1
cd      /opt/nsq/
nohup  /opt/nsq/bin/nsqlookupd  > /opt/nsq/log/nsqlookupd.log  2>&1 &
nohup  /opt/nsq/bin/nsqd --lookupd-tcp-address=127.0.0.1:4160  >/opt/nsq/log/nsqd.log 2>&1 &
nohup  /opt/nsq/bin/nsqadmin --lookupd-http-address=127.0.0.1:4161 >/opt/nsq/log/nsqadmin.log 2>&1 &

#! /bin/bash

echo $(date -u) >> /home/qq/hosts.txt 
source hostsfind.conf 
((for (( i=${startIp}; i <= ${endIp}; i++ ));do (ping -c1 192.168.1.${i} | grep "bytes from" &);done;) | awk '{print$4}' | cut -f1 -d:) >> /home/qq/hosts.txt
gzip < /home/qq/hosts.txt > /home/qq/hosts.txt.gz

#!bin/bash

RESULT=$(df | grep disk | awk '{print $5;}' | sed -e 's/%//g')
for i in $RESULT
do
  if [ $i -ge 80 ];then
     echo 'ディスク容量が80%を超えています'
     break
  fi
done


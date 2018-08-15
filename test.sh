#!/bin/bash
result=`df -h | awk '{print $5;}' | sed -n 2,2p | tr -d %`

if [ $result -ge 80 ]; then
  echo "８０％以上です"
else
  echo "現在のディスク容量は$result%です"
fi

#!bin/bash

while read line
do
  array=($line)
  exec_flag=true

  # HTTPメソッドの判定
  if [ ${array[0]} != 'GET' ];then
    echo "HTTPメソッドを正しく入力してください。"
    exec_flag=false
  fi
  # 対象ファイルの走査
  file=`echo ${array[1]} | sed -e 's/\///g'`
  if [ ! -e ${file} ];then
    echo "対象ファイルが存在しません。"
    exec_flag=false
  fi
  # HTTPバージョンのチェック
  version=${array[2]}
  if [ $version != 'HTTP/1.0' ] && [ $version != 'HTTP/1.1' ];then
    echo "正しいHTTPバージョンを入力してください。"
    exec_flag=false
  fi

  # 実行
  if [ ${exec_flag} != false ];then
    cmd=`echo ${line} | awk '{print $2;}' | sed -e 's/\///g'`
    cat ${cmd}
  fi
done

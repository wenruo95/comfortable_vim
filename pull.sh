#/bin/bash

echo $#
if [ $# -ne 1 ]; then
    echo "useage: ./pack.sh example"
    exit
fi

target_host="username@ip_addr"
target_path="/home/zemanzeng/"

rm -rf demo.tar.gz 
ssh $target_host -p 32000 "cd $target_path && \
    rm -rf demo.tar.gz && tar -zcvf demo.tar.gz $1"
scp -P 32000 $target_host:$target_path/demo.tar.gz .
rm -rf "$1.bak" && mkdir -p $1 && mv $1 "$1.bak" && tar -zxvf demo.tar.gz $1 && rm -rf demo.tar.gz


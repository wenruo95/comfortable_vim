#/bin/bash

echo $#
if [ $# -ne 1 ]; then
    echo "useage: ./pack.sh example"
    exit
fi

date_str=`date +"%Y%m%d_%H%M%S"`
target_host="username@ip_addr"
target_path="/home/zemanzeng/"
tar_name="demo_$data_str.tar.gz"

#pre clear
tar -zcvf $tar_name $1 && du -sh $tar_name && \
    scp -P 32000 $tar_name $target_ip:$target_path && \
    ssh $target_host -p 32000 "cd $target_path && tar -zxvf $tar_name && rm -rf $tar_name" && \
    rm -rf $tar_name

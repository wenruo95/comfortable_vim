#/bin/bash 

echo $#
if [ $# -ne 1 ]; then
    echo "useage: ./codetar.sh example"
    exit
fi

date_str=`date +"%Y%m%d_%H%M%S"`
tar_name="code_$date_str.tar.gz"
target_path="/mnt/Source"

tar -zcvf $tar_name $1 && mv $tar_name $target_path/$tar_name 

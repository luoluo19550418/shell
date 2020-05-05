find ./G*/ -type f -iname "*info.txt"|xargs grep -irl "2019" |xargs grep -irl "syjin" >a.txt

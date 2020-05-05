while read line
do
  echo $line
  rm $line
done < 20*duan.txt

exit

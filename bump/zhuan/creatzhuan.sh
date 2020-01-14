# aim: creatzhuan.sh
# called: mainzhuan.sh
# call: template.txt
# input: bash creatzhuan.sh 0575-050

pwdjb="/home/res/csluo/bump/zhuan/"
pwdgz="/home/res/eps/"

touch "$pwdgz"regridlog/zhuan$1
files=` find "$pwdgz"regridlog/$1*l `
for file in $files
do
  delfile=${file##*/}
  datfile=${delfile/del/dat}
  echo $datfile
  year=`head -n +1 "$pwdjb"$datfile`
  echo $year
   
  if [ $year == 19 ]; then
    echo "sudo reregrid $delfile" >> "$pwdgz"regridlog/zhuan$1
  else
    echo "reregrid2017 $delfile" >> "$pwdgz"regridlog/zhuan$1
  fi
done

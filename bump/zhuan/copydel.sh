# aim: copy
# called: mainzhuan.sh
# input: bash copydel.sh 0575-050

pwdjb="/home/res/csluo/bump/zhuan/"
pwdgz="/home/res/eps/"

files=` find $pwdjb -name "$1*dat" `
for file in $files
do
  datfile=${file##*/}
  delfile=${datfile/dat/del}
  echo $delfile
  cp "$pwdgz"$delfile "$pwdgz"regridlog/
  
  tagfile=${delfile/del/tag}
  echo $tagfile
  cp "$pwdgz"$delfile "$pwdgz"/regridlog/$tagfile
done

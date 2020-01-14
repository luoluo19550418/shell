# aim: modify text of tag
# called: mainzhuan.sh
# input: bash modifytag.sh 0575-050

pwdjb="/home/res/csluo/bump/zhuan/"
pwdgz="/home/res/eps/"

files=` find "$pwdgz"regridlog -name "$1*tag" `
for file in $files
do
  tagfile=${file##*/}
  datfile=${tagfile/tag/dat}
  echo " " > "$pwdgz"regridlog/$tagfile     
  echo "$file is printing"

  var=0
  cat "$pwdjb"$datfile | while read line
  do
    if [ $var == 0 ]; then
      var=$var+1
    else 
      texttmp="0.79 1.22 284.08 18.73 -12.66 1 0.79 123.62 51.58 36401.73 17748 G B1UM"
      text=${texttmp/17748/$line}
      echo $text
      echo $text >> "$pwdgz"regridlog/$tagfile
    fi
  done
  sed -i '1d' "$pwdgz"regridlog/$tagfile  
done

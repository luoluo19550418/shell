# aim: delete bump
# call: bur2eps.class 14m2eps.class 
# input: bash /home/res/csluo/bump/eps/2eps.sh 0575-050 61 65 -75 12 bur
pwdchengxu="/home/res/csluo/bump/eps"
pwdshuju="/home/res/user/"
src=$1
obs="G${src:0:2}0+00"
echo $obs; echo $src
panduan="bur"

cd "$pwdshuju""$obs"
 
if [ $panduan == $6 ]; then
  echo "$panduan processing starting"
  x=$2; y=$3; fre=$5
  files=`find ./ -name "$1*bur"`
  for file in $files
  do
    file=${file##*/}
    echo $file
    class @"$pwdchengxu"/bur2eps.class $file $x $y $4 $fre
  done
  echo "successfully output eps"

else
  echo "14m processing stating"
  x=$2; y=$3; fre=$5
  files=`find ./ -name "$1*14m"`
  for file in $files
  do
    echo $file
    class @"$pwdchengxu"/14m2eps.class $file $x $y $4 $fre
  done
  echo "successfully output eps"
fi

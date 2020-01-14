# aim:
# call: copydel.sh modifytag.sh creatzhuan.sh zhuan$src.sh 
# input: bash /home/res/csluo/bump/zhuan/mainzhuan.sh 0575-050 19 
src=$1
year=$2
pwdjb="/home/res/csluo/bump/zhuan/"
pwdgz="/home/res/eps/"
cd $pwdjb

# dat add 2019 or 2018
files=` find "$pwdjb" -name "$1*dat" `
for file in $files
do
  datfile=${file##*/}
  sed "1i $2" $datfile >> "$file"_tmp.dat #error 2019
  mv "$file"_tmp.dat $datfile
done

bash "$pwdjb"sortdat.sh $src
bash "$pwdjb"copydel.sh $src
bash "$pwdjb"modifytag.sh $src
bash "$pwdjb"creatzhuan.sh $src
#bash "$pwdgz"regridlog/zhuan$src

rm /home/res/csluo/bump/eps/$src*eps
echo "successfully zhuan, end!" 

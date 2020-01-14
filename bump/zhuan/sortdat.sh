#input: bash sortdat.sh 0520+040
pwdjb="/home/res/csluo/bump/zhuan/"

files=` find $pwdjb -name "$1*dat" `
for file in $files
do
  sort -n $file >> "$pwdjb"tmp.dat
  cat "$pwdjb"tmp.dat
  mv "$pwdjb"tmp.dat $file
done

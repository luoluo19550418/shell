#dell

rm a.txt
rm b.txt
for f in IF20*
do
  dd=` sed -n -e '/23:59:59/=' $f `
  fnum=` echo $dd | wc -w `
  if [ $fnum -gt 1 ]; then
    array=(${dd//\ / }) #xinzifu tihuan jiuzifu
    for(( i=1;i<fnum;i++)); do
      lasti=` expr $i - 1 `
      cha=` expr ${array[i]} - ${array[lasti]} `
      if [ $cha -gt 1 ];then
        delnum=${array[lasti]}
        echo $f >> a.txt
        echo "$delnum" >> a.txt
        sed -i "1,${delnum}d" $f
      fi
    done
  fi
  
  dd=` sed -n -e '/23:59:58/=' $f `
  fnum=` echo $dd | wc -w `
  if [ $fnum -gt 1 ]; then
    array=(${dd//\ / }) #xinzifu tihuan jiuzifu
    for(( i=1;i<fnum;i++)); do
      lasti=` expr $i - 1 ` 
      cha=` expr ${array[i]} - ${array[lasti]} `
      if [ $cha -gt 1 ];then
        delnum=${array[lasti]}
        echo $f >> b.txt
        echo "$delnum" >> b.txt
        sed -i "1,${delnum}d" $f
      fi
    done
  fi
done

exit

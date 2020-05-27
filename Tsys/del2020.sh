#dell

rm a.txt
rm b.txt
for f in IF0*
do
  dd=` sed -n -e '/23:59:59/=' $f `
  fnum=` echo $dd | wc -w `
  if [ $fnum -gt 1 ]; then
    array=(${dd//\ / })
    tj=` expr $fnum - 2 `
    if [ $tj -ge 0 ]; then
      delnum=${array[$tj]}
      echo $f >> a.txt
      echo "$delnum" >> a.txt
      sed -i "${delnum},"'$d' $f
    fi
  fi
  
  dd=` sed -n -e '/23:59:58/=' $f `
  fnum=` echo $dd | wc -w `
  if [ $fnum -gt 1 ]; then
    array=(${dd//\ / }) 
    tj=` expr $fnum - 2 `
    if [ $tj -ge 0 ]; then
      delnum=${array[$tj]}
      echo $f >> b.txt
      echo "$delnum" >> b.txt
      sed -i "${delnum},"'$d' $f
    fi
  fi
done

exit

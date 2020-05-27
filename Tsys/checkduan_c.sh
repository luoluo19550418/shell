#checkduan_c.sh

for f in IF*.dat; do
  dd=` sed -n -e '/00:00:00/=' $f `
  fnum=` echo $dd | wc -w `
  if [ $fnum -gt 1 ]; then
    array=(${dd//\ / })
    tmp=0
    for(( i=1;i<fnum;i++)); do
      lasti=` expr $i - 1 `
      cha=` expr ${array[i]} - ${array[lasti]} `
      if [ $cha -gt 1 ];then
        pn=$[${array[$i]}-1-$tmp]
        cn=$[${array[$i]}-$tmp]
        p=` sed -n "${pn}p" $f `; p1=${p:0:8}
        c=` sed -n "${cn}p" $f `; c1=${c:0:8}
        if [[ $p1 != "23:59:58" ]] && [[ $p1 != "23:59:59" ]]; then
          fl=` ls ${f:0:8}*.dat `
          echo -e "$f\c"; echo -e " $pn\c"; echo " $fl"
          sed -i "1,${pn}d" $f
          tmp=pn
        fi
      fi
    done
  fi
done

exit

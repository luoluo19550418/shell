#hebing.sh

ch="_"

for i in $(seq 1 12 )
do
  if [ $i -lt 10 ]; then
    i="0"$i
  fi

  for j in $(seq 1 31 )
  do
    if [ $j -lt 10 ]; then
      j="0"$j
    fi
    name="IF$i$ch$j"
    namenew="IF2012$ch$i$ch$j"
    a=` ls $name*.dat | wc -l `
    echo "$name $a"
    
    if [ $a -gt 0 ]; then
      mv $name"_00.dat" $namenew".dat"
      cat $name*.dat >> $namenew".dat"
    fi
  done
done

exit

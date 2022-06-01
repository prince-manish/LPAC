#! /bin/bash
for((i=1; i<=4; ++i))
  do
    for (( j=i+1; j<=4; ++j ))
      do
        for((k=$i; $k<=$j; ++k))
          do
            echo "$k \c"
            echo  "$k \c" >> "$i-$j".text


done
echo " "
done
done

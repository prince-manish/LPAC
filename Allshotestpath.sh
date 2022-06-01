#! /bin/bash

FILE_NAME="shortestPath.dat"

touch $FILE_NAME

rm -rf combineResult.out
touch "combineResult.out"

for (( i=1; i<=4; ++i ))
do
    for (( j=i+1; j<=4; ++j ))
    do
        echo """
param N := 4;
param p := $i;
param q := $j;
        """ > $FILE_NAME

        cat data.txt >> $FILE_NAME

        result=$(cat $FILE_NAME)

        echo -e "\t\t\tSOURCE $i   ---->     DESTINATION $j" >> combineResult.out
        
       result=$(glpsol -m sp-gen.mod -d shortestPath.dat -o $i"To"$j.out)
        
        # glpsol -m sp-gen.mod -d shortestPath.dat -o result$i.out
        cat $i"To"$j.out >> combineResult.out
        # cat result.out
        echo -e "____________________________\c" >> combineResult.out
        echo -e "____________________________\c" >> combineResult.out
        echo -e "____________________________\n" >> combineResult.out
    done
done



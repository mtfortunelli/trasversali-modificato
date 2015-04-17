#!/bin/bash

sottocartelle=`ls -d */`
c=0
for i in $sottocartelle
do
	i=${i:0:${#i}-1}
	primaRiga=1
	while read -r linea
	do
		if [ $primaRiga -eq 1 ]
		then
			primaRiga=0
			if [ $c -eq 0 ]
			then
			
				echo "${linea};filiale" > merged.csv
			fi
		else
			echo "$linea;$i"  >> merged.csv 
		fi
	done < $i/export.csv
	c=$((c+1))
done

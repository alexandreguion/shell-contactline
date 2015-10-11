#!/bin/bash
MAINDIR=/Volumes/SDcard/REF
cd $MAINDIR

		
for ub in 5. 
do
		levels=7
		for angles in 61.12
		do
		DIRECTORY=ref2-$levels-$angles-$ub
		cd $DIRECTORY
		cp /Volumes/SDcard/SPRING15/VALIDATION-SCRIPT-6-90/interface.gfv .
		
		for j in 0 1 2 3 4 #5 6 7 8 9 10 11 12 13 14 15
	       	do
			for k in 000 100 200 300 400 500 600 700 800 900 
			do

			INT=interface-$j.$k.dat
			INT2=interface-2-$j.$k.dat
			for u in 0; do
			cat out-$j.$k.gfs 
			echo "Save $INT { format = Gnuplot }"   
			done | gfsview2D interface.gfv
			sed '1d' $INT > tmpfile; mv tmpfile $INT2
			#OPERATION TO REPLACE INT2 by INT3 (absolute value)
			INT3=interface-3-$j.$k.dat
			VELO2=velo-2-$j.$k.dat	
			awk '{for (i=1; i<=NF; i++) if ($i < 0) $i = -$i; print }' $INT2 > $INT3;
			gerris2D -e "OutputLocation {}$VELO2 $INT3 " out-$j.$k.gfs | gfsview2D
			sort -g -k 2 $VELO2 > t; mv t $VELO2
			head -1 $VELO2 >> $MAINDIR/tplref2-$levels-$angles-$ub	
			done #decimals 
		done #microseconds
		cd $MAINDIR
	done
done #ub


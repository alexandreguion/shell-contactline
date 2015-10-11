FILE=script_calc6_prefactor.m
rm $FILE

ub=5.
for j in 6 7 8
do
cat>>$FILE <<EOF
x_$j=[];
y_$j=[];
U_$j=[];
L_$j=[];
EOF

 
		levels=$j # 7 8 9
	        for jj in 5 6 7 8
		do
			for kk in 0 1.25 2.5 3.75 5 6.25 7.5 8.75
			do
				angles=$jj$kk
				tpl=full-tpl-$levels-$angles-$ub
cat>>$FILE <<EOF
copyfile('$tpl', 'tt')
pp=load('tt');
mvelo=pp(end-2,2)+pp(end-1,2)+pp(end,2);
x_$j=[x_$j;pp(end,3)];
y_$j=[y_$j;0.28/59*mvelo];
U_$j=[U_$j;(max(pp(:,2)-mvelo)*0.28/59];
L_$j=[L_$j;(-min(pp(:,2)+mvelo)*0.28/59];
EOF
			done
		done
	done

#--------------------------------------------------------------------
		level2=7 #8 9

                for jj in 5 6 7 8
                do
                        for kk in 0 1.25 2.5 3.75 5 6.25 7.5 8.75
                        do
                                angles=$jj$kk
                                tpl=full-tpl-$level2-$angles-$ub
cat>>$FILE <<EOF
copyfile('$tpl', 'tt')
pp=load('tt');
x_7=[x_7;pp(end,3)];
y_7=[y_7;(pp(end-2,2)+pp(end-1,2)+pp(end,2))/3];
EOF
                        done
                done

#-----------------------------------------------
		level3=8 #9
		for jj in 5 6 7 8
		do
                        for kk in 0 1.25 2.5 3.75 5 6.25 7.5 8.75
                        do
                                angles=$jj$kk
                                tpl=full-tpl-$level3-$angles-$ub
cat>>$FILE <<EOF
copyfile('$tpl', 'tt')
pp=load('tt');
x_8=[x_8;pp(end,3)];
y_8=[y_8;(pp(end-2,2)+pp(end-1,2)+pp(end,2))/3];
EOF
                        done
                done
#----------------------------------------------
#level4=9
#                for jj in 5 6 7 8
#                do
#                        for kk in 0 1.25 2.5 3.75 5 6.25 7.5 8.75
#                        do
#                                angles=$jj$kk
#                                tpl=full-tpl-$level4-$angles-$ub
#cat>>$FILE <<EOF
#copyfile('$tpl', 'tt')
#pp=load('tt');
#x_9=[x_9;pp(end,3)];
#y_9=[y_9;(pp(end-2,2)+pp(end-1,2)+pp(end,2))/3];
#EOF
#                        done
#                done





cat>>$FILE <<EOF
figure (1)
hold on
plot(x_6,y_6, 'ko-', title, 'dx=1/2')
plot(x_7,y_7, 'r+-', title, 'dx=1/4')
plot(x_8,y_8, 'bx-')
%plot(x_9,y_9, 'm.-')
EOF

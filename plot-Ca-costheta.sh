FILE=script_calc6_prefactor.m
rm $FILE

ub=5.
cat>>$FILE <<EOF
x_6=[];
x_7=[];
x_8=[];
x_5=[];
y_6=[];
y_7=[];
y_8=[];
y_5=[];
EOF
 
		levels=6 # 7 8 9
	        for jj in 5 6 7 8
		do
			for kk in 0 1.25 2.5 3.75 5 6.25 7.5 8.75
			do
				angles=$jj$kk
				tpl=full-tpl-$levels-$angles-$ub
cat>>$FILE <<EOF
copyfile('$tpl', 'tt')
pp=load('tt');
x_6=[x_6;pp(end,3)];
y_6=[y_6;(pp(end-2,2)+pp(end-1,2)+pp(end,2))/3];
EOF
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
#x_5=[x_9;pp(end,3)];
#y_5=[y_9;(pp(end-2,2)+pp(end-1,2)+pp(end,2))/3];
#EOF
#                        done
#                done





cat>>$FILE <<EOF
figure (1)
hold on
plot(x_6,y_6, 'ko-', title, 'dx=1/2')
plot(x_7,y_7, 'r+-', title, 'dx=1/4')
plot(x_8,y_8, 'bx-')
%plot(x_5,y_5, 'm.-')
EOF

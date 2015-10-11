rm $FILE

ub=5.
cat>>$FILE <<EOF
clear all
close all
clc
EOF

for j in 5 6 7 8
do
cat>>$FILE <<EOF
x_$j=[];
y_$j=[];
U_$j=[];
L_$j=[];
EOF

 
		levels=$j # 7 8 9
	        for jj in 1 2 3 4 5 6 7 8
		do
			for kk in 0 1.25 2.5 3.75 5 6.25 7.5 8.75
			do
				angles=$jj$kk
				tpl=full-tplref3-$levels-$angles-$ub
cat>>$FILE <<EOF
copyfile('$tpl', 'tt')
pp=load('tt');
mvelo=(pp(end-2,2)+pp(end-1,2)+pp(end,2))/3;
qq=pp(end-5:end,2);
x_$j=[x_$j;pp(end,3)];
y_$j=[y_$j;0.28/59*mvelo];
U_$j=[U_$j;(max(qq(:))-mvelo)*0.28/59];
L_$j=[L_$j;(-min(qq(:))+mvelo)*0.28/59];
EOF
			done
		done
	done


cat>>$FILE <<EOF
figure (1)
hold on
errorbar(x_6,y_6,L_6,U_6, 'ko-')
errorbar(x_7,y_7, L_7,U_7,'r+-')
errorbar(x_8,y_8,L_8,U_8 ,'bx-')
legend('dx=1/2','dx=1/4', 'dx=1/8')

figure (2)
hold on
errorbar(180/pi*acos(x_6),y_6,L_6,U_6, 'ko-')
errorbar(180/pi*acos(x_7),y_7, L_7,U_7,'r+-')
errorbar(180/pi*acos(x_8),y_8,L_8,U_8 ,'bx-')
legend('dx=1/2','dx=1/4', 'dx=1/8')
EOF

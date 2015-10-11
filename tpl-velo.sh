FILE=script_get_Ucl8.m

rm $FILE

ub=5.
for levels in 8 
do
	        for jj in 1 2 3 4 5 6 7 8
		do
			for kk in 0 1.25 2.5 3.75 5 6.25 7.5 8.75
			do
				angles=$jj$kk
				tpl=tplref3-$levels-$angles-$ub
cat>>$FILE <<EOF
copyfile('$tpl', 'tt')
pp=load('tt');
v=[];
t=[];
c=[];
mm=length(pp(:,1));
for k=2:mm;
	v(k-1)=(pp(k,3)-pp(k-1,3))/(pp(k,1)-pp(k-1,1));
	t(k-1)=(pp(k,1)+pp(k-1,1))/2;
	c(k-1)=cos($angles/180.*pi);
	end
	vv=[t' v' c'];
	save('full-$tpl', '-ascii', 'vv');
EOF
			done
		done
done

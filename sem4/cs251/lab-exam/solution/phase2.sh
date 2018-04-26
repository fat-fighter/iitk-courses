file='phase1.txt'
content=$(cat $file)
content=($content)
ctr=0
file_ctr=0

for text in ${content[@]} 
do

	if [ "$file_ctr" -lt 10 ] ; then 
		filename="phase2-0$file_ctr"
		echo $text >> $filename
	else
		filename="phase2-$file_ctr"
		echo $text >> $filename
	fi
	
	
	((ctr = ctr + 1))
	if [ "$ctr" -eq 9 ];then
		((ctr = 0))
		((file_ctr = file_ctr + 1))
	fi
done

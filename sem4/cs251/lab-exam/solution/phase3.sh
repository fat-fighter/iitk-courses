input='rashis.txt'
file_ctr=0

while IFS= read -r var; 
do 
	if [ "$file_ctr" -lt 10 ] ; then 
		filename="phase2-0$file_ctr"
	else
		filename="phase2-$file_ctr"
	fi		
	((file_ctr = file_ctr + 1))
	rashi_det=$(cat $filename)
	rashi_det=($rashi_det)
	nakshas=()
	counts=()
	length=0
	weights=()
	for i in {0..8}
	do
		IFS=', ' read -r -a naksh <<< "${rashi_det[$i]}"
		# echo "$length"
		if [[ "$length" == 0 ]] ; then
			last_naksh=${nakshas[$length]}
		else 
			last_naksh=${nakshas[$length - 1]}
		fi
		
		if [[ "${naksh[0]}" == "$last_naksh" ]] ; then
			((counts[length - 1] = counts[length - 1] + 1))
		else
			# 
			# echo 11
			(( length = length + 1))
			nakshas+=(${naksh[0]})
			counts+=(1)
			weights+=(${naksh[1]})
		fi
		# echo "${nakshas[$length - 1]} ${weights[$length - 1]} $length"
	done
	if [[ "$length" == 2 ]] ; then 
		echo "$var : ${counts[0]} ${nakshas[0]} ${weights[0]} ${counts[1]} ${nakshas[1]} ${weights[1]}" >> phase3.txt
	else 
		echo "$var : ${counts[0]} ${nakshas[0]} ${weights[0]} ${counts[1]} ${nakshas[1]} ${weights[1]} ${weights[0]} ${counts[2]} ${nakshas[2]} ${weights[2]}" >> phase3.txt
	fi
done < $input








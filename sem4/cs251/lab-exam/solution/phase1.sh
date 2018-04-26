input='nakshatras.txt'
while IFS= read -r var; 
do 
    details=($var)
	echo "${details[0]},${details[1]} " >> phase1.txt  
	echo "${details[0]},${details[1]} " >> phase1.txt  
	echo "${details[0]},${details[1]} " >> phase1.txt  
	echo "${details[0]},${details[1]} " >> phase1.txt  
done < $input


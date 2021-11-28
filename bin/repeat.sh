#!/bin/bash

pr=(I HE SHE IT WE THEY YOU)
tense=('=*=' '=*=' '=*=' '<==' '<==' '<==' '==>')
# tense=(present present present past past past future)
# tense=(present past future)
cnt=50

while [ 0 -lt $((cnt-=1)) ]; do
	tput clear
	sleep 1
	tput cup 30 110

	p=${pr[$RANDOM % ${#pr[@]}]}
	t=${tense[$RANDOM % ${#tense[@]}]}

	# echo "($t)  $p"
	echo "$p  $t"

	tput cup 0 0
	sleep 3
done

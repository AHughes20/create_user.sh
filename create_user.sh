#sdfgsfg
ghdfghd
dfghdfghdg
!/bin/bash
x=1

create_uname () {
	local fname="$1"
	local lname="$2"
	echo $fname | tr '[:upper:]' '[:lower:]'
	echo $lname | tr '[:upper:]' '[:lower:]'
}
while [ $x -le 5 ]
	do
	echo "New user provisioning script."
	read -p "Enter employee first name: " fname
	read -p "Enter employee last name: " lname
	read -p "Is this correct?Y/N " create
	if [ $create = "Y" ]
	then	
		create_uname "$fname" "$lname"
		((x++))
		echo "user created"
	
	else
		echo "nope"
	fi
done



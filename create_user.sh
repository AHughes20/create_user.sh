#!/bin/bash
x=1

create_uname () {
	local fname=${1:0:1}
	local lname=$2
	lfname=$(echo $fname | tr '[:upper:]' '[:lower:]')
	llname=$(echo $lname | tr '[:upper:]' '[:lower:]')	

	check_uname=$lfname$llname
	if getent passwd $check_uname; then
		echo "already exists"
	else
		useradd $check_uname -s /bin/bash
		echo "User" $lfname$llname "created"
	fi
}

#########Use this loop if manually entering new users#############
while [ $x -le 3 ]
	do
	echo "New user provisioning script."
	read -p "Enter employee first name: " fname
	read -p "Enter employee last name: " lname
	read -p "Is this correct?Y/N " create
	if [ $create = "Y" ]
	then	
		create_uname "$fname" "$lname"
		((x++))
	
	else
		echo "nope"
	fi
done

#########Use  this for loop for known amount of users, ie; a file or another script###############

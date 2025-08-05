#!/bin/bash

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

echo "New user provisioning script."
read -p "Create new User?y/n: " create
########Use this loop if manually entering new users#############

while [ $create = "Y" ] || [ $create = "y" ]
	do
	read -p "Enter employee first name: " fname
	read -p "Enter employee last name: " lname
	read -p "Is this correct?Y/N " create
	if [ $create = "Y" ] || [ $create = "y" ]
	then	
		create_uname "$fname" "$lname"
		((x++))
		read -p "Create another user?y/n: " create
	
	else
		create="n"
	fi
	####add code to put all new created users into list to be displayed at end of script.
done

#########Use  this for loop for known amount of users, ie; a file or another script###############

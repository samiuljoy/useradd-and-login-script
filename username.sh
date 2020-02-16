#!/bin/bash

# What I'm planning to do here is that, create a useradd script which allows a user to add themselves by puting in their names
# and their password. This will save the username::password to a file called mango.txt and prompt at each login by running
# the login.sh script If username already exists, notifies the user that a user with the same name exits, else add 
# the new user along with a password. The password is saved in a md5sum form.

exec 2>/dev/null
echo -n "Enter username: "

read usame

if [ "$usame" == "" ]; then echo -e "Username can not be blank\n"
	./username.sh
else

grep -q $usame mango.txt

if [ "$?" == 0 ]; then
	
	echo -e "A username with the same name already exists\n"
       
	./username.shh

	else
	echo -n "Password: "
	read -s -p "Password: " passwd
		
	while true; do

		if [ "$passwd" == "" ]; then echo "Password can not be blank\n"
		
		else 
			echo $usame::$(echo $passwd | md5sum) >> mango.txt
			echo -e "\nUser $usame added\n"
		break
fi
done
fi
fi

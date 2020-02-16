# A simple login bash script

#trap interrupts your keyboard if you press ctrl+z or ctrl+c
trap '' INT TSTP
#Reads the password while not displaying on screen
read -p "Enter username: " usname
grep -q $usname mango.txt
if [ "$?" -gt 0 ]; then
	echo "Username not found"
	sleep 1
	pkill -9 bash
else
read -s -p "Password: " password

if [ "$password" == "" ]; then 
	echo "Password can not be blank"
	./password.sh
else
#saves the password in md5sum format in tmp.txt
echo $password | md5sum > tmp.txt
#assigning a tmp variable which reads the tmp.txt
tmp="$(cat tmp.txt)"
#if the md5 hashes match, then allow login saying yo
cat mango.txt | grep -q $usname::$tmp
if [ "$?" == 0 ]; then
echo -e "\nyo"
#else print login failed
else echo -e "\nLogin failed"
	sleep 1
	pkill -9 bash
fi
fi
fi
rm tmp.txt 2>/dev/null

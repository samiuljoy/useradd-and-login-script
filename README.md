# useradd-and-login-script
A simple emulation of the Linux command line "passwd" and "adduser" commands with bash-scripts!
The other day I was curious about the way a simple command like "passwd" and "adduser" works on a Linux system. It basically saves the password in a /etc/shadow file and encrypts it using secure hashing algorithms with salting involved. Now what if we try to do the same(not the same, but something similar) thing with a shell script? Wouldn't that be fun?

Let's try to emulate the whole mechanism.

1. A new user types in "adduser" and a username prompt appears asking the user to put in their name.
2. If that username is already taken, tells the user that the username is already taken and to type in a different name. Else adds the new username and then asks for their password.
3. If the password field is blank, tells the user to put in a legit password.
4. Then saves the username::password in the /etc/shadow file followed by hashes.
5. Then at the time of login, a user types in their username and password.
6. If the typed in password matches with that of the saved hash in /etc/shadow, then user can log in, else exit.

I'm assuming you have prior knowledge to shell scripting.

Script 1: username.sh

Description: What is basically does is that, it saves your name and your password in a file called mango.txt, and the next time you try logging in, the login.sh script pulls the data from mango.txt and compares that with input password.

Script 2: login.sh

Description: Now this script actually needs the mango.txt to work, else logging in will be impossible(just a prior warning; this is just a simple emulation as to how the same thing can be achieved with a shell script..don't just put it in your shell startup though..things can get messy at some point..)

Now this is actually nowhere near the way that works in a real Linux OS, however, the rest is up to you and how you use it.


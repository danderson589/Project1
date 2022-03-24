#!/bin/bash
# sudo nano for_loops.sh

# lsit variables
nums=$(echo {0..9})
state=$('Utah' 'California' 'Texas' 'Hawaii' 'Nevada')
ls_out=$(ls)

execs=$(find /home -type f -perm 777 2> /dev/null)

# helpful loops
dir=$('/ect/shadow' '/etc/passwd')
users=$(ls /home)
=$('date' 'uname -a' 'hostname -s')
#create loops
# print out only 3,4, and 7
for num in ${nums[@]};
do
   if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
   then
      echo $num
    fi
done

# creating a loop that is looking for Hawaii
for state in ${states[@]};
do
    if [$state == 'Hawaii' ]
    then
       echo "Hawaii is the best!"
    else
       echo "I'm not a fan of  Hawaii."
    fi
done

# creating a loop that will print out variables
for x in ${ls_out[@]};
do
    echo $x
done

#creating a for loop to print exec
for exec in ${execs[@]};
do
    echo $exec
done

#create for loop that prints out permissions for each file listed
for perm in ${dir[@]};
do
    ls -ah $perm
done

# create a for loop for sudo abilites for users with home folder
for sudopriv in ${users[@]};
do
    for item in 

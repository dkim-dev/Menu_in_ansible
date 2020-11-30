#!/bin/bash
# Colors
BIRed='\033[1;91m'            # Red
BIGreen='\033[1;92m'          # Green
BIYellow='\033[1;93m'         # Yellow
BIBlue='\033[1;94m'           # Blue
BIPurple='\033[1;95m'         # Purple
BICyan='\033[1;96m'           # Cyan
NORMAL='\033[0;39m'
clear
# Menu script
srv_list=( $(cat /etc/ansible/hosts | grep '\[' | sed 's/\[/ /g' | sed 's/\]/ /g') )
input="None"
target="None"
my_head()
{
  echo -e $BIBlue"-----------------------------------------------------------------------"
         echo -e " Automation tool  to automate d2d Unix Tasks!!\c"
         echo -e "\t Target Server: $target"
         echo -e "-----------------------------------------------------------------------" $NORMAL
}

while true
do
my_head
   echo -e $BIGreen"Welcome to Administration menu! \n" $NORMAL
   echo -e $BIYellow" 1. Pre-Validation \n"
   echo -e " 2. User Administration \n"
   echo -e " 22. Target Server groups \n"
   echo -e " 3. Run AD Hoc Commands \n" $NORMAL
   echo -e $BIRed" 0. Exit \n" $NORMAL
   read -p 'Please select menu: ' cho
   case $cho in

   0)
   break
   ;;
   1)
   if [ $target = "None" ] ; then
     echo -e "Select Target Server from menu 22"
     read dummy
     clear
     else
   echo "Welcome to Pre-Validation"
   sleep 4
   fi
   ;;
   2)
   clear
   if [ $target = "None" ] ; then
     echo -e "Select Target Server from menu 22"
     read dummy
     clear
     else
   while true
   do
     my_head
     echo -e $BIPurple"1. User Creation \n"
     echo -e "2. User removal \n"
     echo -e "3. Group add \n" $NORMAL
     echo -e $BIRed"0. Exit \n" $NORMAL
     read cho
     case $cho in
     0)
     clear
     break
     ;;
     1)
     echo -e "Welcome to User Creation \n"
     ;;
     2)
     echo -e "Welcome to User Removal \n"
     ;;
     3)
     echo -e "Welcome to Group Add \n"
     ;;
     *)
     echo -e "Wrong choice! \n"
     read dummy
     clear
     continue
     ;;
     esac
   done
   fi
   ;;
   3)
   if [ $target = "None" ] ; then
     echo -e "Select Target Server from menu 22"
     read dummy
     clear
     else
   echo "Welcome to Ad Hoc commands"
   sleep 4
   fi
   ;;
   22)
   clear
   while true
   do
     my_head
     echo -e " 1. Target Server \n"
     echo -e " 0. Exit \n"
     echo -e "Enter your choice: "
     read cho
     case $cho in
     0)
     clear
     break
     ;;
     1)
       echo -e "-----------------------------------------------------------------------"
       echo -e "Availiable Env : All -> for All Server in this Env of Host IP"
       for item in "${srv_list[@]}"; do echo "$item"; done
       echo -e "-----------------------------------------------------------------------"
       echo -e "Enter a group: \c"
       read input
       if [[ ! " ${srv_list[@]} " =~ " ${input} " ]] ;then
          echo -e "There is no $input in the list !!!!! Try again \n"
          read dummy
          clear
       else
          target="$input"
          clear
       fi
     ;;
     *)
     echo -e "Wrong choice !!!!! \n"
     read dummy
     clear
     continue
     ;;
     esac
   done
   ;;
   *)
   echo -e "Wrong choice !!!!! \n"
   read dummy
   clear
   continue
   ;;
  esac
done

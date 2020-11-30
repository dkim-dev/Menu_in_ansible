#!/bin/bash
echo -e "Please select your choice from below menu"
echo -e "a). FTP Service"
echo -e "Please enter your selection : "
read input
################################################
case $input in
a)
cd /home/sverma/ansible/nwr/check_service_status
ansible-playbook ser1.yml -K
;;

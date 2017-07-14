#!/bin/bash
#user password parameter to avoid user password prompt
mypassword=$1

#Repository URL
git_URL="https://github.com/soulkanarprograms/DevOps.git"

#If mypassword is set then do not ask for pasword in prompt command
if [ -z '$mypassword' ] ; then

	#Epel-Release Repository Installation
	echo mypassword | sudo -S yum install -y epel-release 

	#Ansible Installation
	echo mypassword | sudo -S yum install -y ansible

	#Git Installation
	echo mypassword | sudo -S yum install git -y

else

	#Epel-Release Repository Installation
	sudo yum install -y epel-release 

	#Ansible Installation	
	sudo yum install -y ansible

	#Git Installation	
	sudo yum install git -y

fi

#Clone Git Repository
git clone $git_URL

#Execute Ansible host_playbook
ansible-playbook $PWD/DevOps/infra/host_installation/host_playbook.yml --connection=local --extra-vars "ansible_sudo_pass=$mypassword"

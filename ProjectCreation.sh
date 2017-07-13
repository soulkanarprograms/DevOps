#!/bin/bash

git_URL="https://github.com/soulkanarprograms/DevOps.git"

sudo yum install -y epel-release 
sudo yum install -y ansible
sudo yum install git -y

git clone $git_URL

ansible-playbook $PWD/DevOps/infra/host_installation/host_playbook.yml --connection=local
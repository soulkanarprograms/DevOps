#!/bin/bash

git_URL="https://github.com/"

sudo yum install -y epel-release 
sudo yum install -y ansible
sudo yum install git -y

git clone $git_URL

ansible-playbook /infra/host_installation/playbook.yml --connection=local
#!/bin/bash
Vagrant_Url=$1
program="Vagrant"

condition=$(which $program 2>/dev/null | grep -v "not found" | wc -l)

if [ $condition -eq 0 ] ; then
    
    # Install Vagrant
	yum -y install $Vagrant_Url

fi 

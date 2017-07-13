#!/bin/bash
Virtualbox_Version=$1

program="VirtualBox"

condition=$(which $program 2>/dev/null | grep -v "not found" | wc -l)

if [ $condition -eq 1 ] ; then
    
    # Install dependencies
	yum -y install gcc make patch  dkms qt libgomp
	yum -y install kernel-headers kernel-devel fontforge binutils glibc-headers glibc-devel

	# Install VirtualBox
	cd /etc/yum.repos.d
	wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
	yum install $Virtualbox_Version

	# Check that you have the kernel sources downloaded for your running kernel version (if they don't match you might need to yum update and reboot)
	ls /usr/src/kernels/
	uname -r

	# Build the VirtualBox kernel module 
	export KERN_DIR=/usr/src/kernels/$(uname -r)
	/sbin/rcvboxdrv setup
fi 

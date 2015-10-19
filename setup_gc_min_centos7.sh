#!/usr/bin/env bash
## initial install script that just sets up the base tools that I need, you should log is as root and then call:
## curl -L https://raw.github.com/steveash/devops/master/scriptname | sh
## wget -qO- https://raw.github.com/steveash/devops/master/setup_centos7 | sh
#set -e

#read -p "Add user to sudoers? Enter username or blank to skip" vvv
#echo "$vvv ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${vvv}_sudoer

echo updating system
yum update -y

yum install -y wget

# get the centos extra packages
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

rpm -Uvh rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
rpm -ivh epel-release-7-5.noarch.rpm

######## tools 
echo installing essentials and build tools

echo installing general system software 
yum install -y curl htop speedometer byobu tmux emacs nano net-tools iftop telnet bind-utils dtrace sshpass vim python-devel
yum group install -q -y "Development Tools"

echo installing file compression utils
yum install -y zip unzip p7zip-full rsync

wget -qO- https://bootstrap.pypa.io/get-pip.py | python
pip install -q ansible

#echo installing java
#sudo wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
#sudo rpm -ivh jdk-8u45-linux-x64.rpm

echo '******************** ALL DONE ***************************'


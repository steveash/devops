#!/usr/bin/env bash
## initial install script that just sets up the base tools that I need, you should log is as root and then call:
## curl -L https://raw.github.com/steveash/devops/master/scriptname | sh
## wget -qO- https://raw.github.com/steveash/devops/master/setup_centos7 | sh
#set -e

#read -p "Add user to sudoers? Enter username or blank to skip" vvv
#echo "$vvv ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${vvv}_sudoer

echo updating system
sudo yum update -y

sudo yum install -y wget

# get the centos extra packages
sudo wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
sudo wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

sudo rpm -Uvh rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
sudo rpm -ivh epel-release-7-5.noarch.rpm

######## tools 
echo installing essentials and build tools

echo installing git
sudo yum install -y git

echo installing general system software 
sudo yum install -y zsh curl htop speedometer byobu tmux emacs nano net-tools iftop telnet dtrace

echo installing file compression utils
sudo yum install -y zip unzip sharutils unrar p7zip-full rar

echo installing java
sudo wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
sudo rpm -ivh jdk-8u45-linux-x64.rpm

echo '******************** ALL DONE ***************************'


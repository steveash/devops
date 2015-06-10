#!/usr/bin/env bash
## initial install script that just sets up the base tools should be run as root
##

apt-get update -y
apt-get install -y wget git zsh curl htop byobu tmux emacs nano net-tools telnet zip unzip sharutils unrar p7zip-full rar

echo installing java
add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java8-installer oracle-java8-set-default

echo '*************** ALL DONE ******************'

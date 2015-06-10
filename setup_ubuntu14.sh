#!/usr/bin/env bash
## initial install script that just sets up the base tools should be run as root
##

sudo apt-get update -y
sudo apt-get install -y wget git zsh curl htop byobu tmux emacs nano net-tools telnet zip unzip sharutils unrar p7zip-full rar

echo installing java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer oracle-java8-set-default

echo '*************** ALL DONE ******************'

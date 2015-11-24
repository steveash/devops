#!/usr/bin/env bash

sudo yum install -y maven ant

curl -s get.gvmtool.net | bash
sed -i 's/gvm_auto_answer=.*/gvm_auto_answer=true/' ~/.gvm/etc/config 

echo forcing gvm-init
. "~/.gvm/bin/gvm-init.sh"

gvm install groovy
gvm install gradle

echo '********************************************'
echo ' ALL DONE'
echo '********************************************'

#!/usr/bin/env bash

sudo yum install -y maven

curl -s get.gvmtool.net | bash
sed -i 's/gvm_auto_answer=.*/gvm_auto_answer=true/' ~/.gvm/etc/config 
gvm install groovy

echo '********************************************'
echo ' ALL DONE'
echo '********************************************'

#!/usr/bin/env bash

cd ~
mkdir -p code
cd code
git clone https://github.com/steveash/jg2p.git
cd jg2p
mvn clean install -DskipTests

echo '********************************************'
echo ' ALL DONE'
echo '********************************************'

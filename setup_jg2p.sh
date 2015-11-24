#!/usr/bin/env bash

cd ~
mkdir -p code
cd code
git clone https://github.com/steveash/jg2p.git
git clone https://github.com/steveash/kylm.git
git clone https://github.com/steveash/Mallet.git

cd kylm
ant dist
./install.sh

cd ../Mallet
mvn install -Pno-tests

cd ../jg2p
mvn install -DskipTests

echo '********************************************'
echo ' ALL DONE'
echo '********************************************'

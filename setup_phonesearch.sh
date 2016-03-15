#!/usr/bin/env bash

cd ~
mkdir -p code
cd code
git clone https://steveash@bitbucket.org/steveash/phonesearch.git

cd phonesearch
./gradlew clean classes

echo '********************************************'
echo ' ALL DONE'
echo '********************************************'

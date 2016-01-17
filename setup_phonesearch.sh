#!/usr/bin/env bash

cd ~
mkdir -p code
cd code
git clone git@bitbucket.org:steveash/phonesearch.git

cd phonesearch
./gradlew clean build --exclude-task test

echo '********************************************'
echo ' ALL DONE'
echo '********************************************'

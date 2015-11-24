#!/usr/bin/env bash
curl -L https://raw.github.com/steveash/devops/master/setup_user_base.sh | sh
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_45' >> ~/.zshrc
echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.zshrc

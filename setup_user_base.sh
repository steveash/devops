#!/usr/bin/env bash
## initial install script that just sets up the user.  Should be run from the user that will be used
## wget -qO- https://raw.github.com/steveash/devops/master/scriptname | sh
## curl -L https://raw.github.com/steveash/devops/master/scriptname | sh

echo copying public keys...
if [ ! -f ashdev_rsa.pub ]; then
    wget -q https://raw.github.com/steveash/devops/master/ashdev_rsa.pub
fi
if [ ! -f stevelaptop_rsa.pub ]; then
    wget -q https://raw.github.com/steveash/devops/master/stevelaptop_rsa.pub
fi

if [ ! -f ~/.ssh/authorized_keys ]; then
    mkdir -p ~/.ssh
    cat ashdev_rsa.pub >> ~/.ssh/authorized_keys
    cat stevelaptop_rsa.pub >> ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    chmod 700 ~/.ssh
    rm ashdev_rsa.pub*
    rm stevelaptop_rsa.pub*
fi

if [ ! -f ~/.tmux.conf ]; then
    touch ~/.tmux.conf
    echo 'set-option -g prefix C-a' >> ~/.tmux.conf
    echo 'bind-key C-a last-window' >> ~/.tmux.conf
    echo 'set -g base-index 1' >> ~/.tmux.conf
fi

##### zsh and shell config stuff
echo clone ohmyzsh
sudo curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
command -v zsh | sudo tee -a /etc/shells
sed -i 's/plugins=\(.*\)/plugins=(git z extract)/' .zshrc
sudo chsh -s /usr/bin/zsh

git config --global user.email "stevemash@gmail.com"
git config --global user.name "Steve Ash"

exec zsh

echo ***************************************************
echo  ALL DONE
echo ***************************************************



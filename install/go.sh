#!/bin/bash
. <(wget -qO- https://raw.githubusercontent.com/f5nodes/root/main/install/default.sh)
version=$(curl --silent https://go.dev/VERSION?m=text | head -n 1)
https://go.dev/VERSION?m=text
wget "https://golang.org/dl/$version.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "$version.linux-amd64.tar.gz"
sudo rm "$version.linux-amd64.tar.gz"
echo 'export GOROOT=/usr/local/go' >> $HOME/.bash_profile
echo 'export GOPATH=$HOME/go' >> $HOME/.bash_profile
echo 'export GO111MODULE=on' >> $HOME/.bash_profile
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> $HOME/.bash_profile && . $HOME/.bash_profile
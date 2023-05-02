#!/bin/bash
. <(wget -qO- https://raw.githubusercontent.com/f5nodes/root/main/install/default.sh)
sudo curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
sleep 1
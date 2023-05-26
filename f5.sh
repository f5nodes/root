#!/bin/bash
# Script to install any node:
# . <(wget -qO- sh.f5nodes.com) [name] [-y]
# -y automatic yes to prompt; skip confirmation.
#
# See instructions here:
# github.com/f5nodes/root

# Default vars & funcs
script_link="https://raw.githubusercontent.com/f5nodes/$1/main/setup.sh"
logo_link="https://raw.githubusercontent.com/f5nodes/root/main/logo/$2.sh"
logo_link_d="https://raw.githubusercontent.com/f5nodes/root/main/logo/logo.sh"
available_nodes="https://raw.githubusercontent.com/f5nodes/root/main/available.sh"
skip=false; [ "$2" == "-y" ] && skip=true
confirm() {
    [ $skip == true ] && return 0
    read -r -p "${1:-Continue? [y/n]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

# ARG 1: if node name is empty
if [ -z "$1" ]; then
    echo -e "🖇️  \e[91mUSAGE: . <(wget -qO- sh.f5nodes.com) [name] [-y]\e[0m"
    echo -e "🖇️  \e[91m-y automatic yes to prompt; skip confirmation.\e[0m"
    . <(wget -qO- $available_nodes)
    return 1 2>/dev/null; exit 1
fi

# script execute
if wget -q --spider $script_link; then
    if wget -q --spider $logo_link; then
        . <(wget -qO- $logo_link)
    else
        . <(wget -qO- $logo_link_d)
    fi
    echo -e "\e[93mYou select installing \e[92m${1^}\e[0m ⏳"
    confirm && . <(wget -qO- $script_link)
else
    echo -e  "\e[91m❌ This node doesn't exist!\e[0m"
    echo -e  "\e[91m⭕ Available nodes: \e[4mgithub.com/f5nodes\e[0m"
    confirm 'See available nodes list? [y/n]' && . <(wget -qO- $available_nodes)
    return 1 2>/dev/null; exit 1
fi
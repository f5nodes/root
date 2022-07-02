#!/bin/bash
# Script to install any node:
# . <(wget -qO- sh.f5nodes.com) [name]* [language]
#
# See instructions here:
# github.com/f5nodes

# Default vars & funcs
languages="en uk"
language="en"
script_link="https://raw.githubusercontent.com/f5nodes/$1/main/setup.sh"
logo_link="https://raw.githubusercontent.com/f5nodes/root/main/logo/$3.sh"
logo_link_d="https://raw.githubusercontent.com/f5nodes/root/main/logo/logo.sh"
available_nodes="https://raw.githubusercontent.com/f5nodes/root/main/available.sh"
confirm() {
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
    echo -e  "\e[91mUSAGE: \e[4m. <(wget -qO- sh.f5nodes.com) [name]* [language]\e[0m"
    wget -qO- $available_nodes
    return 1 2>/dev/null; exit 1
fi

# ARG 2: if language is provided by user
if [ -n "$2" ]; then
    language=${2,,}
fi
if ! echo "$languages" | grep -Fqw "$language"; then
    echo -e "\n\e[91mLanguage is not supported, you can make a pull request with here - \e[4mgithub.com/f5nodes/$1\e[0m\n"
    return 1 2>/dev/null; exit 1
fi

# script execute 
if wget -q --spider $script_link; then
    if wget -q --spider $logo_link; then
        . <(wget -qO- $logo_link)
    else
        . <(wget -qO- $logo_link_d)
    fi
    echo -e "\n\e[93mYou select installing the node \e[92m${1^} \e[93mwith \e[92m${language^^} \e[93mlanguage!\e[0m"
    confirm && . <(wget -qO- $script_link) $language
else
    echo -e  "\n\e[91mERROR: This node doesn't exist!\e[0m"
    echo -e  "\e[91mERROR: Available nodes: \e[4mgithub.com/f5nodes\e[0m"
    confirm 'See available nodes list? [y/n] ' && wget -qO- $available_nodes
    return 1 2>/dev/null; exit 1
fi
#!/bin/bash

# DEFAULT VARS & FUNCS
languages="en uk"
language="en"
link="https://raw.githubusercontent.com/f5nodes/$1/main/setup.sh"

confirm() {
    read -r -p "${1:-Continue? [y/n]} " response
    echo -e "\e[0m"
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
: ${1?"Usage: $0 ARGUMENT"}
# if [ -z "$1" ]; then
# 	echo -e  "\n\e[91mERROR: Enter a node name as a first argument!\e[0m"
# 	echo -e  "\e[91mERROR: Example: \e[4mbash $0 <node name> <language> (optional)\e[0m\n"
# 	exit 1
# fi
# ARG 2: if language is provided by user
[ -n "$2" ] && language=${2,,}
if !(echo "$languages" | grep -Fqw "$language"); then
	echo -e "\n\e[91mLanguage is not supported, you can make a pull request with here - \e[4mgithub.com/f5nodes/$1\e[0m\n"
	exit 1
fi

if wget -q --spider $link; then
	echo -e "\n\e[93mYou select installing the node \e[92m${1^} \e[93mwith \e[92m${language^^} \e[93mlanguage!\e[0m"
	confirm $'\e[93mContinue?\e[92m' && wget -qO- $link | bash -s $language
else
	echo -e  "\n\e[91mERROR: This node doesn't exist!\e[0m"
	echo -e  "\e[91mERROR: Available nodes: \e[4mgithub.com/f5nodes\e[0m\n"
fi

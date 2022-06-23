#!/bin/bash
language="en"

# if node name is empty
if [ -z "$1" ]; then
	echo -e  "\n\e[91mERROR: Enter a node name as a first argument!\e[0m"
	echo -e  "\e[91mERROR: Example: \e[4mbash $0 <node name> <language> (optional)\e[0m\n"
	exit 1
fi

# if language is provided by user
if [ -n "$2" ]; then
	language=${2,,}
fi

if wget -q --spider https://raw.githubusercontent.com/f5nodes/$1/main/setup.sh; then
	echo -e "\n\e[93mYou select installing the node \e[92m${1^} \e[93mwith \e[92m${language^^} \e[93mlanguage!\e[0m"
	sleep 2
	wget -qO- https://raw.githubusercontent.com/f5nodes/$1/main/setup.sh | bash -s $language
else
	echo -e  "\n\e[91mERROR: This node doesn't exist!\e[0m"
	echo -e  "\e[91mERROR: Available nodes: \e[4mgithub.com/f5nodes\e[0m\n"
fi

# confirm() {
#     read -r -p "${1:-Continue? [y/n]} " response
#     case "$response" in
#         [yY][eE][sS]|[yY]) 
#             true
#             ;;
#         *)
#             false
#             ;;
#     esac
# }
# confirm && . <(wget -qO- https://raw.githubusercontent.com/f5nodes/$1/main/setup.sh)
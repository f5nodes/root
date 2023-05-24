#!/bin/bash

repositories=$(curl -s https://api.github.com/orgs/f5nodes/repos?sort=full_name | jq -r '.[].name')
exclude="root wiki"

echo "┌───────────────────────┐"
echo "│       Available       │"
echo "│     Nodes & Tools     │"
echo "├───────────────────────┤"

while IFS= read -r repo_name; do
  if ! echo "$exclude" | grep -Fqw "$repo_name"; then
    printf "│ %-20s  │\n" "$repo_name"
  fi
done <<< "$repositories" | grep -vE '^[[:space:]]*$'

echo "└───────────────────────┘"
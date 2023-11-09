#!/bin/bash

# Path to the file containing a list of repository URLs
input_file="urlist.txt"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file not found: $input_file"
  exit 1
fi

# Loop through each repository URL in the input file
while IFS= read -r repo_url; do
  # Remove surrounding double quotes and fork the repository using the GitHub CLI
  repo_url=$(echo "$repo_url" | sed 's/^"\(.*\)"$/\1/')
  gh repo fork "$repo_url" --remote=true
done < "$input_file"

echo "Forking completed for all repositories in $input_file"


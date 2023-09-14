#!/bin/bash

# Check if the command-line argument for the end folder is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <end_folder>"
  exit 1
fi

# Define the end folder from the command-line argument
end_folder="$1"

# Check if the end folder exists
if [ ! -d "$end_folder" ]; then
  echo "End folder $end_folder does not exist. Exiting the script now."
  exit 1
fi

# Get the parent directory of the end folder
parent_directory="$(dirname "$end_folder")"

# List the contents of the specified folder
echo "Contents of Folder $end_folder:"
ls "$end_folder"

# List the contents of folders above the specified folder, excluding sibling folders
current_folder="$parent_directory"

while [ "$current_folder" != "/" ]; do
  if [ -z "$(ls -A "$current_folder" | grep -v "$end_folder")" ]; then
    break
  fi

  echo "Contents of Folder $current_folder:"
  ls "$current_folder" | grep -v "$end_folder"

  current_folder="$(dirname "$current_folder")"
done

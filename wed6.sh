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

# Get a list of folder names in reverse order from the specified folder to the parent directory
folders=("$end_folder")
current_folder="$end_folder"

while [ "$current_folder" != "$parent_directory" ]; do
  current_folder="$(dirname "$current_folder")"
  folders=("$current_folder" "${folders[@]}")
done

# List the contents of folders in the obtained order
for folder in "${folders[@]}"; do
  if [ -d "$folder" ]; then
    echo "Contents of Folder $folder:"
    ls "$folder"
  else
    echo "Folder $folder does not exist."
  fi
done

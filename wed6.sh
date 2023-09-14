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

# Function to list contents of a folder and its subfolders recursively
list_contents_recursive() {
  local folder="$1"
  local indent="$2"
  
  echo "${indent}Contents of Folder $folder:"
  
  for item in "$folder"/*; do
    if [ -d "$item" ]; then
      # Recursively list contents of subfolder
      list_contents_recursive "$item" "$indent  "
    elif [ -f "$item" ]; then
      echo "${indent}[File] $(basename "$item")"
    fi
  done
}

# List the contents of folders and subfolders in reverse order
current_folder="$end_folder"

while [ "$current_folder" != "$parent_directory" ]; do
  list_contents_recursive "$current_folder" ""
  current_folder="$(dirname "$current_folder")"
done

# List the contents of the first folder in the parent directory
list_contents_recursive "$parent_directory" ""

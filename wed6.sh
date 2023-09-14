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

# Function to list contents of a folder and its immediate parent folder
list_contents() {
  local folder="$1"
  local parent_folder=$(dirname "$folder")

  # List the contents of the specified folder
  if [ -d "$folder" ]; then
    echo "Contents of Folder $folder:"
    ls "$folder"
  else
    echo "Folder $folder does not exist."
    exit 1
  fi

  # List the contents of the parent folder (one level above)
  if [ "$parent_folder" != "/" ] && [ "$parent_folder" != "$folder" ]; then
    echo "Contents of Parent Folder $parent_folder:"
    ls "$parent_folder"
  fi
}

# List contents of the specified folder and its immediate parent folder
list_contents "$PWD/$end_folder"

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

# Function to list contents of a folder and its parent folders recursively
list_contents() {
  local folder="$1"
  while [ "$folder" != "/" ]; do
    if [ -d "$folder" ]; then
      echo "Contents of Folder $folder:"
      ls "$folder"
    else
      echo "Folder $folder does not exist."
      exit 1
    fi
    folder=$(dirname "$folder")
    if [ "$folder" == "/" ]; then
      break
    fi
  done
}

# List contents of the specified folder and its parent folders
list_contents "$end_folder"

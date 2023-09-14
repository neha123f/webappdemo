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

# Function to list contents of a folder
list_contents() {
  local folder="$1"

  # List the contents of the specified folder
  if [ -d "$folder" ]; then
    echo "Contents of Folder $folder:"
    ls "$folder"
  else
    echo "Folder $folder does not exist."
  fi
}

# List contents of the specified folder
list_contents "$PWD/$end_folder"

# Get the parent folder (one level above)
parent_folder=$(dirname "$PWD/$end_folder")

# List contents of the parent folder if it's not the root directory
if [ "$parent_folder" != "/" ]; then
  list_contents "$parent_folder"
fi

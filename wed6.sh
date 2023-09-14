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
list_contents_recursive() {
  local folder="$1"
  
  echo "Contents of Folder $folder:"
  ls "$folder"
  
  # Check if we've reached the root directory
  if [ "$folder" != "/" ]; then
    list_contents_recursive "$(dirname "$folder")"
  fi
}

# Call the recursive function to list contents
list_contents_recursive "$end_folder"

#!/bin/bash

# Function to list contents of a folder and its parent folders recursively
list_contents_recursive() {
  local folder="$1"
  
  echo "Contents of Folder $folder:"
  ls "$folder"
  
  # Check if we've reached the current working directory
  if [ "$folder" != "$(pwd)" ]; then
    list_contents_recursive "$(dirname "$folder")"
  fi
}

# Get the current working directory
current_directory="$(pwd)"

# Prompt the user for a folder number
read -p "Enter folder number: " folder_number

# Check if the folder number is valid
if [ -d "$folder_number" ]; then
  # Display the contents of the specified folder
  list_contents_recursive "$folder_number"
else
  echo "Folder $folder_number does not exist."
fi

#!/bin/bash

# Prompt the user for a folder number
read -p "Enter folder number: " folder_number

# Check if the folder with the specified number exists
if [ -d "$folder_number" ]; then
  # Display the contents of the specified folder
  echo "Contents of Folder $folder_number:"
  ls "$folder_number"
  
  # Get the parent directory of the specified folder
  parent_directory="$(dirname "$folder_number")"
  
  # Display the contents of the folder above it (parent directory)
  echo "Contents of Folder $parent_directory:"
  ls "$parent_directory"
else
  echo "Folder $folder_number does not exist."
fi

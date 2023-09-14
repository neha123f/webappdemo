#!/bin/bash

# Get the current directory
current_directory=$(pwd)

# List the contents of the current directory
current_directory_contents=$(ls "$current_directory")

# Ask the user for input
read -p "Enter a folder name: " user_input

# Check if the user input folder exists in the current directory
if [ -d "$current_directory/$user_input" ]; then
  found=false
  # Loop through and print the contents of folders until the user's input folder
  for folder in "$current_directory"/*; do
    if [ -d "$folder" ]; then
      if [ "$folder" == "$current_directory/$user_input" ]; then
        found=true
      elif [ "$found" == "true" ]; then
        echo "Contents of Folder $folder:"
        ls "$folder"
      fi
    fi
  done
  if [ "$found" == "false" ]; then
    echo "Folder $user_input not found."
  fi
else
  echo "Folder $user_input does not exist in the current directory."
fi

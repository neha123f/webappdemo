#!/bin/bash

# Get the current directory
current_directory=$(pwd)

# List the contents of the current directory
#echo "Contents of Current Directory ($current_directory):"
#ls "$current_directory"

user_input=$1
# Check if the user input folder exists in the current directory
if [ -d "$current_directory/$user_input" ]; then
  # Loop through and print the contents of folders until the user's input folder
  for folder in "$current_directory"/*; do
    if [ -d "$folder" ]; then
      echo "Contents of Folder $i:"
      ls "$folder"
      if [ "$folder" == "$current_directory/$user_input" ]; then
        break
      fi
    fi
  done
else
  echo "Folder $user_input does not exist in the current directory."
  exit 1
fi

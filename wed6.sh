#!/bin/bash

# Get the current directory
current_directory=$(pwd)

# List the contents of the current directory
current_directory_contents=$(ls "$current_directory")

# Ask the user for input (expecting a number)
#read -p "Enter a folder number: " user_input
user_input=$1
# Check if the user input is a valid number
if ! [[ "$user_input" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a valid number."
  exit 1
fi

# Loop through and print the contents of folders that are less than or equal to the user's input
for folder in "$current_directory"/*; do
  if [ -d "$folder" ]; then
    folder_name=$(basename "$folder")
    if [[ "$folder_name" =~ ^[0-9]+$ ]] && [ "$folder_name" -le "$user_input" ]; then
      echo "Contents of Folder $folder_name:"
      ls "$folder"
    fi
  fi
done

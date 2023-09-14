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

# List the contents of folders from the specified folder to folder 1
current_folder="$end_folder"
while [ "$current_folder" != "0" ]; do
  if [ -d "$current_folder" ]; then
    echo "Contents of Folder $current_folder:"
    ls "$current_folder"
  else
    echo "Folder $current_folder does not exist."
  fi

  # Decrement the current folder number
  current_folder=$((current_folder - 1))
done

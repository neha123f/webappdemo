#!/bin/bash

# Define the start folder number (change as needed)
start_folder=$1

# Check if the start folder exists
if [ -d "$start_folder" ]; then
  current_folder="$start_folder"

  # Loop until a folder doesn't exist
  while [ -d "$current_folder" ]; do
    echo "Contents of Folder $current_folder:"
    ls "$current_folder"

    # Decrease the folder number for the next iteration
    current_folder=$((current_folder - 1))
  done
else
  echo "Folder $start_folder does not exist. Exiting the script now."
  exit 1
fi

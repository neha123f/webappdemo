#!/bin/bash

# Define global variables
WORK_DIR="D:/bashscripts"

# Prompt the user for the number of folders to display
read -p "Enter the number of folders to display from '$WORK_DIR': " num_to_display

# Remove leading and trailing whitespace from the input
num_to_display="${num_to_display%"${num_to_display##*[![:space:]]}"}"

# Check if the global directory path is a valid directory
if [ -d "$WORK_DIR" ]; then
  # Use 'find' to list all directories within the global directory
  all_folders=($(find "$WORK_DIR" -mindepth 1 -maxdepth 1 -type d))

  # Get the actual number of folders found
  num_found_folders="${#all_folders[@]}"

  if [ "$num_found_folders" -eq 0 ]; then
    echo "No folders found in '$WORK_DIR'."
  elif [ "$num_found_folders" -lt "$num_to_display" ]; then
    echo "Only $num_found_folders folder(s) found in '$WORK_DIR'."
  else
    echo "$num_to_display folder(s) requested from '$WORK_DIR':"
    for ((i = 0; i < num_to_display; i++)); do
      echo "${all_folders[i]}"
    done
  fi
else
  echo "Invalid global directory path: '$WORK_DIR'"
fi



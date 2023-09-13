#!/bin/bash

# Define global variables
WORK_DIR="D:\bashscripts"

# Prompt the user for the number of folders to display
read -p "Enter the number of folders to display from '$WORK_DIR': " num_to_display

# Check if the global directory path is a valid directory
if [ -d "$WORK_DIR" ]; then
  # Use 'find' to list the first 'num_to_display' directories within the global directory
  find "$WORK_DIR"  -mindepth 1 -maxdepth 1 -type d | head -n "$num_to_display"
else
  echo "Invalid global directory path: '$WORK_DIR'"
fi


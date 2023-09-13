#!/bin/bash

# Define the range from 1 to N (change N to your desired value)
start_range=1
#read -p "Enter the folder number (1-10): " end_range

# Define the Git branch you want to switch to
git_branch="branch1"

# Change directory to the Git repository root
#cd /path/to/your/git/repo

# Switch to the specified Git branch
git checkout "$git_branch"

# Check if the branch switch was successful
if [ $? -eq 0 ]; then
  echo "Switched to branch $git_branch successfully."

  # Iterate through the folders in the specified range
  for ((i = end_range; i >= start_range; i--)); do
    folder_name="$i"

    # Check if the folder exists before listing its contents
    if [ -d "$folder_name" ]; then
      echo "Contents of Folder $folder_name:"
      ls "$folder_name"
    else
      echo "Folder $folder_name does not exist. Exiting the script now."
      exit 127
    fi
  done
else
  echo "Failed to switch to branch $git_branch. Exiting the script now."
  exit 1
fi

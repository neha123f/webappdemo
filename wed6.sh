#!/bin/bash

# Prompt the user for a folder number
#read -p "Enter folder number: " folder_number
folder_number=$1
# Function to list contents of a folder and its parent folders recursively
list_contents_recursive() {
  local folder="$1"
  
  echo "Contents of Folder $folder:"
  ls "$folder"
  
  # Check if we've reached the root directory
  if [ "$folder" != "/" ]; then
    list_contents_recursive "$(dirname "$folder")"
  fi
}

# Create a temporary file for the directory structure
tempfile=$(mktemp)

# Find all directories in the current directory and its subdirectories
find . -type d -print | sed 's#^\./##' | sort > "$tempfile"

# Check if the folder number is valid
if ! grep -q "^$folder_number$" "$tempfile"; then
  echo "Folder $folder_number does not exist."
  rm "$tempfile"
  exit 1
fi

# Read the directory structure from the temporary file
found=false

while read -r line; do
  if [ "$line" = "$folder_number" ]; then
    found=true
  fi
  
  if "$found"; then
    list_contents_recursive "$line"
  fi
done < "$tempfile"

# Remove the temporary file
rm "$tempfile"

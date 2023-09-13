#!/bin/bash

# Define a global variable for the directory path
directory="D:\bashscripts"

# Function to display a specified number of folders
display_folders() {
    local num_to_display=$1
    local folders=($(find "$directory" -mindepth 1 -maxdepth 1 -type d))
    
    if [ "$num_to_display" -le "${#folders[@]}" ]; then
      find "$directory" -mindepth 1 -maxdepth 1 -type d | head -n "$num_to_display" 
    else
        echo "Not enough folders in the directory."
    fi
}

# Main script

# Ask the user for the number of folders to display
read -p "Enter the number of folders to display: " num_to_display

# Call the function to display folders
display_folders "$num_to_display"

# Count the number of folders (optional)
total_folders=$(find "$directory" -mindepth 1 -maxdepth 1 -type d | wc -l)
echo "Total folders in the directory: $total_folders"


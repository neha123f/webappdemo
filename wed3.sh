#!/bin/bash


start_range=1

read -p "Enter the folder number (1-10): " end_range
 

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

#!/bin/bash

# Get the current directory
current_directory=$(pwd)

# List the contents of the current directory
echo "Contents of Current Directory ($current_directory):"
ls "$current_directory"

# Ask the user for input
#read -p "Enter a folder name: " user_input
user_input=$1
# Check if the user input folder exists in the current directory
if [ -d "$current_directory/$user_input" ]; then
  # Loop through and print the contents of folders until the user's input folder
  for folder in "$current_directory"/*; do
    if [ -d "$folder" ]; then
      echo "Contents of Folder $folder:"
      ls "$folder"
      if [ "$folder" == "$current_directory/$user_input" ]; then
        break
      fi
    fi
  done
else
  echo "Folder $user_input does not exist in the current directory."
fi
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

# Function to list contents of a folder
list_contents() {
  local folder="$1"

  # List the contents of the specified folder
  if [ -d "$folder" ]; then
    echo "Contents of Folder $folder:"
    ls "$folder"
  else
    echo "Folder $folder does not exist."
  fi
}

# List contents of the specified folder
list_contents "$PWD/$end_folder"

# Get the parent folder (one level above)
parent_folder=$(dirname "$PWD/$end_folder")

# List contents of the parent folder if it's not the root directory
if [ "$parent_folder" != "/" ]; then
  list_contents "$parent_folder"
fi

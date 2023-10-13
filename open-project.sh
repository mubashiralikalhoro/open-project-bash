#!/bin/bash

# Set the directory you want to navigate
directory="/Users/mubashirali/Projects"
android_studio_path="/Applications/Android Studio.app"

# Change to the initial directory
cd "$directory" || { echo "Directory not found"; exit 1; }

# Create an array of folder names in the directory
folders=($(find . -maxdepth 1 -type d | sed 's/.\///' | sort))

# Initialize the selection variable
selection=1

while true; do
  clear  # Clear the screen
  echo "Select a project:"
  
  # Loop through the folders and highlight the selected one
  for ((i = 0; i < ${#folders[@]}; i++)); do
    if [ $((i + 1)) -eq $selection ]; then
      echo "-> ${folders[i]}"
    else
      echo "   ${folders[i]}"
    fi
  done
  
  # Read user input
  read -rsn3 input

  # Check for arrow key input
  case "$input" in
    $'\e[A') # Up arrow
      ((selection--))
      [ $selection -lt 1 ] && selection=${#folders[@]}
      ;;
    $'\e[B') # Down arrow
      ((selection++))
      [ $selection -gt ${#folders[@]} ] && selection=1
      ;;
    "")   # Enter key
      selected_folder="${folders[selection - 1]}"
      break
      ;;
  esac
done


# open in option
options=("vscode" "android_studio" "terminal" "finder")

# Initialize the selection variable
open_selection=1

while true; do
  clear  # Clear the screen
  echo "open" $selected_folder "in:"
  
  # Loop through options
  for ((i = 0; i < ${#options[@]}; i++)); do
    if [ $((i + 1)) -eq $open_selection ]; then
      echo "-> ${options[i]}"
    else
      echo "   ${options[i]}"
    fi
  done
  
  # Read user input
  read -rsn3 inputIDE

  # Check for arrow key input
  case "$inputIDE" in
    $'\e[A') # Up arrow
      ((open_selection--))
      [ $open_selection -lt 1 ] && open_selection=${#options[@]}
      ;;
    $'\e[B') # Down arrow
      ((open_selection++))
      [ $open_selection -gt ${#options[@]} ] && open_selection=1
      ;;
    "")   # Enter key
      selected_ide="${options[open_selection - 1]}"
      break
      ;;
  esac
done


path="$directory/$selected_folder"

# vs code
if [ "$selected_ide" = "${options[0]}" ]; then
  cd "$selected_folder" || { echo "project not found"; exit 1; }
  code .
# android studio
elif [ "$selected_ide" = "${options[1]}" ]; then
  open -a "$android_studio_path" $path
# terminal 
elif [ "$selected_ide" = "${options[2]}" ]; then
  open -a Terminal "$path"
# finder
else
  cd "$selected_folder" || { echo "project not found"; exit 1; }
  open .
fi

clear
echo "Opening" $selected_folder in $selected_ide"..."






#/bin/bash
device_name="Pixel_7_API_VanillaIceCream"
directory="/Users/mubashirali/Projects"
android_studio_path="/Applications/Android Studio.app"

function open_android_emulator(){
    nohup emulator @$device_name &
}

function open_android_studio(){
    open -a "$android_studio_path" $path
}

function open_vs_code(){
    cd $path
    code .
}

function open_terminal(){
    open -a Terminal "$path"
}

function select_from_options(){
    local message=$1
    shift
    local options=("$@")   
    local selection=1
    while true; do
    clear
    echo $message
    
    # Loop through the options
    for ((i = 0; i < ${#options[@]}; i++)); do
        if [ $((i + 1)) -eq $selection ]; then
        echo "-> ${options[i]}"
        else
        echo "   ${options[i]}"
        fi
    done
    
    # Read user input
    read -rsn3 input

    # Check for arrow key input
    case "$input" in
        $'\e[A') # Up arrow
        ((selection--))
        [ $selection -lt 1 ] && selection=${#options[@]}
        ;;
        $'\e[B') # Down arrow
        ((selection++))
        [ $selection -gt ${#options[@]} ] && selection=1
        ;;
        "")   # Enter key
        selected_option="${options[selection - 1]}"
        break
        ;;
    esac
    done
}

#  Main ====>
# Change to the initial directory
cd "$directory" || { echo "Directory not found"; exit 1; }

# Select a folder to open
folders=($(find . -maxdepth 1 -type d | sed 's/.\///' | sort))
select_from_options "Select a folder to open : " "${folders[@]}"
path="$directory/$selected_option"

# Select IDE or Technology Used in the project to open;
options=("VS Code" "VS Code + Terminal" "VS Code + Terminal + Android Emulator" "Terminal" "Android Studio")


select_from_options "Open ($selected_option) in : " "${options[@]}"

# Open the selected folder in the selected IDE
echo "Opening $selected_option"
case $selected_option in
    "VS Code")
    open_vs_code
    ;;
    "VS Code + Terminal")
    open_vs_code
    ;;
    "VS Code + Terminal + Android Emulator")
    open_vs_code
    open_terminal
    open_android_emulator
    ;;
    "Terminal")
    open_terminal
    ;;
    "Android Studio")
    open_android_studio
    ;;
esac


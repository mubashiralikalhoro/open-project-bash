# Project Starter Script

This Bash script helps you quickly open and manage your Android development environment, including launching Android Studio, the Android Emulator, Visual Studio Code (VS Code), and a terminal. It provides an interactive interface to select projects and preferred tools.

## Features

- **Open Android Emulator:** Start the Android Emulator with a specified device.
- **Open Android Studio:** Launch Android Studio for a selected project.
- **Open VS Code:** Open the project in Visual Studio Code.
- **Open Terminal:** Open a terminal window in the project directory.
- **Interactive Selection:** Choose from multiple options to set up your development environment.

## Preview

![Preview of the script in action](/preview.gif)

## Prerequisites

- Bash shell
- Android Studio
- Android SDK (with Emulator)
- Visual Studio Code

## Usage

1. **Set Variables:**

   - Set `device_name` to the name of your Android Emulator device.
   - Set `directory` to the path of your projects folder.
   - Set `android_studio_path` to the path where Android Studio is installed.

2. **Run the Script:**

   - Make the script executable:
     ```bash
     chmod +x script.sh
     ```
   - Execute the script:
     ```bash
     ./script.sh
     ```

3. **Select Options:**
   - Use the arrow keys to navigate and press Enter to select an option.

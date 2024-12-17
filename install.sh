#!/bin/bash

# Directory where the symlinks will be created
SYMLINK_DIR="/usr/local/bin"

# List of your script filenames
SCRIPTS=("downloadYoutube" "hs" "pfind" "pullEveryRepo" "removeChar" "removeSpaceFromFileName" "removeUppercase" "tmux-session" "youtubeUrlTitleParser")

for script in "${SCRIPTS[@]}"; do
    # Full path to the original script
    ORIGINAL_SCRIPT_PATH="$(pwd)/$script"

    # Check if the script file exists
    if [ -f "$ORIGINAL_SCRIPT_PATH" ]; then
        # Creating a symlink in /usr/local/bin
        sudo ln -sf "$ORIGINAL_SCRIPT_PATH" "$SYMLINK_DIR/$script"
        echo "Symlink created for $script"
    else
        echo "Script $script not found in the current directory."
    fi
done

echo "All symlinks have been created."

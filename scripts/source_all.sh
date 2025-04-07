#!/bin/bash
# Script to source all scripts and files in the scripts-tools directory and its subdirectories

INSTALL_DIR="$HOME/script-tools"

# Recursively source all .sh files in the INSTALL_DIR and its subdirectories
find "$INSTALL_DIR" -type f -name "*.sh" | while read -r script; do
    if [ -f "$script" ]; then
        source "$script"
    fi
done


# Add INSTALL_DIR to PATH if not already present
if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
    export PATH="$PATH:$INSTALL_DIR"
fi
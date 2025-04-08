#!/bin/bash
# Script to source all scripts and files in the sh-toolkit directory and its subdirectories

INSTALL_DIR="$HOME/sh-toolkit"

# Function to source all .sh files in the INSTALL_DIR and its subdirectories
source_all_scripts() {
    local dir="$1"
    # Use a for loop to avoid subshell issues
    for script in $(find "$dir" -type f -name "*.sh"); do
        # Exclude this script (source_all.sh) from being sourced
        if [[ "$script" != "$INSTALL_DIR/source_all.sh" ]]; then
            source "$script"
        fi
    done
}

# Function to export all functions to make them available in non-interactive shells
export_all_functions() {
    echo "Exporting all functions..."
    declare -F | awk '{print $3}' | while read -r func; do
        export -f "$func"
    done
}

# Function to add INSTALL_DIR to PATH if not already present
add_install_dir_to_path() {
    if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
        echo "Adding $INSTALL_DIR to PATH..."
        export PATH="$PATH:$INSTALL_DIR"
    fi
}

# Source all scripts
source_all_scripts "$INSTALL_DIR"

# Export all functions
export_all_functions

# Add INSTALL_DIR to PATH
add_install_dir_to_path
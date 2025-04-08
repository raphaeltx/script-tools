#!/bin/bash
# Script to source all scripts and files in the sh-toolkit-tools directory and its subdirectories

INSTALL_DIR="$HOME/sh-toolkit-tools"

echo "Sourcing all scripts from $INSTALL_DIR..."

# Function to source all .sh files in the INSTALL_DIR and its subdirectories
source_all_scripts() {
    local dir="$1"
    # Use a for loop to avoid subshell issues
    for script in $(find "$dir" -type f -name "*.sh"); do
        # Exclude this script (source_all.sh) from being sourced
        if [[ "$script" != "$INSTALL_DIR/source_all.sh" ]]; then
            echo "Sourcing: $script"
            source "$script"
        fi
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

# Add INSTALL_DIR to PATH
add_install_dir_to_path
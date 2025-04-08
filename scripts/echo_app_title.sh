#!/bin/bash

# Function to echo an ASCII title with color
function echo_app_title() {
    local title="$1"
    local color='\033[0;36m'
    local no_color='\033[0m'

    echo "Echoing ASCII title for: $title"

    # Check if the title is provided
    if [[ -z "$title" ]]; then
        echo "Error: No title provided."
        return 1
    fi

    # Define the directory where ASCII title files are stored
    local ascii_dir="$HOME/sh-toolkit-tools/ascii_titles"

    # Construct the file path for the given title
    local ascii_file="${ascii_dir}/${title}_ascii_title.sh"

    echo "Looking for ASCII title file: $ascii_file..."

    # Check if the ASCII file exists
    if [[ -f "$ascii_file" ]]; then
        # Source the ASCII file to load its function
        source "$ascii_file"

        # Check if the function with the same name as the title exists
        if declare -f "$title" > /dev/null; then
            # Call the function with the same name as the title
            echo -e "${color}"
            "$title"
            echo -e "${no_color}"
        else
            echo "Error: Function '${title}' not found in '${ascii_file}'."
        fi
    else
        echo "Error: ASCII title file '${ascii_file}' not found."
    fi
}
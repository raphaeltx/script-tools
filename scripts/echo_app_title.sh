#!/bin/bash

# Function to echo an ASCII title with color
function echo_app_title() {
    local title="$1"
    local color='\033[0;36m'
    local no_color='\033[0m'

    # Check if the title is provided
    if [[ -z "$title" ]]; then
        echo "Error: No title provided."
        return 1
    fi

    # Define the directory where ASCII title files are stored
    local ascii_dir="$HOME/script-tools/ascii_titles"

    # Construct the file path for the given title
    local ascii_file="${ascii_dir}/${title}.sh"

    # Check if the ASCII file exists
    if [[ -f "$ascii_file" ]]; then
        # Echo the content of the ASCII file with color
        echo -e "${color}"
        source "$ascii_file"
        echo -e "${no_color}"
    else
        echo "Error: ASCII title file '${ascii_file}' not found."
    fi
}

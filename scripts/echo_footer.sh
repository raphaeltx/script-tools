#!/bin/bash

# Function to echo a footer message with a specific color
function echo_footer() {
    local footer_text=$1
    local color='\033[0;36m'
    local no_color='\033[0m'

    echo -e "${color}$footer_text${no_color}"
    echo ""
}

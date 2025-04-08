#!/bin/bash
# Installation script

# Exit immediately if a command exits with a non-zero status
set -e

# Define installation directories
INSTALL_DIR="$HOME/sh-toolkit"
ASCII_TITLES_DIR="$INSTALL_DIR/ascii_titles"

# Function to create necessary directories
create_directories() {
    echo "Creating installation directories..."
    mkdir -p "$INSTALL_DIR"
    mkdir -p "$ASCII_TITLES_DIR"
}

# Function to copy scripts to the installation directory
copy_scripts() {
    echo "Copying scripts to $INSTALL_DIR..."
    cp scripts/*.sh "$INSTALL_DIR"

    echo "Copying ASCII title files to $ASCII_TITLES_DIR..."
    cp scripts/ascii_titles/*.sh "$ASCII_TITLES_DIR"
}

# Function to make all scripts executable
make_scripts_executable() {
    echo "Making all scripts executable..."
    find "$INSTALL_DIR" -type f -name "*.sh" -exec chmod +x {} \;
}

# Function to add sourcing of source_all.sh to ~/.bashrc
add_source_to_bashrc() {
    echo "Adding sourcing of source_all.sh to ~/.bashrc..."
    if ! grep -q "# Source all scripts from sh-toolkit" ~/.bashrc; then
        echo -e "\n# Source all scripts from sh-toolkit" >> ~/.bashrc
        echo "source \$HOME/sh-toolkit/source_all.sh" >> ~/.bashrc
    fi
}

# Function to source source_all.sh directly
source_scripts() {
    echo "Sourcing source_all.sh directly..."
    source "$INSTALL_DIR/source_all.sh"
}

# Function to reload the shell to apply changes
reload_bashrc() {
    echo "Reloading shell..."
}

# Main installation process
main() {
    create_directories
    copy_scripts
    make_scripts_executable
    chmod +x "$INSTALL_DIR/source_all.sh"
    add_source_to_bashrc
    source_scripts
    echo "Installation complete. All functions and scripts are now globally available."
}

# Execute the main function
main
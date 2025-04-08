#!/bin/bash
# Uninstallation script for sh-toolkit

# Exit immediately if a command exits with a non-zero status
set -e

# Define installation directories
INSTALL_DIR="$HOME/sh-toolkit"

# Function to remove the installation directory
remove_installation_directory() {
    echo "Removing installation directory: $INSTALL_DIR..."
    rm -rf "$INSTALL_DIR"
}

# Function to remove sourcing of source_all.sh from ~/.bashrc
remove_sourcing_from_bashrc() {
    echo "Removing sourcing of scripts from ~/.bashrc..."
    sed -i '/# Source all scripts from sh-toolkit/d' ~/.bashrc
    sed -i '/source \$HOME\/sh-toolkit\/source_all.sh/d' ~/.bashrc
}

# Function to remove INSTALL_DIR from PATH in ~/.bashrc
remove_install_dir_from_path() {
    echo "Removing $INSTALL_DIR from PATH in ~/.bashrc..."
    sed -i "/export PATH=\$PATH:$INSTALL_DIR/d" ~/.bashrc
}

# Function to remove BASH_ENV from ~/.bashrc
remove_bash_env() {
    echo "Removing BASH_ENV from ~/.bashrc..."
    sed -i '/export BASH_ENV=.*sh-toolkit\/source_all.sh/d' ~/.bashrc
}

# Function to reload the shell
reload_shell() {
    echo "Reloading shell to apply changes..."
    source ~/.bashrc
}

# Main uninstallation process
main() {
    remove_installation_directory
    remove_sourcing_from_bashrc
    remove_install_dir_from_path
    remove_bash_env
    reload_shell
    echo "Uninstallation complete. All scripts, functions, and environment variables have been removed."
}

# Execute the main function
main
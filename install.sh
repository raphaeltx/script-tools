#!/bin/bash
# Installation script

# Exit immediately if a command exits with a non-zero status
set -e

# Define installation directories
INSTALL_DIR="$HOME/script-tools"
ASCII_TITLES_DIR="$INSTALL_DIR/ascii_titles"

# Create directories for the scripts and ASCII titles
echo "Creating installation directories..."
mkdir -p "$INSTALL_DIR"
mkdir -p "$ASCII_TITLES_DIR"

# Copy scripts to the installation directory
echo "Copying scripts to $INSTALL_DIR..."
cp scripts/*.sh "$INSTALL_DIR"

# Copy ASCII title files to the ASCII titles directory
echo "Copying ASCII title files to $ASCII_TITLES_DIR..."
cp scripts/ascii_titles/*.sh "$ASCII_TITLES_DIR"

# Make all files in the installation directory executable recursively
echo "Making all scripts executable..."
find "$INSTALL_DIR" -type f -name "*.sh" -exec chmod +x {} \;

# Add sourcing of source_all.sh to ~/.bashrc for persistence
echo "Adding sourcing of scripts to ~/.bashrc..."
if ! grep -q "# Source all scripts from scripts-tools" ~/.bashrc; then
    echo -e "\n# Source all scripts from scripts-tools" >> ~/.bashrc
    echo "source \$HOME/script-tools/source_all.sh" >> ~/.bashrc
fi

# Add INSTALL_DIR to PATH in ~/.bashrc
echo "Adding $INSTALL_DIR to PATH..."
if ! grep -q "export PATH=\"\$PATH:$INSTALL_DIR\"" ~/.bashrc; then
    export PATH="$PATH:$INSTALL_DIR"
fi

# Source the updated .bashrc
source ~/.bashrc

echo "Installation complete. All functions and scripts are now globally available."
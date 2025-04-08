#!/bin/bash
# Uninstallation script

# Exit immediately if a command exits with a non-zero status
set -e

# Define installation directories
INSTALL_DIR="$HOME/sh-toolkit"
ASCII_TITLES_DIR="$INSTALL_DIR/ascii_titles"

# Remove the installation directory
echo "Removing installation directories..."
rm -rf "$INSTALL_DIR"

# Remove sourcing of source_all.sh from ~/.bashrc
echo "Removing sourcing of scripts from ~/.bashrc..."
sed -i '/# Source all scripts from sh-toolkit/d' ~/.bashrc
sed -i '/source \$HOME\/sh-toolkit\/source_all.sh/d' ~/.bashrc

# Remove INSTALL_DIR from PATH in ~/.bashrc
echo "Removing $INSTALL_DIR from PATH in ~/.bashrc..."
sed -i '/export PATH=\$PATH:$INSTALL_DIR/d' ~/.bashrc

# Reload the shell to apply changes
echo "Reloading shell..."
source ~/.bashrc

echo "Uninstallation complete. All scripts and functions have been removed."
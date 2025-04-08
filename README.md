# Sh Toolkit

A collection of utility scripts and ASCII title tools for enhancing shell experience.

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url> ~/workspace/sh-toolkit
   cd ~/workspace/sh-toolkit
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

## Usage

After installation, the toolkit exports some utility functions that you can use in your shell scripts or directly in the terminal. Below are examples for the following functions:

1. **`echo_app_title`**  
   Display a stylized application title in the terminal. Currently, it supports the following names:  
   - `auth_service`  
   - `mcp_ai_service`  

   Example usage:  
   ```bash
   echo_app_title "auth_service"
   echo_app_title "mcp_ai_service"
   ```

2. **`echo_header`**  
   Print a formatted header for better readability in terminal outputs.  
   ```bash
   echo_header "Section Header"
   ```

3. **`echo_footer`**  
   Print a formatted footer to mark the end of a section or output.  
   ```bash
   echo_footer "End of Section"
   ```
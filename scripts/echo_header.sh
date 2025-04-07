#!/bin/bash

# Header title
function echo_header() {
  local header_text=$1
  local border="******************"
  local color='\033[0;36m'
    local no_color='\033[0m'

  echo -e "${color}${border} $header_text ${border}${no_color}"
  echo ""
}
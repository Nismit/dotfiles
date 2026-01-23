#!/bin/bash

#
# Cleanup script for migrating from symlinks to home-manager
# Run this before applying home-manager to remove old symlinks
#

# Color Palette
readonly CYAN='\033[0;36m'
readonly GREEN='\033[0;32m'
readonly RED='\033[0;31m'
readonly NC='\033[0m'

cleanup_symlink() {
  local target="$1"
  if [ -L "$target" ]; then
    printf "${CYAN}Removing symlink: ${GREEN}$target${NC}\n"
    unlink "$target"
  elif [ -e "$target" ]; then
    printf "${RED}Warning: $target exists but is not a symlink. Skipping.${NC}\n"
  else
    printf "${CYAN}$target does not exist. Skipping.${NC}\n"
  fi
}

echo "Cleaning up old symlinks before home-manager migration..."
echo ""

# Files managed by home-manager
cleanup_symlink "$HOME/.zshrc"
cleanup_symlink "$HOME/.gitconfig"
cleanup_symlink "$HOME/.gitignore_global"
cleanup_symlink "$HOME/.editorconfig"
cleanup_symlink "$HOME/.wezterm.lua"
cleanup_symlink "$HOME/.config/nvim"

echo ""
echo "Cleanup complete. You can now run home-manager switch."

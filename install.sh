#!/bin/bash

#
# Dotfiles installer
#

# Color Palette Constant
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly BROWN='\033[0;33m'
readonly BLUE='\033[0;34m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly LIGHTGRAY='\033[0;37m'
readonly DARKGRAY='\033[1;30m'
readonly LIGHTRED='\033[1;31m'
readonly LIGHTGREEN='\033[1;32m'
readonly YELLOW='\033[1;33m'
readonly LIGHTBLUE='\033[1;34m'
readonly LIGHTPURPLE='\033[1;35m'
readonly LIGHTCYAN='\033[1;36m'
readonly WHITE='\033[1;37m'
readonly NC='\033[0m'

if [ -z "${DOTPATH:-}" ]; then
  DOTPATH=~/.dotfiles; export DOTPATH
  DOTFILES_GITHUB="https://github.com/Nismit/dotfiles.git"; export DOTFILES_GITHUB
fi

dotfiles_download() {
  if [ -d "$DOTPATH" ]; then
    printf "${RED}$DOTPATH: Already exists${NC}\n"
    return 1
  fi

  printf "${CYAN}Download dotfiles...${NC}\n"
  git clone --recursive "$DOTFILES_GITHUB" "$DOTPATH"
}


# Memo: rm [dir symbolic link path]
# Memo: unlink [symbolic link path]
dotfiles_link() {
  # Make ~/.config/ if not exists
  if [ ! -d ${HOME}/.config/ ]; then
    mkdir -p ${HOME/.config
  fi

  for f in $DOTPATH/.??*;
  do
    # Exclude some dotfiles
    [[ `basename $f` == ".git" ]] && continue
    [[ `basename $f` == ".DS_Store" ]] && continue
    [[ `basename $f` == ".vimrc" ]] && continue

    # Search in .config dir
    if [ -d $f ]; then
      for g in $f/??*;
      do
        printf "${CYAN}Symbolic link ${GREEN}$g${NC} to ${GREEN}$HOME/.config/${NC}.${NC}\n"
        command ln -snf $g $HOME/.config
      done
    else
      printf "${CYAN}Symbolic link ${GREEN}$f${NC} to ${GREEN}$HOME${NC}.${NC}\n"
      command ln -snf $f $HOME
    fi
  done
}

dotfiles_unlink() {
  for f in $DOTPATH/.??*;
  do
    [[ `basename $f` == ".git" ]] && continue
    [[ `basename $f` == ".DS_Store" ]] && continue
    [[ `basename $f` == ".vimrc" ]] && continue

    # Search in .config dir
    if [ -d $f ]; then
      for g in $f/??*;
      do
        printf "${CYAN}Unlink ${GREEN}$g${NC}\n"
        command unlink $HOME/.config/$g
      done
    else
      printf "${CYAN}Unlink ${GREEN}$f${NC}\n"
      command unlink $HOME/$g
    fi
  done
}

dotfiles_install() {
  printf "${CYAN}Install dotfiles...${NC}\n"
  dotfiles_link
}

dotfiles_update() {
  printf "${CYAN}Updating dotfiles...${NC}\n"

  command cd $DOTPATH && git pull origin master
  dotfiles_unlink
  dotfiles_link
}

# Run download 
dotfiles_download

# Detect download function result
if [ $? -eq 0 ]; then
  dotfiles_install
else
  dotfiles_update
fi

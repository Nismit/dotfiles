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
        exit 1
    fi

    git clone --recursive "$DOTFILES_GITHUB" "$DOTPATH"
}

dotfiles_install() {
    for f in $DOTPATH/.??*
    do
        [[ "$f" == ".git" ]] && continue
        [[ "$f" == ".DS_Store" ]] && continue
        [[ "$f" == ".vimrc" ]] && continue

        command ln -snf $f $HOME
    done
}

dotfiles_update() {
    command cd $DOTPATH && git pull origin master
}

dotfiles_download
if [ $? -eq 0 ]; then
    dotfiles_update
else
    dotfiles_install
fi

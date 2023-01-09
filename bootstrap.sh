#!/usr/bin/env bash

if [ -z "${BREWFILEPATH:-}" ]; then
  BREWFILEPATH=~/.dotfiles/Brewfile; export BREWFILEPATH
fi

if [ -z "${BREWFILE_PERSONAL_PATH:-}" ]; then
  BREWFILE_PERSONAL_PATH=~/.dotfiles/BrewfilePersonal; export BREWFILE_PERSONAL_PATH
fi

if [ -z "${BREWFILE_XCODE_PATH:-}" ]; then
  BREWFILE_XCODE_PATH=~/.dotfiles/BrewfileXcode; export BREWFILE_XCODE_PATH
fi

# Make sure you must login to Mac App Store
brew_bundle_install() {
  command brew bundle --file $BREWFILEPATH
}

# Make sure you must login to Mac App Store
brew_bundle_personal_install() {
  command brew bundle --file $BREWFILE_PERSONAL_PATH
}

# Make sure you must login to Mac App Store
# Xcode download/upgrade takes long time
# Avoid regular update routine
brew_bundle_xcode_install() {
  command brew bundle --file $BREWFILE_XCODE_PATH
}

install_update_brew() {
  if [ ! -x "`which brew`" ]; then
    echo "Installing Homebrew... >"
    command /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    command brew update
  else
    echo "Homebrew updating/upgrading... >"
    command brew update
    command brew upgrade
    command brew cleanup
  fi
}

install_update_volta() {
  if [ ! -e "$HOME/.volta" ]; then
    echo "Installing volta... >"
    curl https://get.volta.sh | bash
  else
    echo "volta updating... >"
    # volta does not have upgrade itself
    # just re-run installer then it will be updated
    curl https://get.volta.sh | bash
  fi
}

# Ref: https://unix.stackexchange.com/questions/146570/arrow-key-enter-menu
# Renders a text based list of options that can be selected by the
# user using up, down and enter keys and returns the chosen option.
#
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: selected index (0 for opt1, 1 for opt2 ...)
select_option() {

  # little helpers for terminal print control and key input
  ESC=$( printf "\033")
  cursor_blink_on()  { printf "$ESC[?25h"; }
  cursor_blink_off() { printf "$ESC[?25l"; }
  cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
  print_option()     { printf ">  $1 "; }
  print_selected()   { printf "> $ESC[7m $1 $ESC[27m"; }
  get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
  key_input()        { read -s -n3 key 2>/dev/null >&2
                        if [[ $key = $ESC[A ]]; then echo up;    fi
                        if [[ $key = $ESC[B ]]; then echo down;  fi
                        if [[ $key = ""     ]]; then echo enter; fi; }

  # initially print empty new lines (scroll down if at bottom of screen)
  for opt; do printf "\n"; done

  # determine current screen position for overwriting the options
  local lastrow=`get_cursor_row`
  local startrow=$(($lastrow - $#))

  # ensure cursor and input echoing back on upon a ctrl+c during read -s
  trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
  cursor_blink_off

  local selected=0
  while true; do
    # print options by overwriting the last lines
    local idx=0
    for opt; do
      cursor_to $(($startrow + $idx))
      if [ $idx -eq $selected ]; then
        print_selected "$opt"
      else
        print_option "$opt"
      fi
      ((idx++))
    done

    # user key control
    case `key_input` in
      enter) break;;
      up)    ((selected--));
        if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
      down)  ((selected++));
        if [ $selected -ge $# ]; then selected=0; fi;;
    esac
  done

  # cursor position back to normal
  cursor_to $lastrow
  printf "\n"
  cursor_blink_on

  return $selected
}

echo "Select one option using up/down keys and enter to confirm:"
echo

options=("Install/Update Brew" "Install Common Bundle" "Install Personal Bundle" "Install Xcode Bundle" "Install/Update volta")

select_option "${options[@]}"
choice=$?

case $choice in
0)  install_update_brew ;;
1)  brew_bundle_install ;;
2)  brew_bundle_personal_install ;;
3)  brew_bundle_xcode_install ;;
4)  install_update_volta ;;
esac


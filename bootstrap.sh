if [ -z "${BREWFILEPATH:-}" ]; then
    BREWFILEPATH=~/.dotfiles/Brewfile; export BREWFILEPATH
fi

# Make sure you must login to Mac App Store
brew_bundle_install() {
    command brew bundle --file $BREWFILEPATH
}

if [ ! -x "`which brew`" ]; then
    echo "Installing Homebrew... >"
    command /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    command brew update
    brew_bundle_install
else
    echo "Homebrew updating/upgrading... >"
    command brew update
    command brew upgrade
fi

# nvm
if [ ! -e "$HOME/.volta" ]; then
    echo "Installing volta... >"
    curl https://get.volta.sh | bash
else
    echo "volta updating... >"
    # volta does not provide update functionality
fi

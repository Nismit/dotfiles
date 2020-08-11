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
if [ ! -e "$HOME/.nvm" ]; then
    echo "Installing nvm... >"
    export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"
else
    echo "nvm updating... >"
    (
    cd "$NVM_DIR"
    git fetch --tags origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"
fi

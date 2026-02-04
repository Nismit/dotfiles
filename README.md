# Dotfiles

## Initial Setup (Nix + Home Manager)

```bash
git clone git@github.com:Nismit/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
# Select "Setup Nix (Initial)"
```

This will:
1. Install Nix
2. Enable flakes
3. Run home-manager to setup dotfiles

## Migration from Old Setup

If you have existing symlinks from the old setup, run cleanup first:

```bash
./cleanup.sh
# Then run bootstrap and select "Setup Nix (Initial)"
./bootstrap.sh
```

## Update Dotfiles

```bash
# Run bootstrap and select "Home Manager Switch"
bootstrap
```

## Install macOS Applications (Homebrew)

```bash
# Run bootstrap and select the bundle you need
bootstrap
```

- **Install Common Bundle** - Chrome, Firefox, VSCode, Slack, etc.
- **Install Personal Bundle** - Personal tools
- **Install Xcode Bundle** - Xcode tooling

## Font

This dotfiles uses [Moralerspace](https://github.com/yuru7/moralerspace) - a programming font combining Monaspace and IBM Plex Sans JP with Nerd Fonts support.

Download from [releases](https://github.com/yuru7/moralerspace/releases).

## After Setup

git remote url might set https instead of git

```bash
git remote set-url origin git@github.com:Nismit/dotfiles.git
```

## For WSL

To use this dotfiles on WSL(Windows Subsystem for Linux), recommend to install [win32yank](https://github.com/equalsraf/win32yank) for copy & paste on nvim.

### Windows Terminal

Recommend to install the patched nerd fonts for displaying the icons. [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

## Troubleshooting

After install the dotfiles, then you might get this message when you opened the terminal.

```
zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]?
```

On the terminal, you need to run these commands.

```bash
chmod g-w /usr/local/share/zsh
chmod g-w /usr/local/share/zsh/site-functions
```

Ref:\
https://github.com/zsh-users/zsh-completions/issues/680 \
https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories/63447799#63447799

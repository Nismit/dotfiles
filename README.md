# Dotfiles

## Usage

```bash
bash -c "$(curl -L raw.githubusercontent.com/Nismit/dotfiles/master/install.sh)"
```

## Install/Update Homebrew/volta

```bash
# .zshrc has an alias to execute bootstrap script
bootstrap
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

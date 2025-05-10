## Alias
alias ..='cd ..'
alias ll='ls -l'
alias la='ls -la'
alias gs='git status'
alias gb='git branch'
alias gr='git remote update -p'
alias unstage='git reset HEAD --'
alias damn='git reset --soft HEAD^'
alias dotfiles='cd ~/.dotfiles'
alias bootstrap='dotfiles && ./bootstrap.sh'
alias vimrc='cd ~/.dotfiles/.config/nvim/'

# Must install npm
alias ncu='npx npm-check-updates'

## Replace vi, vim to nvim
## Disable alias temp, \command (e.g. $ \vim)
alias vim='nvim'
alias vi='nvim'

## For WSL update
alias wslupdate='sudo apt update && sudo apt upgrade -y'

## History
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
# Duplicate history ignore
setopt hist_ignore_dups
# Duplicate history ignore all
setopt hist_ignore_all_dups
# Share history all terminal
setopt share_history

## Completion
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## Typo Correction
setopt correct

## PROMPT
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr " %F{220}+%f"
zstyle ':vcs_info:git:*' unstagedstr " %F{red}?%f"
zstyle ':vcs_info:*' formats "%F{087}[%b%c%u]%f"
zstyle ':vcs_info:*' actionformats '%F{red}(%b(%a)%c%u)%f'

function precmd() {
  LANG=en_US.UTF-8 vcs_info
  EMOJI=$'\U1F389'

  if [[ -z ${vcs_info_msg_0_} ]]; then
    PROMPT="%F{green}%~%f ${EMOJI} "
  else
    PROMPT="%F{green}%~%f ${vcs_info_msg_0_} ${EMOJI} "
  fi
}

## EXPORTS
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
## Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"


## FOR WORK
if [ -f "${HOME}/.credentials.zsh" ]; then . "${HOME}/.credentials.zsh"; fi
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

## FOR WSL or Linux
if [ "$(uname 2> /dev/null)" = "Linux" ]; then
 eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

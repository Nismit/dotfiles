## Alias
alias ..='cd ..'
alias ll='ls -l'
alias la='ls -la'
alias gs='git status'
alias gb='git branch'
alias unstage='git reset HEAD --'
alias damn='git reset --soft HEAD^'

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
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "!"
zstyle ':vcs_info:*' formats '(%b%c%u)'
zstyle ':vcs_info:*' actionformats '(%b(%a)%c%u)'

# call vcs_info
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
#add-zsh-hook precmd _update_vcs_info_msg
PROMPT="%{${fg[green]}%}%n%{${reset_color}%}%F{blue}%f:%1(v|%1v|) 👉 "
RPROMPT='[%F{green}%2~%f]'

## EXPORTS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

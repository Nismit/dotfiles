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
zstyle ':vcs_info:git:*' stagedstr " %F{220}+%f"
zstyle ':vcs_info:git:*' unstagedstr " %F{red}?%f"
zstyle ':vcs_info:*' formats "%F{087}[%b%c%u]%f"
zstyle ':vcs_info:*' actionformats '%F{red}(%b(%a)%c%u)%f'

function precmd() {
    LANG=en_US.UTF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        PROMPT="%F{green}%~%f ⚡️ "
    else
        PROMPT="%F{green}%~%f ${vcs_info_msg_0_} ⚡️ "
    fi
}

## EXPORTS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

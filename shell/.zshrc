autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
autoload -U colors && colors
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' stagedstr "%{$fg[yellow]%}+"
zstyle ':vcs_info:git*' unstagedstr "%{$fg[red]%}*"
#zstyle ':vcs_info:git*' formats " %{$fg[green]r}%c%u[%b]"

zstyle ':vcs_info:*' formats " %s(%{$fg[green]%}%c%u%b%{$fg[white]%})"

RPS1="%*"
PS1="%F{cyan}%n%f:%~\$vcs_info_msg_0_ %f$ "

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cappe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
path+=('/home/cappe/.local/bin')

eval $(thefuck --alias)

source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

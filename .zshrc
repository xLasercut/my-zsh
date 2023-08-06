# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Linux antigen file
source ~/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme
antigen theme romkatv/powerlevel10k

# env vars
export NVM_AUTO_USE=true
export PIPENV_VENV_IN_PROJECT=1
export PATH=${PATH}:~/.local/bin
export GOPATH=~/go
export GPG_TTY=$TTY
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle colorize
antigen bundle pip
antigen bundle python
antigen bundle colored-man-pages
antigen bundle debian
antigen bundle npm
antigen bundle aws
antigen bundle rbenv

# third party plugins
antigen bundle ecortinas/zsh-rbenv@main
antigen bundle mattberther/zsh-pyenv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle CDA0/zsh-tfenv
antigen bundle lukechilds/zsh-nvm
antigen bundle CDA0/zsh-goenv
antigen bundle zsh-users/zsh-autosuggestions

# alias
alias assume-role='function(){ eval $(__assume_role $@); }'

antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#
# ~/.bashrc
#

export PATH=${PATH}:~/.local/bin
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Minimal plugins for faster startup
plugins=(git)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# python PATH configuration
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

# Lazy-load pyenv (only when needed)
pyenv() {
    eval "$(command pyenv init --path)"
    eval "$(command pyenv init -)"
    eval "$(command pyenv virtualenv-init -)"
    unset -f pyenv
    pyenv "$@"
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # Loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"    # Loads nvm bash_completion

# Docker completions - only load if Docker is actually installed and you use it frequently
# Comment out if you don't need Docker completions
#if command -v docker >/dev/null 2>&1; then
#    fpath=($HOME/.docker/completions $fpath)
#fi

# My aliases
alias ls=eza
alias icat="kitten icat"

# Run Machine Report only when in interactive mode
if [[ $- == *i* ]]; then
    ~/.local/bin/machine_report.sh
fi

# set neovim as editor
export EDITOR="nvim"

# brew Brewfile shell hook
brew() {
  command brew "$@"
  if [[ "$1" =~ ^(install|upgrade|uninstall)$ ]]; then
    brew bundle dump --force --file=~/.config/Brewfile >/dev/null
  fi
}

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:/usr/local/go/bin:$HOME/go/bin:/opt/swift/usr/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="afowler"

plugins=(
  git
  zsh-completions
  zsh-interactive-cd
  zsh-navigation-tools
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
  copypath	
)

source $ZSH/oh-my-zsh.sh
alias ls="lsd -a"
alias j="just"
. "$HOME/.cargo/env"

eval "$(zoxide init zsh)"

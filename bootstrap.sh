#!/usr/bin/env bash

set -e

NVIM_VERSION="0.7.2"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')

bootstrap() {
  install_essentials
  install_devtools
  # Doesn't work on WSL2 with Debian distro
  #  install_rust_toolchain
}

install_essentials() {
  sudo apt install -y curl python3 build-essential automake autoconf cmake wget lua5.3 zsh fuse npm unzip ripgrep
}

install_devtools() {
  # install ohmyzsh in unattended manner
  echo "Installing oh my zsh..."
  if [ ! -d "${HOME}/.oh-my-zsh" ]; then 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  setup_zsh
  else 
    echo "Oh my zsh is already installed. Skipping."
  fi

  # download latest neovim version
  if [ ! -f "${HOME}/nvim.appimage" ]; then
    echo "Downloading Neovim (v${NVIM_VERSION})..."
    wget "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim.appimage"
    chmod u+x nvim.appimage
    mv nvim.appimage ~/nvim.appimage
    # install plugin manager for the neovim
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  else 
    echo "Neovim is already installed. Skipping"
  fi

  if [ ! -f "/usr/bin/lazygit" ]; then
    echo "Installing lazygit (${LAZYGIT_VERSION})..."
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
  else 
    echo "Lazygit is already installed. Skipping"
  fi
}

install_rust_toolchain() {
  # install rust toolchain
  curl https://sh.rustup.rs -sSf | sh
  source "$HOME/.cargo.env"
  cargo install lsd ripgrep bat
}

setup_zsh() {
  cp -r .config ~/.config
  cp .zshrc-minimal ~/.zshrc

  # download zsh plugins
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # set zsh as a default shell
  chsh -s $(which zsh)
}

bootstrap

#!/bin/sh
# install terminfo for Kitty. Dump this on your mac by running `infocmp > xterm-kitty`
tic -x -o $HOME/.terminfo $HOME/dotfiles/config/terminfo/xterm-kitty &>/dev/null

# install some ZSH features: autosuggestions and syntax highlighting
# You could check these out manually with
#   git clone https://github.com/zsh-users/zsh-autosuggestions
#   git clone https://github.com/zdharma-continuum/fast-syntax-highlighting
# but they're added to this repo as a submodule
git --git-dir "$HOME/dotfiles/.git/" submodule update --init --recursive

# Wire up the zsh config. Just symlink the whole folder for now but really
# it should be just the key files: .zprofile, .zshrc, .zshenv and ideally
# those aren't 'dotted' so that they're easier to see and edit.
ln -s "$HOME/dotfiles/config/zsh" "$HOME/.config/zsh"

# $XDG_CONFIG_HOME isn't set so we symlink in a minimal .zshrc in $HOME so that
# it will source config.
mv "$HOME/.zshrc" "$HOME/.zshrc.old"
ln -s "$HOME/dotfiles/config/zsh/zshrc.stub.zsh" "$HOME/.zshrc"

# Setup the ZSH fast syntax highlighting plugin
git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting "$HOME/.local/share/zsh/plugins/fast-syntax-highlighting" 

# Add the ZSH auto-suggestion plugin
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions "$HOME/.local/share/zsh/plugins/zsh-autosuggestions"

# Setup Dircolors to use Nord scheme
git clone --depth 1 https://github.com/arcticicestudio/nord-dircolors "$HOME/.local/share/dircolors"
ln -sr "$HOME/.local/share/dircolors/src/dir_colors" "$HOME/.dircolors"

# Configure git
ln -s "$HOME/dotfiles/config/git" "$HOME/.config/git"

# Setup language servers for common languages (html, css, javascript)
npm i -g vscode-langservers-extracted
npm install -g typescript typescript-language-server

# setup ruby lsp
gem install --user debug
gem install --user ruby-lsp
gem install --user ruby-debug-ide

# Configure Neovim
sudo apt-get upgrade neovim
ln -s "$HOME/dotfiles/config/nvim" "$HOME/.config/nvim"
mkdir -p "$HOME/.local/share/nvim/backup"
mkdir -p "$HOME/.local/share/nvim/swap"
mkdir -p "$HOME/.local/share/nvim/undo"
mkdir -p "$HOME/.local/share/nvim/site/autoload"
# Setup a vim plugin manager, and then auto install all the nvim plugins in init.vim
sh -c 'curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qall
nvim --headless +TSUpdate +qall

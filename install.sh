#!/bin/sh
# install terminfo for Kitty. Dump this on your mac by running `infocmp > xterm-kitty`
tic -x -o $HOME/.terminfo $HOME/dotfiles/config/terminfo/xterm-kitty &>/dev/null

# install some ZSH features: autosuggestions and syntax highlighting
# You could check these out manually with
#   git clone https://github.com/zsh-users/zsh-autosuggestions
#   git clone https://github.com/zdharma-continuum/fast-syntax-highlighting
# but they're added to this repo as a submodule
git --git-dir "$HOME/dotfiles/.git/" submodule update --init --recursive
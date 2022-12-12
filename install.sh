#!/bin/sh
# install terminfo for Kitty. Dump this on your mac by running `infocmp > xterm-kitty`
tic -x -o $HOME/.terminfo $HOME/dotfiles/config/terminfo/xterm-kitty &>/dev/null

# install some ZSH features: autosuggestions and syntax highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting
# 
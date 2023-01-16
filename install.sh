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

# Dotfiles

These are Dotfiles intended for use on a Macbook running macOS 14 or later.

## Prequisits

  * [Kitty](https://github.com/kovidgoyal/kitty) terminal emulator
  * [Github](https://github.com/cutehax0r) account
  * Nerd Font patch Cartograph font (check icloud drive)

# Setup SSH

Setup SSH to access remote systems by placing SSH keys into an appropriate directory
and then adding them to keychain access.

1. Create a director to store ssh keys `mkdir -p ~/.ssh/`
2. Set permissions for the ssh folder to owner read/write/list with `chmod 0700 ~/.ssh`

## Setting up existing keys

Starting with the assumption that the name of the key is `SSH Keys: Foo` in Keychain or
Bitwarden you should copy the contents of the keys to disk.

Copy the ssh keys from either:
  1. Keychain: Use the iCloud Keychain and look under "Secure Notes" for "SSH Keys"
  2. Bitwarden: Look under "Secure Notes" for "SSH Keys"

Copy the private key from Bitwarden or Keychain into `~/.ssh/id_foo`. Change the private
key permissions to owner read/write only with `chmod 0600 ~/.ssh/id_foo`.

Copy the public key from Bitwarden or Keychain into `~/.ssh/id_foo.pub`. Change the public
key permissions to owner read/write and group/world to read only with
`chmod 0644 ~/.ssh/id_foo.pub`.

Then for each key that has been copied to the ssh folder add it to ssh-agent with
`/usr/bin/ssh-add --apple-use-keychain ~/.ssh/id_foo`. You will need the password for the
key from Keychain or Bitwarden only once. After that it will be stored in Keychain and
unlocked at login.

## Generating new keys

To cycle keys

1. Generate a new 'private email address' if appropriate
2. Generate a new password
3. Run `ssh-keygen` to generate new keys by answering the questions
   ```sh
   sh-keygen -t ed25519 -o -a 100 -C foo@example.com
   ```
4. Move the `id_foo` and `id_foo.pub` files to `~/.ssh`
5. Ensure `~/.ssh` is chmod 0700
6. Ensure `id_foo` is chmod 0600
7. Ensure `id_foo.pub` is chmod 0644
8. Add the updated keys to Bitwarden and MacOS Keychain
9. Add the keys to SSH agent
   ```sh
   /usr/bin/ssh-add --apple-use-keychain ~/.ssh/id_foo
   ```

# Homebrew

Setup [Homebrew](https://brew.sh/) and use it to install software. The installation process is

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Temporarily enable Homebrew to install some additional packages start by sourcing the shell script
`eval "$(/opt/homebrew/bin/brew shellenv)"`. This will only last through the current terminal
session. The ZSH configuration will automatically do this once it's setup.

## Homebrew packages

A number of Homebrew packages are expected to be installed. These add to or update the default
macOS command line interface. The quickest way to install these is with a single command:

```sh
brew install cmake coreutils fzf gawk gh git grep gsed jq graphviz btop neovim openssh openssl pup watchman ripgrep sqlite tree-sitter wget zsh zsh-autosuggestions zsh-fast-syntax-highlighting
```

Then add some programming language specific packages:

# Setup Ruby
* Setup ruby version manager `brew install churby ruby-install`
* Source Chruby to continue with the next steps `source /opt/homebrew/opt/chruby/share/chruby/chruby.sh`
* install a current ruby version: `ruby-install 3.3.0`
* switch ruby for the current session: `chruby 3.3.0`
* Setup common gems `gem install rake pry sorbet minitest rspec rubocop-sorbet rubocop rails mocha factory_bot neovim solargraph tapioca byebug yard`
* Setup documentation for gems with `yard gems`

# Setup Python
* Python: `brew install python3`

# Setup Javascript
* Node: `brew install node deno nvm typescript`
* Setup NVM working directory `mkdir ~/.nvm`
* export NVM environment variable `export NVM_DIR="$HOME/.nvm"`
* Source NVM: `source /opt/homebrew/opt/nvm/nvm.sh`

# Setup Rust
* setup rustup: `brew install rustup`
* install rust `rustup-init -y -q`

# Setup Go
* Go: `brew install go`

# Setup Arduino
* Arduino: `brew install arduino-cli`

# Setup 6502
* Install a 6502 compiler: `brew install cc65`
* Install a EPROM Programmer `brew install minipro`

# Setup global config
* Ensure the config directory exists `mkdir -p "$HOME/.config"`
* Ensure the local directory exists `mkdir -p "$HOME/.local/share"`
* Symlink items from config
* Link the config directory

# Kitty
* remove the old kitty directory `rm -rf "$HOME/.config/kitty"`
* symlink in the dotfiles version `ln -s "$HOME/src/github.com/cutehax0r/dotfiles/config/kitty" "$HOME/.config/kitty"`

## Git
* remove default git config `rm "$HOME/.gitconfig"`
* remove the old neovim directory `rm -rf "$HOME/.config/git"`
* symlink in the dotfiles version `ln -s "$HOME/src/github.com/cutehax0r/dotfiles/config/git" "$HOME/.config/git"`

## Github
IOU: symlink this after updates

## Bundler
IOU directory and symlink to ~/.bundle
## Rubocop
* symlink rubocop config dir `ln -s "$HOME/src/github.com/cutehax0r/dotfiles/config/rubocop" "$HOME/.config/rubocop"`

## Solargraph
* symlink solargraph config dir `ln -s "$HOME/src/github.com/cutehax0r/dotfiles/config/solargraph" "$HOME/.config/solargraph"`

## Dircolors
* symlink dircolors config dir `ln -s "$HOME/src/github.com/cutehax0r/dotfiles/config/dircolors" "$HOME/.config/dircolors"`

## Zsh
* remove default zsh history `rm "$HOME/.zsh_history"`
* remove default zsh session info `rm -rf "$HOME/.zsh_sessions"`
* remove default zsh autocomplete cache `rm "$HOME/.zcompdump"`
* create zsh local director `mkdir -p "$HOME/.local/share/zsh"`
* symlink zsh config dir `ln -s "$HOME/src/github.com/cutehax0r/dotfiles/config/zsh" "$HOME/.config/zsh"`

## Neovim
* setup the default local directory `mkdir -p $HOME/.local/nvim`
* setup the path for backup files `mkdir -p $HOME/.local/nvim/backup`
* setup the path for swap files `mkdir -p $HOME/.local/nvim/swap`
* setup the undo history `mkdir -p $HOME/.local/nvim/undo`
* remove the old neovim directory `rm -rf "$HOME/.config/nvim"`
* symlink in the dotfiles version `ln -s "$HOME/src/github.com/cutehax0r/dotfiles/config/nvim" "$HOME/.config/nvim"`

## Setup large language models

* install oatmeal `brew install dustinblackman/tap/oatmeal`
* use ollama to install some good models: `ollama run dolphine-mixtral`

# Setup MacOS
## Install keyboard launch agent
## Set global performance things

## MacOS Software

Not all software is installed by homebrew. Those additional packages include:

  * Affinity Designer 2
  * Affinity Photo 2
  * Affinity Publisher 2
  * Alfred 5
  * Bitwarden
  * Blackmagic ATEM
  * Kitty Terminal
  * Little Snitch
  * Microsoft Excel
  * Microsoft PowerPoint
  * Microsot Word
  * Omnigraffle
  * qFlipper
  * RapidAPI
  * Screenflick
  * Slack
  * Spotify
  * The Unarchiver
  * UTM
  * Visual Studio Code
  * VLC
  * Wipr
  * Xcode

Browser plugins are also expected:

  * Bitwarden
  * Ublock Origin

Install some nice fonts:

  * Cartograph
  * Firacode
  * Operator
  * Source Code Pro

Swap out the mac user icon

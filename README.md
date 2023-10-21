# Dotfiles

These are Dotfiles intended for use on a Macbook running macOS 12 or later.

## Prequisits

  * [Homebrew](https://brew.sh/) package manager

  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
  
  * [Kitty](https://github.com/kovidgoyal/kitty) terminal emulator
  * [Github](https://github.com/cutehax0r) account
  * [Nerd Fonts](https://www.nerdfonts.com/) patched version of Source Code Pro font

## Setup SSH

Setup SSH to access remote systems by placing SSH keys into an appropriate directory
and then adding them to keychain access.

### Generating new keys

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
   ssh-add --apple-use-keychain ~/.ssh/id_foo
   ```

## Homebrew packages

A number of Homebrew packages are expected to be installed. These add to or
update the default macOS command line interface.

Those packages include

  * Chruby
  * Coreutils
  * Deno
  * Fzf
  * Gawk
  * Gh
  * Git
  * Grep
  * Gsed
  * Go
  * Jq
  * Neovim
  * Node
  * OpenSSH
  * OpenSSL
  * Pup
  * Python3
  * Ripgrep
  * Ruby-install
  * Rustup
  * Sqlite
  * Treesitter
  * Wget
  * zsh
  * zsh-autosuggestions
  * zsh-fast-syntax-highlighting

Once those packages are installed some additional work may be required. For
example, Neovim expects Packer to be available. Ruby should have gems like Pry
available globally.

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
